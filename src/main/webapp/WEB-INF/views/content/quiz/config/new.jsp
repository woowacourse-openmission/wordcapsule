<%--
  File: /WEB-INF/views/content/quiz/config/new.jsp
  Description: 퀴즈 설정 생성 페이지 (동적 폼)
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  페이지별 CSS:
  style.css의 변수와 컴포넌트를 기반으로 동적 폼 스타일을 정의합니다.
--%>
<style>
    .quiz-config-new-container h1 {
        font-size: 1.5rem;
        font-weight: 700;
        margin-bottom: 24px;
    }

    /* --- 공통 폼 스타일 (detail.jsp에서 가져옴) --- */
    .section-card {
        background-color: var(--color-bg);
        border: 1px solid var(--color-border);
        border-radius: 12px;
        padding: 24px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        margin-bottom: 24px;
    }

    .section-card h3 {
        font-size: 1.2rem;
        font-weight: 700;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 1px solid var(--color-border);
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-label {
        display: block;
        font-size: 0.9rem;
        font-weight: 500;
        margin-bottom: 8px;
        color: var(--color-text-sub);
    }

    .form-control {
        width: 100%;
        padding: 12px 14px;
        font-size: 1rem;
        border: 1px solid var(--color-border);
        border-radius: 8px;
        background-color: var(--color-bg);
        font-family: 'Noto Sans KR', sans-serif;
    }

    .form-control:focus {
        outline: none;
        border-color: var(--color-primary);
        box-shadow: 0 0 0 2px var(--color-primary-light);
    }

    /* --- 동적 퀴즈 카드 스타일 --- */
    .quiz-card {
        /* .section-card와 유사하지만, 내부 컨텐츠용으로 배경색 변경 */
        background-color: var(--color-bg-content);
        border: 1px solid var(--color-border);
        border-radius: 12px;
        padding: 20px;
        margin-bottom: 16px; /* 퀴즈 카드 사이 간격 */
    }

    .quiz-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 16px;
        border-bottom: 1px dashed var(--color-border);
        padding-bottom: 10px;
    }

    .quiz-header h4 {
        font-size: 1.1rem;
        font-weight: 700;
        margin: 0;
    }

    .btn-remove {
        background: none;
        border: none;
        color: var(--color-error);
        font-size: 1.2rem;
        font-weight: 700;
        cursor: pointer;
        padding: 4px 8px;
        border-radius: 4px;
    }

    .btn-remove:hover {
        background-color: #FFF0F0;
    }

    .btn-remove-option {
        /* 선택지 삭제 버튼은 더 작게 */
        background: none;
        border: none;
        color: var(--color-text-sub);
        font-size: 1.1rem;
        font-weight: 700;
        cursor: pointer;
        padding: 4px;
    }

    .btn-remove-option:hover {
        color: var(--color-error);
    }

    /* --- 동적 선택지 스타일 --- */
    .options-list-container {
        margin-top: 16px;
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .option-item {
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .option-input-group {
        display: flex;
        align-items: center;
        flex: 1; /* 인풋이 남은 공간 차지 */
        border: 1px solid var(--color-border);
        border-radius: 8px;
        background-color: var(--color-bg);
    }

    .option-input-group .form-control {
        border: none; /* 그룹에서 테두리 관리 */
        border-radius: 8px 0 0 8px;
        flex: 1;
    }

    .option-radio {
        /* 라디오 버튼 (정답) */
        margin: 0 12px;
        width: 18px;
        height: 18px;
        accent-color: var(--color-primary);
    }

    .btn-add-option {
        /* .btn-secondary와 유사하나 더 작게 */
        width: 100%;
        padding: 10px;
        border: 1px dashed var(--color-border);
        border-radius: 8px;
        background-color: transparent;
        color: var(--color-text-sub);
        font-size: 0.9rem;
        font-weight: 500;
        cursor: pointer;
        margin-top: 16px;
    }

    .btn-add-option:hover {
        background-color: #fcfcfc;
        border-color: var(--color-primary);
        color: var(--color-primary);
    }

    /* --- 페이지 하단 버튼 --- */
    .page-actions {
        margin-top: 24px;
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .btn-secondary {
        width: 100%;
        padding: 14px;
        border: 1px solid var(--color-border);
        border-radius: 8px;
        background-color: var(--color-bg);
        color: var(--color-text);
        font-size: 1rem;
        font-weight: 700;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
    }

    .btn-secondary:hover {
        background-color: var(--color-bg-content);
    }
</style>

<div class="quiz-config-new-container">

    <h1>새 퀴즈 설정 생성</h1>

    <%--
      폼 제출은 JS가 가로채서(e.preventDefault()) JSON으로 만듭니다.
    --%>
    <form id="quiz-config-form">

        <%-- 1. 퀴즈 설정 (Config) --%>
        <div class="section-card">
            <h3>기본 설정</h3>
            <div class="form-group">
                <label for="quizName" class="form-label">퀴즈 이름</label>
                <input type="text" id="quizName" class="form-control"
                       placeholder="예: 1주차 기초 단어 퀴즈" required maxlength="100">
            </div>
            <div class="form-group">
                <label for="quizLevel" class="form-label">레벨</label>
                <select id="quizLevel" class="form-control">
                    <option value="BEGINNER" selected>BEGINNER</option>
                    <option value="INTERMEDIATE">INTERMEDIATE</option>
                    <option value="ADVANCED">ADVANCED</option>
                </select>
            </div>
        </div>

        <%-- 2. 퀴즈 목록 (Quizzes) - JS로 동적 추가 --%>
        <div class="section-card">
            <h3>퀴즈 문항</h3>
            <div id="quiz-list-container">
                <%-- JS로 퀴즈 카드가 여기에 추가됩니다 --%>
            </div>

            <%-- 퀴즈 추가 버튼 --%>
            <button type="button" id="btn-add-quiz" class="btn-add-option"
                    style="border-style: solid; color: var(--color-primary); border-color: var(--color-primary); font-weight: 700;">
                + 퀴즈 문항 추가
            </button>
        </div>

        <%-- 3. 페이지 하단 버튼 --%>
        <div class="page-actions">
            <button type="submit" id="btn-submit" class="btn-primary">퀴즈 설정 생성</button>
            <a href="${pageContext.request.contextPath}/quiz/configs" class="btn-secondary">취소 (목록으로)</a>
        </div>

    </form>
</div>

<script type="module" src="/js/quiz/config-new.js"></script>