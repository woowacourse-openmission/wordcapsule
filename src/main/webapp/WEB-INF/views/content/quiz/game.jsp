<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<script type="module" src="${pageContext.request.contextPath}/js/quiz/game.js"></script>

<%--
  퀴즈 게임 페이지 전용 스타일
  - 전역 CSS 변수(var(--color-primary))를 사용하여 일관성 유지
--%>
<style>
    /* --- 1. 로딩 스피너 --- */
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

    /* --- 2. 퀴즈 게임 컨테이너 --- */
    .quiz-game-container {
        display: none; /* JS로 데이터 로드 후 flex로 변경 */
        flex-direction: column;
        gap: 20px;
        /* main-content의 기본 padding(24px 20px)을 고려하여
           컨텐츠가 너무 붙지 않게 약간의 음수 마진으로 공간 확보 */
        margin: -10px 0;
    }

    /* --- 3. 퀴즈 헤더 --- */
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

    /* --- 4. 질문 영역 --- */
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

    /* --- 5. 선택지 영역 --- */
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

    /* --- 6. 하단 버튼 --- */
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

<!-- 1. 로딩 스피너 (초기 표시) -->
<div id="quiz-loader" class="quiz-loader">
    <div class="spinner"></div>
</div>

<!--
2. 퀴즈 게임 UI (로딩 완료 후 표시)
- data-context-path: JS에서 리다이렉션 경로를 생성하기 위해 사용
-->
<div id="quiz-game-container" class="quiz-game-container" data-context-path="${pageContext.request.contextPath}">

    <!-- 퀴즈 헤더: 제목, 진행상태 -->
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

    <!-- 질문 영역 -->
    <section class="question-container">
        <p id="question-content" class="question-content">
            문제를 불러오고 있습니다.
        </p>
    </section>

    <!-- 선택지 영역 -->
    <section class="options-container">
        <ul id="options-list" class="options-list">
            <!-- JS로 동적 생성 -->
        </ul>
    </section>

    <!-- 하단 버튼 (다음/제출) -->
    <footer class="quiz-footer">
        <button id="next-button" class="btn-primary" disabled>
            선택하세요
        </button>
    </footer>

</div>