//
// 퀴즈 설정 생성 페이지 (new.jsp)의 모든 UI 로직
// [수정] 퀴즈 유형(QuizType)에 따라 동적 폼을 지원
//
import {apiUtil} from "../util/apiUtil.js";
import {getUserId} from "../util/loginUtil.js";

/**
 * API 호출 및 후속 처리(알림, 리다이렉트)
 * @param {object} request - QuizConfigRequest DTO와 일치하는 JSON 객체
 */
const submitQuizConfig = async (request) => {
    try {
        const response = await apiUtil.post("/quiz/config", request);
        console.log(response);

        alert("새 퀴즈 설정이 성공적으로 생성되었습니다.");

        // API 호출 경로가 root-relative("/quiz/config")이므로
        // 리다이렉트 경로도 root-relative("/quiz/configs")로 설정합니다.
        location.href = "/quiz/configs";

    } catch (e) {
        console.error(e);
        alert("퀴즈 생성 중 오류가 발생했습니다: " + (e.message || "서버 오류"));
        // handleSubmit에서 후속 처리를 할 수 있도록 에러를 다시 던집니다.
        throw e;
    }
}

// --- 전역 변수 ---

// 모듈 최상위에서 await를 사용하여 userId를 미리 가져옵니다.
const userId = await getUserId();
console.log("Logged in User ID:", userId);

// 퀴즈 카드 고유 ID (라디오 버튼 그룹명에 사용)
let quizCounter = 0;


// --- HTML 템플릿 함수 ---

/** * 새 퀴즈 카드 HTML 생성
 * @param {number} quizId - 퀴즈 고유 ID
 */
function createQuizCardTemplate(quizId) {
    // [수정] select-box에 quiz-type 클래스를 추가하여 변경 감지
    return `
    <div class="quiz-card" data-quiz-id="${quizId}">
        <div class="quiz-header">
            <h4>퀴즈 #${quizId}</h4>
            <button type="button" class="btn-remove btn-remove-quiz">X</button>
        </div>
        
        <div class="form-group">
            <label for="quiz-content-${quizId}" class="form-label">퀴즈 내용</label>
            <input type="text" id="quiz-content-${quizId}" class="form-control quiz-content" 
                   placeholder="예: 'apple'의 뜻은?" required maxlength="100">
        </div>
        
        <div class="form-group">
            <label for="quiz-type-${quizId}" class="form-label">퀴즈 타입</label>
            <select id="quiz-type-${quizId}" class="form-control quiz-type">
                <%-- DTO의 QuizType Enum --%>
                <option value="WORD_MEANING" selected>단어 뜻 맞추기</option>
                <option value="WORD_MATCHING">일치하는 단어 맞추기</option> 
                <option value="FILL_BLANK">문장에 빈칸 채우기</option> 
                <option value="SENTENCE_ORDER">단어 조합하여 문장 만들기</option> 
            </select>
        </div>
        
        <div class="form-group options-form-container">
        </div>
    </div>
    `;
}

/** * [신규] 객관식 선택지 폼 HTML 생성
 * (WORD_MEANING, WORD_MATCHING, FILL_BLANK)
 */
function createMultipleChoiceOptionsTemplate(quizId) {
    return `
        <label class="form-label">선택지 (정답 1개 체크)</label>
        <div class="options-list-container">
        </div>
        <button type="button" class="btn-add-option">+ 선택지 추가</button>
    `;
}

/** * [신규] 문장 순서 폼 HTML 생성
 * (SENTENCE_ORDER)
 */
function createSentenceOrderOptionsTemplate(quizId) {
    return `
        <label class="form-label">단어/구문 목록 (정답 순서대로 입력)</label>
        <div class="options-list-container">
        </div>
        <button type="button" class="btn-add-option">+ 단어/구문 추가</button>
    `;
}

/** * 객관식 선택지 1개(아이템)의 HTML
 * @param {number} quizId - 부모 퀴즈 ID (라디오 그룹명)
 */
function createMultipleChoiceOptionItemTemplate(quizId) {
    const radioGroupName = `quiz-${quizId}-correct`;
    return `
    <div class="option-item">
        <div class="option-input-group">
            <input type="text" class="form-control option-content" placeholder="선택지 내용" required maxlength="50">
            <input type="radio" class="option-radio option-correct" name="${radioGroupName}" value="true" required>
        </div>
        <button type="button" class="btn-remove-option">x</button>
    </div>
    `;
}

/** * 문장 순서 선택지 1개(아이템)의 HTML
 * (라디오 버튼이 없음)
 */
function createSentenceOrderOptionItemTemplate() {
    return `
    <div class="option-item">
        <div class="option-input-group">
              <span class="option-drag-handle">::</span> 
            <input type="text" class="form-control option-content" placeholder="단어/구문 (예: I)" required maxlength="50">
        </div>
        <button type="button" class="btn-remove-option">x</button>
    </div>
    `;
}


// --- 이벤트 핸들러 함수 ---

/**
 * 1. 퀴즈 카드 추가
 * @param {HTMLElement} quizListContainer - 퀴즈 목록을 담을 컨테이너
 */
function handleAddQuiz(quizListContainer) {
    quizCounter++;
    const quizCardHtml = createQuizCardTemplate(quizCounter);
    quizListContainer.insertAdjacentHTML('beforeend', quizCardHtml);

    // 방금 생성된 퀴즈 카드를 가져옴
    const newQuizCard = quizListContainer.lastElementChild;

    // [수정] 퀴즈 타입에 맞는 기본 폼을 설정 (기본: 객관식)
    // 인위적으로 'change' 이벤트를 발생시켜 폼을 생성
    handleQuizTypeChange(newQuizCard.querySelector('.quiz-type'));
}

/**
 * 2. 선택지 아이템 추가
 * @param {HTMLElement} button - 클릭된 '선택지 추가' 버튼
 */
function handleAddOption(button) {
    const quizCard = button.closest('.quiz-card');
    const quizId = quizCard.dataset.quizId;
    const quizType = quizCard.querySelector('.quiz-type').value;
    const optionsContainer = quizCard.querySelector('.options-list-container');

    let optionHtml;
    // [수정] 퀴즈 타입에 맞는 선택지 아이템 템플릿 사용
    if (quizType === 'SENTENCE_ORDER') {
        optionHtml = createSentenceOrderOptionItemTemplate(quizId);
    } else {
        optionHtml = createMultipleChoiceOptionItemTemplate(quizId);
    }
    optionsContainer.insertAdjacentHTML('beforeend', optionHtml);
}

/**
 * [신규] 3. 퀴즈 타입 변경 시 폼 교체
 * @param {HTMLElement} selectElement - 변경된 select 요소
 */
function handleQuizTypeChange(selectElement) {
    const quizCard = selectElement.closest('.quiz-card');
    const quizId = quizCard.dataset.quizId;
    const optionsFormContainer = quizCard.querySelector('.options-form-container');
    const newType = selectElement.value;

    // 1. 폼 UI 교체
    if (newType === 'SENTENCE_ORDER') {
        optionsFormContainer.innerHTML = createSentenceOrderOptionsTemplate(quizId);
    } else {
        // WORD_MEANING, WORD_MATCHING, FILL_BLANK
        optionsFormContainer.innerHTML = createMultipleChoiceOptionsTemplate(quizId);
    }

    // 2. 기본 선택지 4개 추가
    const addOptionBtn = optionsFormContainer.querySelector('.btn-add-option');
    for (let i = 0; i < 4; i++) {
        handleAddOption(addOptionBtn);
    }

    // 3. 객관식인 경우, 첫 번째 라디오 자동 체크
    if (newType !== 'SENTENCE_ORDER') {
        const firstRadio = optionsFormContainer.querySelector('.option-radio');
        if (firstRadio) {
            firstRadio.checked = true;
        }
    }
}

/**
 * 4. 퀴즈/선택지 삭제 및 선택지 추가 (이벤트 위임)
 * @param {Event} e - 클릭 이벤트
 */
function handleDynamicClicks(e) {
    // 4-1. 퀴즈 삭제
    const removeQuizBtn = e.target.closest('.btn-remove-quiz');
    if (removeQuizBtn) {
        removeQuizBtn.closest('.quiz-card').remove();
        return;
    }

    // 4-2. 선택지 추가
    const addOptionBtn = e.target.closest('.btn-add-option');
    if (addOptionBtn) {
        handleAddOption(addOptionBtn);
        return;
    }

    // 4-3. 선택지 삭제
    const removeOptionBtn = e.target.closest('.btn-remove-option');
    if (removeOptionBtn) {
        removeOptionBtn.closest('.option-item').remove();
        return;
    }
}

/**
 * 5. 폼 제출 (데이터 취합 및 API 호출)
 * @param {Event} e - 폼 제출 이벤트
 * @param {HTMLElement} form - 폼 엘리먼트
 * @param {HTMLElement} quizListContainer - 퀴즈 목록 컨테이너
 */
async function handleSubmit(e, form, quizListContainer) {
    e.preventDefault(); // 기본 폼 제출 방지

    if (!userId) {
        alert("사용자 정보를 불러오는 중입니다. 잠시 후 다시 시도해주세요.");
        return;
    }

    // 폼 유효성 검사 (HTML5 required 속성 활용)
    if (!form.checkValidity()) {
        form.reportValidity(); // 유효하지 않은 첫 번째 필드에 포커스
        alert("필수 입력 항목을 모두 채워주세요.");
        return;
    }

    try {
        // --- 1. 퀴즈 설정 (Config) 데이터 수집 ---
        const request = {
            userId: userId,
            quizName: document.getElementById('quizName').value,
            level: document.getElementById('quizLevel').value,
            quizzes: [] // 퀴즈 목록 (아래에서 채움)
        };

        // --- 2. 퀴즈 (Quiz) 데이터 수집 ---
        const quizCards = quizListContainer.querySelectorAll('.quiz-card');

        if (quizCards.length === 0) {
            alert("퀴즈 문항은 최소 1개 이상 필요합니다.");
            return;
        }

        for (const quizCard of quizCards) {
            const quizType = quizCard.querySelector('.quiz-type').value;

            const quizRequest = {
                content: quizCard.querySelector('.quiz-content').value,
                quizType: quizType,
                options: [] // 선택지 목록 (아래에서 채움)
            };

            // --- 3. 선택지 (Option) 데이터 수집 ---
            const optionItems = quizCard.querySelectorAll('.option-item');

            if (optionItems.length === 0) {
                alert(`"${quizRequest.content}" 퀴즈에 선택지가 최소 1개 이상 필요합니다.`);
                return;
            }

            // [수정] 퀴즈 타입에 따라 DTO 조립 방식 분기
            if (quizType === 'SENTENCE_ORDER') {
                // --- 3a. SENTENCE_ORDER (순서) ---
                // 라디오 버튼이 없으므로, 순서가 position이 되고 모두 정답(isCorrect: true)
                for (let i = 0; i < optionItems.length; i++) {
                    const item = optionItems[i];
                    const optionRequest = {
                        content: item.querySelector('.option-content').value,
                        isCorrect: true, // 모든 항목이 정답의 일부
                        position: i + 1  // 입력 순서가 정답 순서(position)
                    };
                    quizRequest.options.push(optionRequest);
                }
                // (정답 개수 검증 불필요)

            } else {
                // --- 3b. 객관식 (WORD_MEANING, WORD_MATCHING, FILL_BLANK) ---
                let correctCount = 0;
                for (let i = 0; i < optionItems.length; i++) {
                    const item = optionItems[i];

                    const radio = item.querySelector('.option-correct');
                    if (!radio) {
                        // 이 경우는 SENTENCE_ORDER 폼이 선택된 상태로 제출 시도 시 발생 가능 (방어 코드)
                        alert(`오류: "${quizRequest.content}" 퀴즈의 선택지 형식이 올바르지 않습니다.`);
                        return; // 제출 중단
                    }

                    const isCorrect = radio.checked;
                    if (isCorrect) correctCount++;

                    const optionRequest = {
                        content: item.querySelector('.option-content').value,
                        isCorrect: isCorrect,
                        position: i + 1 // 선택지 순서
                    };
                    quizRequest.options.push(optionRequest);
                }

                if (correctCount !== 1) {
                    alert(`"${quizRequest.content}" 퀴즈에 1개의 정답을 정확히 체크해야 합니다.`);
                    return;
                }
            }

            request.quizzes.push(quizRequest);
        } // 퀴즈 카드 루프 종료

        // --- 4. API 호출 ---
        console.log("Request Body:", JSON.stringify(request, null, 2));

        // submitQuizConfig 함수가 성공/실패 처리를 모두 담당
        await submitQuizConfig(request);

    } catch (e) {
        // submitQuizConfig에서 이미 alert()를 호출했으므로,
        // 여기서는 콘솔에만 에러를 기록합니다.
        console.error("Form submission failed:", e);
    }
}


// --- 초기화 (Initialization) ---
const form = document.getElementById('quiz-config-form');
const quizListContainer = document.getElementById('quiz-list-container');
const btnAddQuiz = document.getElementById('btn-add-quiz');

if (form && quizListContainer && btnAddQuiz) {
    // 1. 폼 제출 이벤트
    form.addEventListener('submit', (e) => handleSubmit(e, form, quizListContainer));

    // 2. 퀴즈 추가 버튼
    btnAddQuiz.addEventListener('click', () => handleAddQuiz(quizListContainer));

    // 3. 동적 버튼 (삭제/선택지추가) 이벤트 위임 (click)
    quizListContainer.addEventListener('click', handleDynamicClicks);

    // 4. [신규] 퀴즈 타입 변경 이벤트 위임 (change)
    quizListContainer.addEventListener('change', (e) => {
        const quizTypeSelect = e.target.closest('.quiz-type');
        if (quizTypeSelect) {
            handleQuizTypeChange(quizTypeSelect);
        }
    });

    // 5. 페이지 진입 시 기본 퀴즈 1개 추가
    handleAddQuiz(quizListContainer);

}