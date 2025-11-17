<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<script type="module" src="${pageContext.request.contextPath}/js/quiz/game.js"></script>

<%--
  퀴즈 게임 페이지 전용 스타일
  [수정] SENTENCE_ORDER (문장 순서) 유형을 위한 스타일 추가
--%>
<style>
    /* --- 1. 로딩 스피너 (변경 없음) --- */
    .quiz-loader {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 200px;
    }

    .spinner {
        width: 40px;
        height: 40px;
        border: 4px solid var(--color-primary-light);
        border-top-color: var(--color-primary);
        border-radius: 50%;
        animation: spin 1s linear infinite;
    }

    @keyframes spin {
        to {
            transform: rotate(360deg);
        }
    }

    /* --- 2. 퀴즈 게임 컨테이너 (변경 없음) --- */
    .quiz-game-container {
        display: none; /* JS로 데이터 로드 후 flex로 변경 */
        flex-direction: column;
        gap: 20px;
        margin: -10px 0;
    }

    /* --- 3. 퀴즈 헤더 (변경 없음) --- */
    .quiz-header {
        width: 100%;
    }

    .quiz-title {
        font-size: 1.3rem;
        font-weight: 700;
        margin-bottom: 8px;
    }

    .progress-status {
        display: flex;
        justify-content: space-between;
        font-size: 0.9rem;
        color: var(--color-text-sub);
        margin-bottom: 8px;
    }

    .progress-bar {
        width: 100%;
        height: 10px;
        background-color: var(--color-bg-content);
        border-radius: 5px;
        overflow: hidden;
    }

    .progress-bar-inner {
        width: 0%; /* JS로 제어 */
        height: 100%;
        background-color: var(--color-primary);
        border-radius: 5px;
        transition: width 0.3s ease-in-out;
    }

    /* --- 4. 질문 영역 (변경 없음) --- */
    .question-container {
        padding: 24px 16px;
        background-color: var(--color-bg-content);
        border-radius: 12px;
        min-height: 100px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .question-content {
        font-size: 1.2rem;
        font-weight: 500;
        text-align: center;
        line-height: 1.5;
    }

    /* --- 5. 선택지 영역 (객관식) --- */
    .options-list {
        list-style: none;
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .option-item {
        padding: 16px;
        border: 2px solid var(--color-border);
        border-radius: 10px;
        background-color: var(--color-bg);
        font-size: 1rem;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    /* 호버 시 */
    .option-item:hover {
        border-color: var(--color-primary);
        background-color: var(--color-primary-light);
    }

    /* 선택됨 */
    .option-item.selected {
        border-color: var(--color-primary);
        background-color: var(--color-primary-light);
        font-weight: 700;
        color: var(--color-primary);
    }

    /* --- [신규] 5-2. 선택지 영역 (문장 순서) --- */
    .sentence-container {
        display: none; /* JS로 제어 (flex) */
        flex-direction: column;
        gap: 16px;
    }

    /* 정답을 놓는 영역 (첨부파일의 'I') */
    .sentence-answer-box {
        min-height: 60px; /* 최소 높이 */
        padding: 10px;
        border: 2px dashed var(--color-border);
        border-radius: 10px;
        background-color: var(--color-primary-light);
        display: flex;
        flex-wrap: wrap; /* 칩들이 줄바꿈되도록 */
        gap: 10px;
    }

    /* 선택지를 고르는 영역 (첨부파일의 'love', 'you') */
    .sentence-options-box {
        min-height: 60px; /* 최소 높이 */
        padding: 10px;
        border: 1px solid var(--color-border);
        border-radius: 10px;
        background-color: var(--color-bg);
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        justify-content: center; /* 칩들을 중앙 정렬 */
    }

    /* 칩 (클릭 가능한 단어) */
    .sentence-chip {
        padding: 12px 16px;
        border-radius: 8px;
        background-color: var(--color-bg);
        border: 1px solid var(--color-border);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        font-size: 1rem;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.2s, transform 0.2s;
    }

    .sentence-chip:hover {
        transform: translateY(-2px);
        border-color: var(--color-primary);
    }

    /* 정답 영역으로 이동한 칩 */
    .sentence-answer-box .sentence-chip {
        background-color: var(--color-bg);
        color: var(--color-text);
        border: 1px solid var(--color-primary);
    }


    /* --- 6. 하단 버튼 (변경 없음) --- */
    .quiz-footer {
        margin-top: 10px;
    }

    /* 버튼 비활성화 스타일 */
    .btn-primary[disabled] {
        background-color: #BDBDBD; /* 비활성화 색상 */
        cursor: not-allowed;
        opacity: 0.7;
    }

</style>

<div id="quiz-loader" class="quiz-loader">
    <div class="spinner"></div>
</div>

<div id="quiz-game-container" class="quiz-game-container" data-context-path="${pageContext.request.contextPath}">

    <header class="quiz-header">
        <h2 id="quiz-title" class="quiz-title">퀴즈 로딩 중...</h2>
        <div class="progress-status">
            <span>진행도</span>
            <span id="progress-text">0 / 0</span>
        </div>
        <div class="progress-bar">
            <div id="progress-bar-inner" class="progress-bar-inner"></div>
        </div>
    </header>

    <section class="question-container">
        <p id="question-content" class="question-content">
            문제를 불러오고 있습니다.
        </p>
    </section>

    <section class="options-container">

        <ul id="options-list" class="options-list">
        </ul>

        <div id="sentence-container" class="sentence-container">
            <div id="sentence-answer-box" class="sentence-answer-box">
            </div>
            <div id="sentence-options-box" class="sentence-options-box">
            </div>
        </div>

    </section>

    <footer class="quiz-footer">
        <button id="next-button" class="btn-primary" disabled>
            선택하세요
        </button>
    </footer>
</div>