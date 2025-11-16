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
        /* .main-content의 상단 패딩(24px)이 있으므로,
           타이틀의 상단 마진은 필요 없거나 적게 줍니다.
           여기서는 mb-20px로 아래 요소와의 간격만 설정합니다. */
        margin-bottom: 20px;
    }

    #record-list-container {
        display: flex;
        flex-direction: column;
        gap: 12px; /* 각 항목 사이의 간격 */
    }

    .record-item {
        display: flex;
        justify-content: space-between; /* 정보 영역과 점수 영역을 양쪽으로 분리 */
        align-items: center; /* 세로 중앙 정렬 */

        padding: 16px;
        background-color: var(--color-bg-content); /* #F9F9F9 */
        border-radius: 8px;
        border: 1px solid var(--color-border); /* #E0E0E0 */

        transition: box-shadow 0.2s ease;
    }

    .record-item:hover {
        /* (PC 환경 고려) 마우스 오버 시 살짝 그림자 */
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    .record-item__info {
        display: flex;
        flex-direction: column;
        gap: 4px; /* 퀴즈 이름과 날짜 사이 간격 */

        /* 점수 영역이 커져도 정보 영역이 줄어들지 않도록 설정 */
        flex-grow: 1;
        min-width: 0; /* flex item의 width가 0보다 작아질 수 있게 함 (text-overflow 적용) */
    }

    .record-item__name {
        font-size: 1rem; /* 16px */
        font-weight: 500;
        color: var(--color-text); /* #333 */

        /* 이름이 너무 길 경우 ... 처리 */
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

        flex-shrink: 0; /* 점수 영역이 찌그러지지 않도록 고정 */
        margin-left: 16px; /* 정보 영역과의 최소 간격 */

        /* "점" 텍스트 정렬을 위해 */
        display: flex;
        align-items: baseline;
    }

    .record-item__score span {
        /* 점수 숫자 강조 */
        font-size: 1.75rem; /* 28px */
        margin-right: 2px; /* '점' 과의 간격 */
    }

    /* 기록이 없을 때 표시될 메시지 스타일 */
    .record-list-empty {
        text-align: center;
        padding: 60px 20px;
        font-size: 1rem;
        color: var(--color-text-sub);
        background-color: var(--color-bg-content);
        border-radius: 8px;
        border: 1px dashed var(--color-border);
    }
</style>


<div class="record-page-container">
    <h2 class="record-page-title">퀴즈 기록</h2>

    <div id="record-list-container">
        <%--
            JavaScript가 이 영역을 채웁니다.

            [로딩 중 스켈레톤 UI (선택 사항)]
            <div class="record-item skeleton">...</div>
        --%>
    </div>
</div>

<%--
    index.jsp가 아닌 이 파일에 직접 모듈을 포함시킵니다.
    이 페이지가 로드될 때만 이 스크립트가 실행되도록 하기 위함입니다.
--%>
<script type="module" src="${pageContext.request.contextPath}/js/quiz/record-list.js"></script>