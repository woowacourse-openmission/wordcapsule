<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="error-container">
    <h1 class="error-status">404</h1>
    <h2 class="error-title">${message}</h2>
    <p class="error-detail">
        <c:out value="${errorPath}"/> 경로에 대한 자원을 찾을 수 없습니다.
    </p>
    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">홈으로 돌아가기</a>
</div>