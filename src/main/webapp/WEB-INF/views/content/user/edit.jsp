<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .edit-container {
        max-width: 600px;
        margin: 40px auto;
        padding: 20px;
    }
    .edit-container h2 {
        color: #2c3e50;
        margin-bottom: 30px;
        padding-bottom: 15px;
        border-bottom: 2px solid #3498db;
    }
    .form-section {
        background: white;
        padding: 30px;
        border-radius: 4px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: 600;
        color: #444;
    }
    .form-group input {
        width: 100%;
        padding: 12px;
        border: 1px solid #bdc3c7;
        border-radius: 4px;
    }
    .form-group input:focus {
        outline: none;
        border-color: #3498db;
    }
    .form-text {
        display: block;
        margin-top: 5px;
        font-size: 12px;
        color: #666;
    }
    .success-message {
        background-color: #e8f5e9;
        color: #2e7d32;
        padding: 12px;
        border-radius: 4px;
        margin-bottom: 20px;
        text-align: center;
        border: 1px solid #c8e6c9;
    }
    .error-message {
        background-color: #ffe6e6;
        color: #d32f2f;
        padding: 12px;
        border-radius: 4px;
        margin-bottom: 20px;
        text-align: center;
        border: 1px solid #ffcccc;
    }
    .btn-group {
        display: flex;
        gap: 10px;
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid #ecf0f1;
    }
    .btn {
        flex: 1;
    }
</style>

<div class="edit-container">
    <h2>정보 수정</h2>

    <c:if test="${not empty success}">
        <div class="success-message">${success}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <div class="form-section">
        <form action="${pageContext.request.contextPath}/view/users/edit" method="post">
            <div class="form-group">
                <label for="username">사용자 이름</label>
                <input type="text" id="username" name="username" value="${user.username}" maxlength="50">
                <small class="form-text">1자 이상 50자 이하로 입력해주세요</small>
            </div>

            <div class="form-group">
                <label for="password">비밀번호 (변경 시에만 입력)</label>
                <input type="password" id="password" name="password" minlength="8" maxlength="20">
                <small class="form-text">변경하지 않으려면 비워두세요 (8자 이상 20자 이하)</small>
            </div>

            <div class="btn-group">
                <a href="${pageContext.request.contextPath}/view/users/mypage" class="btn btn-secondary">취소</a>
                <button type="submit" class="btn btn-primary">저장</button>
            </div>
        </form>
    </div>
</div>