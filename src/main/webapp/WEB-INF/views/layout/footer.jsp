<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
    <a href="${pageContext.request.contextPath}/quiz/configs">퀴즈</a>
    <a href="${pageContext.request.contextPath}/">홈</a>
    <c:choose>
        <c:when test="${not empty sessionScope.loginId}">
            <a href="${pageContext.request.contextPath}/">마이페이지</a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/view/users/login">로그인</a>
        </c:otherwise>
    </c:choose>
</footer>