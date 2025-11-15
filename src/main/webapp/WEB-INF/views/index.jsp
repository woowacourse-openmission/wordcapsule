<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>WordCapsule</title>
    <%-- 공통 스타일시트 등 링크 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%-- 1. 공통 헤더 포함 --%>
<jsp:include page="layout/header.jsp"/>

<%-- 2. 메인 콘텐츠 영역 --%>
<main>
    <c:if test="${not empty path}">
        <jsp:include page="${path}" flush="true"/>
    </c:if>

    <c:if test="${empty path}">
        <h2>컨텐츠를 찾지 못함</h2>
    </c:if>
</main>

<jsp:include page="layout/footer.jsp"/>

</body>
</html>