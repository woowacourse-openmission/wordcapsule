<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>

<c:set var="layout" value="${empty layoutType ? 'FULL' : layoutType.toString()}"/>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>WordCapsule</title>
    <%-- 공통 스타일시트 등 링크 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="app-container">
    <c:if test="${layout eq 'FULL' or layout eq 'NO_FOOTER'}">
        <jsp:include page="layout/header.jsp"/>
    </c:if>

    <main class="main-content">
        <c:if test="${not empty path}">
            <jsp:include page="${path}" flush="true"/>
        </c:if>

        <c:if test="${empty path}">
            <jsp:include page="content/home.jsp" flush="true"/>
        </c:if>
    </main>

    <c:if test="${layout eq 'FULL' or layout eq 'NO_HEADER'}">
        <jsp:include page="layout/footer.jsp"/>
    </c:if>
</div>

</body>
</html>