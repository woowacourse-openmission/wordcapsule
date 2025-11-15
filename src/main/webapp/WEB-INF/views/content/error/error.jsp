<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="error-container">
    <h1 class="error-status">${status}</h1>
    <h2 class="error-title">${message}</h2>

    <c:if test="${not empty errorMessage}">
        <p class="error-detail">상세 오류 메시지: <c:out value="${errorMessage}"/></p>
    </c:if>

    <p class="error-help">
        문제가 지속되면 시스템 관리자에게 문의하거나 잠시 후 다시 시도해 주세요.
    </p>
    <a href="javascript:history.back()" class="btn btn-secondary">이전 페이지로</a>
    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">홈으로 돌아가기</a>
</div>