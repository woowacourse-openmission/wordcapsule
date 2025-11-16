<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="bottom-nav">
    <a class="bottom-nav-item" href="${pageContext.request.contextPath}/quiz/records?loginId=${sessionScope.loginId}">
        <span>기록</span>
    </a>
    <a class="bottom-nav-item" href="${pageContext.request.contextPath}/">
        <span>홈</span>
    </a>
    <a class="bottom-nav-item" href="${pageContext.request.contextPath}/users/mypage">
        <span>마이페이지</span>
    </a>
</nav>
