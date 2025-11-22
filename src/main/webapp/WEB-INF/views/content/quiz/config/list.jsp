<%--
  File: /WEB-INF/views/content/quiz/config/list.jsp
  Description: 퀴즈 설정 목록 (어드민용: 생성 버튼, 상세보기 링크)
  Version: 2.0 (Admin UI)
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<%--
  페이지별 CSS:
  공용 style.css에 영향을 주지 않고, 이 페이지에만 적용되는 스타일을 정의합니다.
--%>
<style>
    /* --- 1. 헤더 (h1 + 생성 버튼) --- */
    .list-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 24px;
    }

    .list-header h1 {
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--color-text);
        margin-bottom: 0; /* flex 적용으로 기존 margin 제거 */
    }

    /* 새 퀴즈 생성 버튼 (btn-primary 기반) */
    .btn-create {
        /* .btn-primary의 width: 100%를 오버라이드 */
        width: auto;
        padding: 10px 16px;
        font-size: 0.9rem;
        font-weight: 500;
        /* btn-primary의 나머지 속성(배경,색상 등)은 상속 */
    }

    /* --- 2. 리스트 --- */
    .quiz-config-list {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        flex-direction: column;
        gap: 16px; /* 카드 사이의 간격 */
    }

    .quiz-config-item {
        background-color: var(--color-bg);
        border: 1px solid var(--color-border);
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;

        /* [수정] 클릭 가능하도록 커서 변경 */
        cursor: pointer;

        /* [수정] <a> 태그가 패딩을 갖도록 <li>의 패딩 제거 */
        padding: 0;
        overflow: hidden; /* border-radius가 <a>에도 적용되도록 */
    }

    .quiz-config-item:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
    }

    /* [신규] 카드 전체를 감싸는 <a> 태그 */
    .card-link {
        display: block;
        padding: 20px; /* 패딩을 <li> 대신 <a>에 적용 */
        text-decoration: none;
        color: inherit; /* 부모(li)의 텍스트 색상 상속 */
    }

    .item-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 12px;
    }

    .quiz-name {
        font-size: 1.15rem;
        font-weight: 700;
        color: var(--color-text);
        flex: 1;
        margin-right: 10px;
    }

    .quiz-level {
        font-size: 0.8rem;
        font-weight: 700;
        padding: 4px 10px;
        border-radius: 20px;
        color: white;
        flex-shrink: 0;
    }

    /* 레벨별 색상 (예시) */
    .level-BEGINNER {
        background-color: #4CAF50;
    }

    .level-INTERMEDIATE {
        background-color: #FFC107;
    }

    .level-ADVANCED {
        background-color: #F44336;
    }

    .item-details {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 0.9rem;
        color: var(--color-text-sub);

        /* [수정] 상세보기 링크로 바뀌면서 하단 여백 제거 */
        /* margin-bottom: 20px; */
    }

    /* [삭제] .btn-start-quiz 관련 CSS 제거 */


    /* --- 3. 데이터 없음 --- */
    .empty-list-message {
        text-align: center;
        padding: 60px 20px;
        background-color: var(--color-bg-content);
        border-radius: 12px;
    }

    .empty-list-message p {
        font-size: 1.1rem;
        color: var(--color-text-sub);
        margin-bottom: 0; /* [수정] 버튼 제거로 margin 제거 */
    }


    /* --- 4. 페이지네이션 (변경 없음) --- */
    .pagination {
        margin-top: 32px;
    }

    .pagination-list {
        display: flex;
        justify-content: center;
        align-items: center;
        list-style: none;
        padding: 0;
    }

    .page-item {
        margin: 0 4px;
    }

    .page-link {
        display: block;
        min-width: 36px;
        height: 36px;
        padding: 0 8px;
        line-height: 36px;
        text-align: center;
        text-decoration: none;
        color: var(--color-text-sub);
        background-color: var(--color-bg);
        border: 1px solid var(--color-border);
        border-radius: 8px;
        transition: background-color 0.2s, color 0.2s;
    }

    .page-link:hover {
        background-color: #f5f5f5;
        color: var(--color-text);
    }

    .page-item.active .page-link {
        background-color: var(--color-primary);
        color: white;
        border-color: var(--color-primary);
        font-weight: 700;
    }

    .page-item.disabled .page-link {
        color: #cccccc;
        pointer-events: none;
        background-color: #f9f9f9;
    }

</style>

<div class="quiz-config-container">

    <div class="list-header">
        <h1>퀴즈 설정 리스트</h1>
        <%-- TODO: 링크 연결 --%>
        <a href="${pageContext.request.contextPath}/quiz/config/new" class="btn-primary btn-create">새 퀴즈 생성</a>
    </div>

    <%-- 2. 퀴즈 설정 리스트 --%>
    <div class="quiz-config-list-container">
        <c:choose>
            <c:when test="${empty content}">
                <div class="empty-list-message">
                    <p>생성된 퀴즈 설정이 없습니다.</p>
                </div>
            </c:when>

            <c:otherwise>
                <ul class="quiz-config-list">
                    <c:forEach var="config" items="${content}">
                        <li class="quiz-config-item">
                            <c:url var="detailUrl" value="/quiz/config/${config.configId}"/>

                            <a href="${detailUrl}" class="card-link">
                                <div class="item-header">
                                    <span class="quiz-name">${config.quizName}</span>
                                    <span class="quiz-level level-${config.level}">${config.level}</span>
                                </div>
                                <div class="item-details">
                                    <span class="quiz-count">총 ${config.quizCount} 문항</span>
                                    <span class="quiz-date">
                                        <fmt:parseDate value="${config.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                                       var="parsedDate" type="BOTH"/>
                                        <fmt:formatDate value="${parsedDate}" pattern="yyyy.MM.dd 생성"/>
                                    </span>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${not empty content and totalPages > 1}">
        <nav class="pagination">
            <ul class="pagination-list">

                <%-- '이전' 버튼 --%>
                <c:choose>
                    <c:when test="${first}">
                        <li class="page-item disabled"><span class="page-link">이전</span></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <c:url var="prevUrl" value="/quiz/configs">
                                <c:param name="page" value="${page - 1}"/>
                                <c:if test="${not empty param.level}"><c:param name="level"
                                                                               value="${param.level}"/></c:if>
                                <c:if test="${not empty param.quizType}"><c:param name="quizType"
                                                                                  value="${param.quizType}"/></c:if>
                                <c:if test="${not empty param.sort}"><c:param name="sort" value="${param.sort}"/></c:if>
                                <c:if test="${not empty param.size}"><c:param name="size" value="${param.size}"/></c:if>
                            </c:url>
                            <a class="page-link" href="${prevUrl}">이전</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <%-- 페이지 번호 목록 --%>
                <c:set var="startPage" value="${Math.max(0, page - 2)}"/>
                <c:set var="endPage" value="${Math.min(totalPages - 1, page + 2)}"/>
                <c:if test="${totalPages <= 5}">
                    <c:set var="startPage" value="0"/>
                    <c:set var="endPage" value="${totalPages - 1}"/>
                </c:if>
                <c:if test="${page < 2 && totalPages > 5}">
                    <c:set var="endPage" value="4"/>
                </c:if>
                <c:if test="${page > totalPages - 3 && totalPages > 5}">
                    <c:set var="startPage" value="${totalPages - 5}"/>
                </c:if>

                <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                    <li class="page-item ${pageNum == page ? 'active' : ''}">
                        <c:url var="pageUrl" value="/quiz/configs">
                            <c:param name="page" value="${pageNum}"/>
                            <c:if test="${not empty param.level}"><c:param name="level" value="${param.level}"/></c:if>
                            <c:if test="${not empty param.quizType}"><c:param name="quizType"
                                                                              value="${param.quizType}"/></c:if>
                            <c:if test="${not empty param.sort}"><c:param name="sort" value="${param.sort}"/></c:if>
                            <c:if test="${not empty param.size}"><c:param name="size" value="${param.size}"/></c:if>
                        </c:url>
                        <a class="page-link" href="${pageUrl}">${pageNum + 1}</a>
                    </li>
                </c:forEach>

                <%-- '다음' 버튼 --%>
                <c:choose>
                    <c:when test="${last}">
                        <li class="page-item disabled"><span class="page-link">다음</span></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <c:url var="nextUrl" value="/quiz/configs">
                                <c:param name="page" value="${page + 1}"/>
                                <c:if test="${not empty param.level}"><c:param name="level"
                                                                               value="${param.level}"/></c:if>
                                <c:if test="${not empty param.quizType}"><c:param name="quizType"
                                                                                  value="${param.quizType}"/></c:if>
                                <c:if test="${not empty param.sort}"><c:param name="sort" value="${param.sort}"/></c:if>
                                <c:if test="${not empty param.size}"><c:param name="size" value="${param.size}"/></c:if>
                            </c:url>
                            <a class="page-link" href="${nextUrl}">다음</a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </nav>
    </c:if>

</div>