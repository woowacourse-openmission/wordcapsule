<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<%--
  이 페이지(detail.jsp)에만 적용되는 스타일입니다.
  전역 CSS의 변수(var(--color-primary))를 활용하여 일관된 디자인을 유지합니다.
--%>
<style>
    .record-detail-container {
        display: flex;
        flex-direction: column;
        gap: 24px;
    }

    /* --- 1. 퀴즈 결과 요약 카드 --- */
    .summary-card {
        padding: 20px;
        border-radius: 12px;
        background-color: var(--color-bg-content);
        border: 1px solid var(--color-border);
    }

    .summary-card h2 {
        font-size: 1.5rem;
        font-weight: 700;
        margin-bottom: 16px;
    }

    .score-display {
        display: flex;
        justify-content: center;
        align-items: baseline;
        gap: 8px;
        margin-bottom: 16px;
    }

    .score-display .score-value {
        font-size: 2.5rem;
        font-weight: 700;
        color: var(--color-primary);
    }

    .score-display .score-total {
        font-size: 1.5rem;
        color: var(--color-text-sub);
    }

    .summary-meta {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 0.9rem;
        color: var(--color-text-sub);
    }

    .level-badge {
        padding: 4px 10px;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 700;
        background-color: var(--color-primary-light);
        color: var(--color-primary);
    }

    /* --- 2. 개별 문항 리스트 --- */
    .answer-list {
        display: flex;
        flex-direction: column;
        gap: 16px;
    }

    .answer-list-header {
        font-size: 1.2rem;
        font-weight: 700;
        border-bottom: 2px solid var(--color-border);
        padding-bottom: 8px;
    }

    .answer-card {
        padding: 16px;
        border-radius: 10px;
        background-color: var(--color-bg);
        border: 1px solid var(--color-border);
    }

    .question-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        gap: 12px;
        margin-bottom: 16px;
    }

    .question-title {
        flex: 1;
        font-size: 1.1rem;
        font-weight: 700;
    }

    .question-title .q-number {
        color: var(--color-primary);
        margin-right: 4px;
    }

    .result-badge {
        padding: 5px 10px;
        border-radius: 6px;
        font-size: 0.9rem;
        font-weight: 700;
        color: white;
        flex-shrink: 0; /* 줄어들지 않음 */
    }

    .result-badge.correct {
        background-color: var(--color-primary);
    }

    .result-badge.incorrect {
        background-color: var(--color-error);
    }

    /* --- 3. 선택지 --- */
    .options-list {
        list-style: none;
        padding: 0;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .option-item {
        padding: 12px 16px;
        border-radius: 8px;
        background-color: var(--color-bg-content);
        border: 1px solid var(--color-border);
        display: flex;
        justify-content: space-between;
        align-items: center;
        transition: all 0.2s ease;
    }

    /* 3.1. 정답 (항상 초록색으로 표시) */
    .option-item.correct-answer {
        border-color: var(--color-primary);
        background-color: var(--color-primary-light);
        color: #000; /* 정답 텍스트는 검은색으로 유지 */
        font-weight: 700;
    }

    /* 3.2. 사용자가 선택한 오답 (빨간색으로 표시) */
    .option-item.selected-incorrect {
        border-color: var(--color-error);
        background-color: #FFF0F0; /* 옅은 빨간색 */
        color: #000; /* 오답 텍스트는 검은색으로 유지 */
    }

    .user-choice-marker {
        font-size: 0.85rem;
        font-weight: 500;
        color: var(--color-text-sub);
        margin-left: 12px;
        flex-shrink: 0;
    }

    /* 사용자가 선택한 오답일 경우, 마커 색상 변경 */
    .selected-incorrect .user-choice-marker {
        color: var(--color-error);
        font-weight: 700;
    }

    /* 사용자가 선택한 정답일 경우, 마커 색상 변경 */
    .correct-answer.user-selected .user-choice-marker {
        color: var(--color-primary);
        font-weight: 700;
    }

</style>

<div class="record-detail-container">

    <!-- 1. 퀴즈 결과 요약 -->
    <div class="summary-card">
        <h2>${data.quizName}</h2>

        <div class="score-display">
            <span class="score-value">${data.score}</span>
            <span class="score-total">/ ${fn:length(data.answers)}</span>
        </div>

        <div class="summary-meta">
            <span class="level-badge">${data.level}</span>
            <span>
                완료: <c:out value="${data.completedAt}"/>
            </span>
        </div>
    </div>

    <!-- 2. 개별 문항 상세보기 -->
    <div class="answer-list">
        <h3 class="answer-list-header">상세 풀이</h3>

        <c:forEach var="answer" items="${data.answers}" varStatus="status">
            <div class="answer-card">
                <!-- 질문 헤더 (문제, 정답/오답) -->
                <div class="question-header">
                    <span class="question-title">
                        <span class="q-number">Q${status.count}.</span>
                        ${answer.quiz.content}
                    </span>

                    <c:if test="${answer.correct}">
                        <span class="result-badge correct">정답 (O)</span>
                    </c:if>
                    <c:if test="${not answer.correct}">
                        <span class="result-badge incorrect">오답 (X)</span>
                    </c:if>
                </div>

                <!-- 선택지 목록 -->
                <ul class="options-list">
                    <c:forEach var="option" items="${answer.quiz.options}">
                        <%--
                            CSS 클래스 동적 할당
                            1. liClass: 기본 클래스 'option-item'
                            2. 정답인 경우: 'correct-answer' 추가
                            3. 사용자가 선택한 오답인 경우: 'selected-incorrect' 추가
                            4. 사용자가 선택한 정답인 경우: 'user-selected' 추가 (스타일링 구분을 위해)
                        --%>
                        <c:set var="liClass" value="option-item"/>

                        <c:if test="${option.correct}">
                            <c:set var="liClass" value="${liClass} correct-answer"/>
                        </c:if>

                        <c:if test="${option.optionId == answer.selectedOptionId}">
                            <c:if test="${not answer.correct}">
                                <c:set var="liClass" value="${liClass} selected-incorrect"/>
                            </c:if>
                            <c:if test="${answer.correct}">
                                <c:set var="liClass" value="${liClass} user-selected"/>
                            </c:if>
                        </c:if>

                        <li class="${liClass}">
                            <span>${option.content}</span>

                                <%-- 사용자가 선택한 항목에만 마커 표시 --%>
                            <c:if test="${option.optionId == answer.selectedOptionId}">
                                <span class="user-choice-marker">&lt;-- 나의 선택</span>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:forEach>
    </div>
</div>