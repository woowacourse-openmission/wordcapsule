import {apiUtil} from "../util/apiUtil.js";

// --- 1. API 함수 ---

const fetchQuizGame = async (userId = 1) => {
    try {
        // configId를 URL 파라미터에서 가져오도록 수정
        // 예: /quiz/game/1
        const pathParts = window.location.pathname.split('/');
        // URL의 마지막 부분을 ID로 사용
        const id = pathParts[pathParts.length - 1] || userId;

        // isNaN 체크를 통해 유효한 숫자인지 확인, 아니면 기본값 1 사용
        const validUserId = isNaN(parseInt(id)) ? userId : parseInt(id);

        const response = await apiUtil.get(`/quiz/config/random?userId=${validUserId}`);

        const status = response.status
        const quiz = response.quiz

        if (status === "AVAILABLE") {
            console.log("퀴즈 데이터 로드 성공:", quiz);
            return quiz
        }
        else if (status === "LEVEL_COMPLETED") {
            console.log("모든 퀴즈 완료", response)
        }
        else if (status === "USER_NOT_FOUND") {
            console.error("일치하는 아이디를 찾을 수 없음", id)
        }
         else {
             console.error("알 수 없는 에러", id)
        }

        return response;
    } catch (e) {
        console.error("퀴즈를 불러오는 데 실패했습니다.", e);
        return null; // 오류 발생 시 null 반환
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
 * Date 객체를 백엔드 LocalDateTime 호환 형식(yyyy-MM-dd'T'HH:mm:ss)으로 변환합니다.
 * .toISOString() (e.g., ...T12:37:47.105Z)에서 밀리초와 'Z'를 제거합니다.
 * 시간은 UTC 기준으로 전송됩니다.
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

// --- 2. 퀴즈 게임 상태 관리 ---
// (DOM 로드 전에도 선언은 가능)
let quizData = null;            // 서버에서 받은 퀴즈 전체 데이터
let currentQuestionIndex = 0;   // 현재 질문 인덱스
let totalQuestions = 0;         // 총 질문 수
let userAnswersMap = new Map(); // 사용자의 답변 기록 (quizId -> { optionId, isCorrect, questionNumber })
let startedAt = "";             // 퀴즈 시작 시간


// --- 7. 게임 시작 (DOM 로드 후) ---
// !!! 중요: DOM 요소가 모두 로드된 후에 스크립트를 실행하기 위해
// DOMContentLoaded 이벤트 리스너로 전체 로직을 감쌉니다.
document.addEventListener("DOMContentLoaded", () => {

    // --- 3. DOM 요소 참조 ---
    // (DOM이 로드되었으므로 안전하게 요소를 참조)
    const loader = document.getElementById("quiz-loader");
    const gameContainer = document.getElementById("quiz-game-container");

    // 필수 요소가 없으면 퀴즈를 진행할 수 없음
    if (!loader || !gameContainer) {
        console.error("퀴즈 게임의 필수 DOM 요소를 찾을 수 없습니다. (game.jsp 확인 필요)");
        if (loader) {
            // 스피너 대신 에러 메시지를 표시
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
    const optionsListEl = document.getElementById("options-list");

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

        // 4. 선택지 목록 초기화 및 생성
        optionsListEl.innerHTML = "";
        quiz.options.forEach(option => {
            const li = document.createElement("li");
            li.classList.add("option-item");
            li.textContent = option.content;

            // 데이터셋에 필요한 정보 저장
            li.dataset.optionId = option.optionId;
            li.dataset.isCorrect = option.isCorrect;
            li.dataset.quizId = quiz.quizId;

            // 선택지 클릭 이벤트 리스너 추가
            li.addEventListener("click", () => handleOptionClick(li));

            optionsListEl.appendChild(li);
        });

        // 5. 버튼 상태 업데이트
        nextButton.disabled = true; // 새 질문이 나오면 항상 비활성화

        if (index === totalQuestions - 1) {
            nextButton.textContent = "결과 제출";
        } else {
            nextButton.textContent = "다음 문제";
        }
    };

    // --- 5. 이벤트 핸들러 ---
    /** 선택지 클릭 시 호출됩니다. */
    const handleOptionClick = (selectedLi) => {
        // 1. 모든 선택지에서 'selected' 클래스 제거
        const allOptions = optionsListEl.querySelectorAll(".option-item");
        allOptions.forEach(option => option.classList.remove("selected"));

        // 2. 클릭한 선택지에 'selected' 클래스 추가
        selectedLi.classList.add("selected");

        // 3. 사용자 답변을 Map에 저장
        const {optionId, isCorrect, quizId} = selectedLi.dataset;
        userAnswersMap.set(parseInt(quizId), {
            quizId: parseInt(quizId),
            optionId: parseInt(optionId),
            isCorrect: isCorrect === 'true',
            questionNumber: currentQuestionIndex // 0-based index
        });

        // 4. '다음' 버튼 활성화
        nextButton.disabled = false;
    };

    /** '다음' 또는 '제출' 버튼 클릭 시 호출됩니다. */
    const handleNextClick = async () => {
        // 현재 선택된 답변이 있는지 확인 (혹시 모를 방어 코드)
        const selectedAnswer = userAnswersMap.get(quizData.quizzes[currentQuestionIndex].quizId);
        if (!selectedAnswer) {
            return;
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

    /** 퀴즈 제출 로직 */
    const handleSubmit = async () => {
        nextButton.disabled = true;
        nextButton.textContent = "제출 중...";

        const completedAt = formatForLocalDateTime(new Date());

        // answers 배열 가공 (questionNumber를 1-based로 수정)
        const answers = Array.from(userAnswersMap.values()).map((ans, idx) => ({
            ...ans,
            questionNumber: ans.questionNumber + 1 // 0-based -> 1-based
        }));

        // 점수 계산
        const score = answers.filter(ans => ans.isCorrect).length;

        // 서버에 보낼 데이터 구성 (request.json 형식)
        const requestPayload = {
            userId: 1, // 요청대로 1로 고정
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
            // !!! alert()는 캔버스 환경에서 문제를 일으킬 수 있으므로 console.log로 대체
            console.log("퀴즈가 성공적으로 제출되었습니다!");
            // contextPath를 사용하여 정확한 경로로 이동
            window.location.href = `${contextPath}/quiz/records?userId=1`; // 퀴즈 '기록' 목록으로 이동
        } else {
            // 실패 시
            // !!! alert() 대신 console.error 사용
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
        quizData = await fetchQuizGame(); // URL에서 configId 자동 감지 시도

        if (!quizData || !quizData.quizzes || quizData.quizzes.length === 0) {
            // 로더 스피너를 지우고 에러 메시지를 HTML로 표시
            loader.innerHTML = `<span style="color: var(--color-error); font-weight: 500;">퀴즈를 불러오지 못했습니다.</span>`;
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
    };

    // --- 7. 게임 시작 (실제 호출) ---
    initGame();
});