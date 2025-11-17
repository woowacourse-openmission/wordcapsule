import {apiUtil} from "../util/apiUtil.js";
import {getUserId} from "../util/loginUtil.js";

let currentUserId;

// --- 1. API 함수 ---

const fetchQuizGame = async () => {
    const userId = await getUserId();
    currentUserId = userId;

    try {
        // configId를 URL 파라미터에서 가져오도록 수정
        // 예: /quiz/game/1
        const pathParts = window.location.pathname.split('/');
        // URL의 마지막 부분을 ID로 사용
        const id = pathParts[pathParts.length - 1] || userId;

        // isNaN 체크를 통해 유효한 숫자인지 확인, 아니면 기본값 1 사용
        const validUserId = isNaN(parseInt(id)) ? userId : parseInt(id);

        // [수정] 랜덤 퀴즈 API로 변경
        const response = await apiUtil.get(`/quiz/config/random?userId=${validUserId}`);

        // [수정] 응답이 없거나 status가 없는 경우 에러 처리
        if (!response || !response.status) {
            console.error("알 수 없는 에러: 유효하지 않은 응답.", response);
            return {status: "ERROR", quiz: null, validUserId};
        }

        // [수정] API 응답 상태에 따라 분기
        switch (response.status) {
            case "AVAILABLE":
                console.log("퀴즈 데이터 로드 성공:", response.quiz);
                return {status: "AVAILABLE", quiz: response.quiz, validUserId};
            case "LEVEL_COMPLETED":
                console.log("모든 퀴즈 완료", response);
                return {status: "LEVEL_COMPLETED", quiz: null, validUserId};
            case "USER_NOT_FOUND":
                console.error("일치하는 아이디를 찾을 수 없음", id);
                return {status: "ERROR", quiz: null, validUserId};
            default:
                console.error("알 수 없는 상태:", response.status);
                return {status: "ERROR", quiz: null, validUserId};
        }

    } catch (e) {
        console.error("퀴즈를 불러오는 데 실패했습니다.", e);
        return {status: "ERROR", quiz: null, validUserId: 1}; // 오류 발생 시
    }
};

const submitQuizGame = async (request) => {
    try {
        const response = await apiUtil.post(`/quiz/record`, request);
        console.log("퀴즈 기록 생성 성공:", response);
        return response;
    } catch (e) {
        console.error("퀴즈 기록 생성에 실패함.", e);
        return null; // 오류 발생 시 null 반환
    }
};

/**
 * Date 객체를 브라우저의 로컬 시간 기준 'yyyy-MM-ddTHH:mm:ss' 형식으로 변환합니다.
 */
const formatForLocalDateTime = (date) => {
    const pad = (num) => num.toString().padStart(2, '0');

    const year = date.getFullYear();
    const month = pad(date.getMonth() + 1); // Month is 0-indexed
    const day = pad(date.getDate());
    const hours = pad(date.getHours());
    const minutes = pad(date.getMinutes());
    const seconds = pad(date.getSeconds());

    return `${year}-${month}-${day}T${hours}:${minutes}:${seconds}`;
};


// --- [신규] 모달 관련 함수 ---

let modalStylesInjected = false;

/** 모달에 필요한 CSS를 <head>에 동적으로 주입합니다. (1회만 실행) */
const createModalStyles = () => {
    if (modalStylesInjected) return;

    const style = document.createElement('style');
    style.innerHTML = `
        .quiz-modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        .quiz-modal-content {
            background-color: var(--color-bg);
            padding: 24px;
            border-radius: 12px;
            width: 90%;
            max-width: 360px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .quiz-modal-content p {
            font-size: 1.1rem;
            margin-bottom: 20px;
            color: var(--color-text);
            line-height: 1.5;
        }
        /* .btn-primary 스타일은 전역 CSS의 것을 활용 */
    `;
    document.head.appendChild(style);
    modalStylesInjected = true;
};

/** [신규] 레벨업 안내 모달을 표시합니다. */
const showLevelUpModal = (contextPath, userId) => {
    // 스타일 주입
    createModalStyles();

    // 1. 오버레이 생성
    const overlay = document.createElement('div');
    overlay.className = 'quiz-modal-overlay';

    // 2. 모달 컨텐츠 생성
    const modalContent = document.createElement('div');
    modalContent.className = 'quiz-modal-content';

    // 3. 메시지 생성
    const message = document.createElement('p');
    message.textContent = '현재 레벨의 문제를 전부 풀었어요!';

    // 4. 버튼 생성
    const levelUpButton = document.createElement('button');
    levelUpButton.className = 'btn-primary'; // 전역 스타일 재사용
    levelUpButton.textContent = '레벨 올리기';
    levelUpButton.onclick = () => {
        window.location.href = `${contextPath}/users/edit`;
    };

    // 5. DOM에 조립
    modalContent.appendChild(message);
    modalContent.appendChild(levelUpButton);
    overlay.appendChild(modalContent);
    document.body.appendChild(overlay);
};


// --- 2. 퀴즈 게임 상태 관리 ---
let quizData = null;            // 서버에서 받은 퀴즈 전체 데이터
let currentQuestionIndex = 0;   // 현재 질문 인덱스
let totalQuestions = 0;         // 총 질문 수
let userAnswersMap = new Map(); // 사용자의 답변 기록 (quizId -> { optionId, isCorrect, questionNumber })
let startedAt = "";             // 퀴즈 시작 시간


// --- 7. 게임 시작 (DOM 로드 후) ---
document.addEventListener("DOMContentLoaded", () => {

    // --- 3. DOM 요소 참조 ---
    const loader = document.getElementById("quiz-loader");
    const gameContainer = document.getElementById("quiz-game-container");

    if (!loader || !gameContainer) {
        console.error("퀴즈 게임의 필수 DOM 요소를 찾을 수 없습니다. (game.jsp 확인 필요)");
        if (loader) {
            loader.innerHTML = `<span style="color: var(--color-error); font-weight: 500;">페이지 오류: 게임 요소를 로드할 수 없습니다.</span>`;
        }
        return; // 스크립트 실행 중단
    }

    const contextPath = gameContainer.dataset.contextPath; // JSP에서 전달받은 contextPath

    // 헤더
    const quizTitleEl = document.getElementById("quiz-title");
    const progressTextEl = document.getElementById("progress-text");
    const progressBarInnerEl = document.getElementById("progress-bar-inner");

    // 질문/선택지
    const questionContentEl = document.getElementById("question-content");

    // [수정] 선택지 컨테이너 참조
    const optionsContainer = document.querySelector(".options-container");
    const optionsListEl = document.getElementById("options-list");
    const sentenceContainer = document.getElementById("sentence-container");
    const sentenceAnswerBox = document.getElementById("sentence-answer-box");
    const sentenceOptionsBox = document.getElementById("sentence-options-box");

    // 푸터
    const nextButton = document.getElementById("next-button");


    // --- 4. 퀴즈 렌더링 함수 ---

    /** 현재 인덱스에 맞는 질문과 선택지를 화면에 그립니다. */
    const renderQuestion = (index) => {
        if (!quizData || !quizData.quizzes) return;

        const quiz = quizData.quizzes[index];
        if (!quiz) return;

        // 1. 헤더 업데이트 (최초 1회만)
        if (index === 0) {
            quizTitleEl.textContent = quizData.quizName;
        }

        // 2. 진행 상태 업데이트
        progressTextEl.textContent = `${index + 1} / ${totalQuestions}`;
        progressBarInnerEl.style.width = `${((index + 1) / totalQuestions) * 100}%`;

        // 3. 질문 업데이트
        questionContentEl.textContent = quiz.content;

        // 4. [수정] 퀴즈 타입에 따라 UI 분기
        if (quiz.quizType === 'SENTENCE_ORDER') {
            optionsListEl.style.display = 'none';
            sentenceContainer.style.display = 'flex';
            renderSentenceOrderQuiz(quiz);
        } else {
            // WORD_MEANING, WORD_MATCHING, FILL_BLANK
            sentenceContainer.style.display = 'none';
            optionsListEl.style.display = 'flex';
            renderMultipleChoiceQuiz(quiz);
        }

        // 5. 버튼 상태 업데이트
        nextButton.disabled = true; // 새 질문이 나오면 항상 비활성화

        if (index === totalQuestions - 1) {
            nextButton.textContent = "결과 제출";
        } else {
            nextButton.textContent = "다음 문제";
        }
    };

    /** [신규] 객관식 퀴즈 UI를 렌더링합니다. */
    const renderMultipleChoiceQuiz = (quiz) => {
        optionsListEl.innerHTML = ""; // 목록 초기화
        quiz.options.forEach(option => {
            const li = document.createElement("li");
            li.classList.add("option-item");
            li.textContent = option.content;

            // 데이터셋에 필요한 정보 저장
            li.dataset.optionId = option.optionId;
            li.dataset.isCorrect = option.isCorrect;
            li.dataset.quizId = quiz.quizId;

            optionsListEl.appendChild(li);
        });
    };

    /** [신규] 문장 순서 퀴즈 UI를 렌더링합니다. */
    const renderSentenceOrderQuiz = (quiz) => {
        sentenceAnswerBox.innerHTML = ''; // 정답 영역 초기화
        sentenceOptionsBox.innerHTML = ""; // 선택 영역 초기화

        // [중요] DB에서 받은 정답 순서의 옵션을 무작위로 섞습니다.
        const shuffledOptions = [...quiz.options].sort(() => Math.random() - 0.5);

        shuffledOptions.forEach(option => {
            const chip = document.createElement("div");
            chip.classList.add("sentence-chip");
            chip.textContent = option.content;
            chip.dataset.optionId = option.optionId;
            chip.dataset.quizId = quiz.quizId;
            // (isCorrect와 position은 칩에 저장하지 않음 - 정답 노출 방지)

            sentenceOptionsBox.appendChild(chip);
        });
    };


    // --- 5. 이벤트 핸들러 ---

    /** [신규] 모든 선택지 클릭을 처리하는 이벤트 위임 핸들러 */
    const handleAnswerClick = (e) => {
        const mcOption = e.target.closest('.option-item');
        const soChip = e.target.closest('.sentence-chip');

        if (mcOption) {
            handleOptionClick(mcOption);
        } else if (soChip) {
            handleSentenceOrderClick(soChip);
        }
    };

    /** 객관식(option-item) 클릭 시 호출됩니다. */
    const handleOptionClick = (selectedLi) => {
        // 1. 모든 선택지에서 'selected' 클래스 제거
        const allOptions = optionsListEl.querySelectorAll(".option-item");
        allOptions.forEach(option => option.classList.remove("selected"));

        // 2. 클릭한 선택지에 'selected' 클래스 추가
        selectedLi.classList.add("selected");

        // 3. '다음' 버튼 활성화
        nextButton.disabled = false;
    };

    /** [신규] 문장 순서(sentence-chip) 클릭 시 호출됩니다. */
    const handleSentenceOrderClick = (selectedChip) => {
        // 1. 정답 영역(Answer Box)에 있었는지, 선택 영역(Options Box)에 있었는지 확인
        if (selectedChip.parentElement === sentenceOptionsBox) {
            // 선택 영역 -> 정답 영역으로 이동
            sentenceAnswerBox.appendChild(selectedChip);
        } else {
            // 정답 영역 -> 선택 영역으로 이동
            sentenceOptionsBox.appendChild(selectedChip);
        }

        // 2. '다음' 버튼 활성화/비활성화
        // 정답 영역에 칩이 하나라도 있으면 활성화
        nextButton.disabled = sentenceAnswerBox.children.length === 0;
    };


    /** '다음' 또는 '제출' 버튼 클릭 시 호출됩니다. */
    const handleNextClick = async () => {

        const quiz = quizData.quizzes[currentQuestionIndex];

        // [핵심 수정] 퀴즈 타입에 따라 userAnswersMap에 저장하는 로직 분기
        if (quiz.quizType === 'SENTENCE_ORDER') {
            // --- 문장 순서 퀴즈 ---

            // 1. 사용자가 정렬한 칩 (정답 영역에 있는 칩)
            const answerChips = sentenceAnswerBox.querySelectorAll('.sentence-chip');
            // 2. 사용자가 정렬한 optionId 배열
            const userOptionIds = Array.from(answerChips).map(chip => parseInt(chip.dataset.optionId));

            // 3. DB에서 받은 정답 순서 (position 기준 오름차순)
            const correctOptions = [...quiz.options].sort((a, b) => a.position - b.position);
            // 4. 정답 optionId 배열
            const correctOptionIds = correctOptions.map(opt => opt.optionId);

            // 5. 두 배열이 일치하는지 검사 (순서까지 정확해야 함)
            const isCorrect = JSON.stringify(userOptionIds) === JSON.stringify(correctOptionIds);

            // 6. userAnswersMap에 저장
            // (주의: optionId는 정답 순서의 첫 번째 항목 ID를 대표로 전송)
            userAnswersMap.set(quiz.quizId, {
                quizId: quiz.quizId,
                optionId: correctOptions.length > 0 ? correctOptions[0].optionId : null, // 대표 ID
                isCorrect: isCorrect,
                questionNumber: currentQuestionIndex
            });

        } else {
            // --- 객관식 퀴즈 (기존 로직) ---
            const selectedLi = optionsListEl.querySelector(".option-item.selected");
            if (!selectedLi) return; // 선택한 것이 없으면 진행 불가 (버튼이 비활성화라 이럴 일 없음)

            const {optionId, isCorrect, quizId} = selectedLi.dataset;
            userAnswersMap.set(parseInt(quizId), {
                quizId: parseInt(quizId),
                optionId: parseInt(optionId),
                isCorrect: isCorrect === 'true',
                questionNumber: currentQuestionIndex // 0-based index
            });
        }

        // 1. 마지막 질문이 아닌 경우
        if (currentQuestionIndex < totalQuestions - 1) {
            currentQuestionIndex++;
            renderQuestion(currentQuestionIndex);
        }
        // 2. 마지막 질문인 경우 (제출 로직)
        else {
            await handleSubmit();
        }
    };

    /** 퀴즈 제출 로직 (변경 없음) */
    const handleSubmit = async () => {
        nextButton.disabled = true;
        nextButton.textContent = "제출 중...";

        const completedAt = formatForLocalDateTime(new Date());

        // answers 배열 가공 (questionNumber를 1-based로 수정)
        const answers = Array.from(userAnswersMap.values()).map((ans, idx) => ({
            ...ans,
            questionNumber: ans.questionNumber + 1 // 0-based -> 1-based
        }));

        // 점수 계산 (isCorrect는 handleNextClick에서 이미 계산됨)
        const score = answers.filter(ans => ans.isCorrect).length;

        // 서버에 보낼 데이터 구성 (request.json 형식)
        const requestPayload = {
            userId: currentUserId,
            configId: quizData.configId,
            score: score,
            startedAt: startedAt,
            completedAt: completedAt,
            answers: answers
        };

        console.log("제출할 데이터:", requestPayload);

        // API 호출
        const result = await submitQuizGame(requestPayload);

        if (result) {
            // 성공 시 퀴즈 목록 페이지로 이동
            console.log("퀴즈가 성공적으로 제출되었습니다!");
            // [수정] contextPath와 userId를 사용하여 퀴즈 '기록' 목록으로 이동
            window.location.href = `${contextPath}/quiz/records?userId=${currentUserId}`;
        } else {
            // 실패 시
            console.error("퀴즈 제출에 실패했습니다. 다시 시도해주세요.");
            nextButton.disabled = false;
            nextButton.textContent = "결과 제출";
        }
    };

    // --- 6. 퀴즈 게임 초기화 ---
    const initGame = async () => {
        // 1. 퀴즈 시작 시간 기록
        startedAt = formatForLocalDateTime(new Date());

        // 2. 퀴즈 데이터 로드
        const response = await fetchQuizGame();

        // [수정] 전역 변수에 userId 저장
        currentUserId = response.validUserId;

        // [수정] API 응답 상태에 따른 분기 처리
        if (response.status === "AVAILABLE") {
            quizData = response.quiz;

            // 퀴즈 데이터 유효성 검사
            if (!quizData || !quizData.quizzes || quizData.quizzes.length === 0) {
                loader.innerHTML = `<span style="color: var(--color-error); font-weight: 500;">퀴즈를 불러오지 못했습니다. (데이터 없음)</span>`;
                return;
            }

            // 3. 상태 변수 초기화
            totalQuestions = quizData.quizzes.length;
            currentQuestionIndex = 0;
            userAnswersMap.clear();

            // 4. 로더 숨기고 게임 컨테이너 표시
            loader.style.display = "none";
            gameContainer.style.display = "flex";

            // 5. 첫 번째 질문 렌더링
            renderQuestion(currentQuestionIndex);

            // 6. '다음' 버튼 이벤트 리스너 연결
            nextButton.addEventListener("click", handleNextClick);

            // [신규] 통합 이벤트 리스너 연결
            optionsContainer.addEventListener("click", handleAnswerClick);

        } else if (response.status === "LEVEL_COMPLETED") {
            // [신규] 레벨 완료 모달 표시
            showLevelUpModal(contextPath, currentUserId);
            // 로더 대신 안내 메시지 표시
            loader.innerHTML = `<span style="color: var(--color-text-sub); font-weight: 500;">현재 레벨의 퀴즈를 모두 완료했습니다.</span>`;

        } else {
            // [수정] "ERROR" 또는 기타 상태
            loader.innerHTML = `<span style="color: var(--color-error); font-weight: 500;">퀴즈를 불러오지 못했습니다.</span>`;
            return;
        }
    };

    // --- 7. 게임 시작 (실제 호출) ---
    initGame();
});