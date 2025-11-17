<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<%--
  이 페이지(detail.jsp)에만 적용되는 스타일입니다.
  [수정] SENTENCE_ORDER를 위한 스타일이 추가되었습니다.
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

    /* --- 3. 선택지 (공통) --- */
    .marker {
        font-size: 0.9rem;
        font-weight: 700;
        margin-left: 8px;
    }

    .marker.correct-marker {
        color: var(--color-primary);
    }

    .marker.incorrect-marker {
        color: var(--color-error);
    }

    /* --- 3a. 선택지 (객관식) --- */
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

    /* 정답 (항상 초록색으로 표시) */
    .option-item.correct-answer {
        border-color: var(--color-primary);
        background-color: var(--color-primary-light);
        color: #000;
        font-weight: 700;
    }

    /* 사용자가 선택한 오답 (빨간색으로 표시) */
    .option-item.selected-incorrect {
        border-color: var(--color-error);
        background-color: #FFF0F0;
        color: #000;
    }

    .user-choice-marker {
        font-size: 0.85rem;
        font-weight: 500;
        color: var(--color-text-sub);
        margin-left: 12px;
        flex-shrink: 0;
    }

    .selected-incorrect .user-choice-marker {
        color: var(--color-error);
        font-weight: 700;
    }

    .correct-answer.user-selected .user-choice-marker {
        color: var(--color-primary);
        font-weight: 700;
    }

    /* --- [신규] 3b. 선택지 (문장 순서) --- */
    .sentence-result h4 {
        font-size: 1rem;
        font-weight: 700;
        margin-bottom: 12px;
        color: var(--color-text);
    }

    .sentence-list {
        padding-left: 20px; /* <ol> 태그의 숫자 들여쓰기 */
        margin: 0;
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .sentence-list li {
        font-size: 1rem;
        font-weight: 500;
        padding: 10px 12px;
        background-color: var(--color-primary-light);
        border-radius: 6px;
        border: 1px solid var(--color-primary);
        list-style-type: decimal; /* 순서 번호 표시 */
    }

    .note-text {
        font-size: 0.85rem;
        color: var(--color-text-sub);
        margin-top: 12px;
    }

</style>

<div class="record-detail-container">

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

    <div class="answer-list">
        <h3 class="answer-list-header">상세 풀이</h3>

        <c:forEach var="answer" items="${data.answers}" varStatus="status">
            <%--
              [수정] answer.quiz.options가 SENTENCE_ORDER일 때
              DB에서 position 순으로 정렬되어 왔다고 가정합니다.
            --%>
            <c:set var="quiz" value="${answer.quiz}"/>

            <div class="answer-card">
                <div class="question-header">
                    <span class="question-title">
                        <span class="q-number">Q${status.count}.</span>
                        ${quiz.content}
                    </span>

                    <c:if test="${answer.correct}">
                        <span class="result-badge correct">정답 (O)</span>
                    </c:if>
                    <c:if test="${not answer.correct}">
                        <span class="result-badge incorrect">오답 (X)</span>
                    </c:if>
                </div>

                <c:choose>
                    <%-- CASE 1: 객관식 유형 (SENTENCE_ORDER가 아님) --%>
                    <c:when test="${quiz.quizType != 'SENTENCE_ORDER'}">
                        <ul class="options-list">
                            <c:forEach var="option" items="${quiz.options}">
                                <c:set var="isCorrectAnswer" value="${option.correct}"/>
                                <c:set var="isUserChoice" value="${option.optionId == answer.selectedOptionId}"/>

                                <c:set var="liClass" value="option-item"/>
                                <c:if test="${isCorrectAnswer}">
                                    <c:set var="liClass" value="${liClass} correct-answer"/>
                                </c:if>
                                <c:if test="${isUserChoice && !isCorrectAnswer}">
                                    <c:set var="liClass" value="${liClass} selected-incorrect"/>
                                </c:if>
                                <c:if test="${isUserChoice && isCorrectAnswer}">
                                    <c:set var="liClass" value="${liClass} user-selected"/>
                                </c:if>

                                <li class="${liClass}">
                                    <span>${option.content}</span>

                                        <%-- 마커 표시 --%>
                                    <c:choose>
                                        <c:when test="${isCorrectAnswer && isUserChoice}">
                                            <span class="user-choice-marker">&lt;-- 정답 (나의 선택)</span>
                                        </c:when>
                                        <c:when test="${isCorrectAnswer && !isUserChoice}">
                                            <span class="user-choice-marker correct-answer-text">(정답)</span>
                                        </c:when>
                                        <c:when test="${!isCorrectAnswer && isUserChoice}">
                                            <span class="user-choice-marker">&lt;-- 나의 오답</span>
                                        </c:when>
                                    </c:choose>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:when>

                    <%-- CASE 2: 문장 순서 유형 (SENTENCE_ORDER) --%>
                    <c:otherwise>
                        <div class="sentence-result">
                            <h4>
                                정답 순서
                                <c:if test="${answer.correct}">
                                    <span class="marker correct-marker">(정답 맞춤)</span>
                                </c:if>
                                <c:if test="${!answer.correct}">
                                    <span class="marker incorrect-marker">(오답)</span>
                                </c:if>
                            </h4>

                            <ol class="sentence-list">
                                <c:forEach var="option" items="${quiz.options}">
                                    <c:if test="${option.correct}">
                                        <li>${option.content}</li>
                                    </c:if>
                                </c:forEach>
                            </ol>

                            <c:if test="${not answer.correct}">
                                <p class="note-text">
                                    * 사용자가 제출한 순서가 위 정답 순서와 다릅니다.
                                </p>
                            </c:if>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </c:forEach>
    </div>
</div>