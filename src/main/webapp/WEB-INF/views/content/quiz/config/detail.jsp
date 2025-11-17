<%--
  File: /WEB-INF/views/content/quiz/config/detail.jsp
  Description: 퀴즈 설정 상세 ("목록으로" 버튼 상시 노출)
  Version: 3.1
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<%-- 페이지별 CSS --%>
<style>
    .quiz-config-detail-container {
        display: flex;
        flex-direction: column;
        gap: 24px;
    }

    /* --- 1. 상단 헤더 (제목 + 아이콘) --- */
    .detail-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 16px;
    }

    .quiz-title {
        font-size: 1.4rem;
        font-weight: 700;
        margin: 0;
        flex: 1;
        line-height: 1.4;
    }

    .icon-buttons {
        display: flex;
        gap: 8px;
        flex-shrink: 0;
    }

    .icon-btn {
        background: none;
        border: none;
        cursor: pointer;
        font-size: 1.5rem;
        padding: 8px;
        border-radius: 50%;
        width: 44px;
        height: 44px;
        line-height: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: background-color 0.2s;
    }

    .icon-btn:hover {
        background-color: var(--color-bg-content);
    }

    .btn-danger-icon {
        color: var(--color-error);
    }

    .btn-danger-icon:hover {
        background-color: #FFF0F0;
    }

    /* --- 2. 공통 카드 스타일 --- */
    .section-card {
        background-color: var(--color-bg);
        border: 1px solid var(--color-border);
        border-radius: 12px;
        padding: 24px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    }

    .section-card h3 {
        font-size: 1.2rem;
        font-weight: 700;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 1px solid var(--color-border);
    }

    /* --- 3. 수정 폼 --- */
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

    /* [수정] '설정 저장' 버튼은 .btn-primary의 width: 100%를 사용 */
    #btn-update {
        margin-top: 16px; /* 폼 요소와 간격 */
    }

    /* --- 4. 기본 정보 --- */
    .info-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 12px;
    }

    .info-item {
        font-size: 0.9rem;
    }

    .info-item strong {
        display: block;
        color: var(--color-text-sub);
        font-weight: 500;
        margin-bottom: 4px;
    }

    .info-item span {
        font-size: 1rem;
        color: var(--color-text);
        font-weight: 500;
    }

    /* --- 5. 퀴즈 목록 --- */
    .quiz-list {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        flex-direction: column;
        gap: 16px;
    }

    .quiz-list-item {
        background-color: var(--color-bg-content);
        border: 1px solid var(--color-border);
        border-radius: 8px;
        padding: 16px;
    }

    .quiz-content {
        font-weight: 700;
        margin-bottom: 12px;
    }

    .option-list {
        list-style: none;
        padding-left: 16px;
        margin: 0;
        font-size: 0.9rem;
        display: flex;
        flex-direction: column;
        gap: 6px;
    }

    .option-item.option-correct {
        color: var(--color-primary);
        font-weight: 700;
    }

    .empty-quiz-list {
        text-align: center;
        color: var(--color-text-sub);
        padding: 20px;
    }

    /* --- [신규] 6. 페이지 하단 액션 버튼 (목록으로) --- */
    .page-actions {
        margin-top: 16px; /* 마지막 카드와의 간격 */
        border-top: 1px solid var(--color-border);
        padding-top: 24px;
    }

    /* [수정] .btn-secondary는 .page-actions 내부에서 단독으로 사용됨 */
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
        text-decoration: none; /* <a> 태그이므로 밑줄 제거 */
    }

    .btn-secondary:hover {
        background-color: var(--color-bg-content);
    }

    /* --- 유틸리티 --- */
    .hidden {
        display: none;
    }

</style>

<div class="quiz-config-detail-container" data-config-id="${data.configId}">

    <%-- 1. 상단 헤더 (제목 + 아이콘 버튼) --%>
    <div class="detail-header">
        <h1 class="quiz-title">${data.quizName}</h1>
        <div class="icon-buttons">
            <button type="button" id="btn-edit-toggle" class="icon-btn" title="수정">✏️</button>
            <button type="button" id="btn-delete" class="icon-btn btn-danger-icon" title="삭제">🗑️</button>
        </div>
    </div>

    <%-- 2. 퀴즈 설정 수정 폼 (기본 숨김) --%>
    <div id="config-update-card" class="section-card hidden">
        <h3>설정 수정</h3>
        <form id="config-update-form" onsubmit="return false;">
            <div class="form-group">
                <label for="quizName" class="form-label">퀴즈 이름</label>
                <input type="text" id="quizName" class="form-control" value="${data.quizName}" required minlength="1"
                       maxlength="50">
            </div>
            <div class="form-group">
                <label for="quizLevel" class="form-label">레벨</label>
                <select id="quizLevel" class="form-control">
                    <option value="BEGINNER" ${data.level == 'BEGINNER' ? 'selected' : ''}>BEGINNER</option>
                    <option value="INTERMEDIATE" ${data.level == 'INTERMEDIATE' ? 'selected' : ''}>INTERMEDIATE</option>
                    <option value="ADVANCED" ${data.level == 'ADVANCED' ? 'selected' : ''}>ADVANCED</option>
                </select>
            </div>

            <%-- [수정] '설정 저장' 버튼만 폼 내부에 남김 --%>
            <button type="button" id="btn-update" class="btn-primary">설정 저장</button>
        </form>
    </div>

    <%-- 3. 기본 정보 --%>
    <div class="section-card">
        <h3>기본 정보</h3>
        <div class="info-grid">
            <div class="info-item">
                <strong>Config ID</strong>
                <span>${data.configId}</span>
            </div>
            <div class="info-item">
                <strong>총 문항수</strong>
                <span>${data.quizzes.size()} 문항</span>
            </div>
            <div class="info-item">
                <strong>생성일</strong>
                <fmt:parseDate value="${data.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdDate" type="BOTH"/>
                <span><fmt:formatDate value="${createdDate}" pattern="yyyy.MM.dd HH:mm"/></span>
            </div>
            <div class="info-item">
                <strong>최근 수정일</strong>
                <fmt:parseDate value="${data.updatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="updatedDate" type="BOTH"/>
                <span><fmt:formatDate value="${updatedDate}" pattern="yyyy.MM.dd HH:mm"/></span>
            </div>
        </div>
    </div>


    <%-- 4. 포함된 퀴즈 목록 --%>
    <div class="section-card">
        <h3>포함된 퀴즈 목록 (${data.quizzes.size()}개)</h3>
        <ul class="quiz-list">
            <c:choose>
                <c:when test="${not empty data.quizzes}">
                    <c:forEach var="quiz" items="${data.quizzes}" varStatus="status">
                        <li class="quiz-list-item">
                            <div class="quiz-content"><strong>Q${status.count}.</strong> ${quiz.content}</div>
                            <ul class="option-list">
                                <c:forEach var="option" items="${quiz.options}">
                                    <li class="option-item ${option.correct ? 'option-correct' : ''}">
                                            ${option.content}
                                        <c:if test="${option.correct}"> (정답)</c:if>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <li class="empty-quiz-list">포함된 퀴즈가 없습니다.</li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

    <%-- [신규] 5. 상시 노출되는 '목록으로' 버튼 --%>
    <div class="page-actions">
        <a href="${pageContext.request.contextPath}/quiz/configs" class="btn-secondary">목록으로</a>
    </div>

</div>

<script type="module" src="/js/quiz/config-detail.js"></script>