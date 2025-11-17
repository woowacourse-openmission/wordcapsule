<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    이 JSP는 index.jsp의 <main class="main-content"> 내부에 포함됩니다.
    .main-content는 이미 상하좌우 여백(padding: 24px 20px)을 가지고 있습니다.
--%>

<%-- 이 페이지 전용 스타일 --%>
<style>
    .record-page-title {
        font-size: 1.5rem; /* 24px */
        font-weight: 700;
        color: var(--color-text);
        margin-bottom: 20px;
    }

    #record-list-container {
        display: flex;
        flex-direction: column;
        gap: 12px; /* 각 항목 사이의 간격 */
        /* [수정] 목록이 적을 때를 대비해 최소 높이 설정 */
        min-height: 300px;
    }

    /* <a> 태그로 변경되어도 스타일 유지 */
    .record-item {
        display: flex;
        justify-content: space-between;
        align-items: center;

        padding: 16px;
        background-color: var(--color-bg-content); /* #F9F9F9 */
        border-radius: 8px;
        border: 1px solid var(--color-border); /* #E0E0E0 */

        transition: box-shadow 0.2s ease;

        text-decoration: none;
        color: inherit;
    }

    .record-item:hover {
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        cursor: pointer;
    }

    .record-item__info {
        display: flex;
        flex-direction: column;
        gap: 4px; /* 퀴즈 이름과 날짜 사이 간격 */
        flex-grow: 1;
        min-width: 0;
    }

    .record-item__name {
        font-size: 1rem; /* 16px */
        font-weight: 500;
        color: var(--color-text); /* #333 */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .record-item__date {
        font-size: 0.875rem; /* 14px */
        color: var(--color-text-sub); /* #757575 */
    }

    .record-item__score {
        font-size: 1.125rem; /* 18px */
        font-weight: 700;
        color: var(--color-primary); /* #4CAF50 */
        flex-shrink: 0;
        margin-left: 16px;
        display: flex;
        align-items: baseline;
    }

    .record-item__score span {
        font-size: 1.75rem; /* 28px */
        margin-right: 2px;
    }

    .record-list-empty {
        text-align: center;
        padding: 60px 20px;
        font-size: 1rem;
        color: var(--color-text-sub);
        background-color: var(--color-bg-content);
        border-radius: 8px;
        border: 1px dashed var(--color-border);
    }

    /* --- [삭제] 무한 스크롤 로더 스타일 --- */
    /* #record-list-loader ... (제거됨) */

    /* --- [추가] 페이지네이션 컨테이너 스타일 --- */
    #pagination-container {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 8px;
        margin-top: 32px; /* 목록과의 간격 */
    }

    .page-link {
        font-size: 0.9rem;
        font-weight: 500;
        color: var(--color-text-sub);
        padding: 6px 12px;
        border-radius: 6px;
        text-decoration: none;
        transition: background-color 0.2s ease;
    }

    .page-link:hover {
        background-color: var(--color-bg-content);
    }

    .page-link.active {
        background-color: var(--color-primary);
        color: white;
        font-weight: 700;
    }

    .page-link.disabled {
        color: var(--color-border);
        cursor: default;
    }

    .page-link.disabled:hover {
        background-color: transparent;
    }

</style>


<div class="record-page-container">
    <h2 class="record-page-title">퀴즈 기록</h2>

    <%--
      [수정] JS가 contextPath를 참조할 수 있도록 data 속성 추가
    --%>
    <div id="record-list-container"
         data-context-path="${pageContext.request.contextPath}">
        <%-- JavaScript가 이 영역을 채웁니다. --%>
    </div>

    <%--
      [삭제] 무한 스크롤 로더 요소 제거
      <div id="record-list-loader">...</div>
    --%>

    <%--
      [추가] 전통적 페이지네이션 컨테이너
    --%>
    <nav id="pagination-container" aria-label="Page navigation"></nav>

</div>

<%--
    이 페이지가 로드될 때만 이 스크립트가 실행되도록 설정
--%>
<script type="module" src="${pageContext.request.contextPath}/js/quiz/record-list.js"></script>