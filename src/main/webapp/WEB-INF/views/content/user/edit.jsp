<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<div class="edit-header">
    <h2 class="page-title">정보 수정</h2>
</div>

<c:if test="${not empty success}">
    <div class="message-box success-message">
        <span>${success}</span>
    </div>
</c:if>

<c:if test="${not empty error}">
    <div class="message-box error-message">
        <span>${error}</span>
    </div>
</c:if>

<form action="${pageContext.request.contextPath}/users/edit" method="post">
    <h3 class="section-title">기본 정보</h3>
    <div class="form-card">
        <div class="form-group">
            <label for="username" class="form-label">사용자 이름</label>
            <input type="text" id="username" name="username" value="${data.username}"
                   maxlength="50" class="form-input" required>
            <small class="form-text">1자 이상 50자 이하로 입력해주세요</small>
        </div>
    </div>

    <h3 class="section-title">학습 레벨</h3>
    <div class="form-card">
        <div class="form-group">
            <label for="level" class="form-label">난이도</label>
            <select id="level" name="level" class="form-select">
                <option value="BEGINNER" ${data.level == 'BEGINNER' ? 'selected' : ''}>초급 (BEGINNER)</option>
                <option value="INTERMEDIATE" ${data.level == 'INTERMEDIATE' ? 'selected' : ''}>중급 (INTERMEDIATE)</option>
                <option value="ADVANCED" ${data.level == 'ADVANCED' ? 'selected' : ''}>고급 (ADVANCED)</option>
            </select>
            <small class="form-text">학습하고 싶은 난이도를 선택하세요</small>
        </div>
    </div>

    <h3 class="section-title">비밀번호 변경</h3>
    <div class="form-card">
        <div class="form-group">
            <label for="password" class="form-label">새 비밀번호</label>
            <input type="password" id="password" name="password"
                   minlength="8" maxlength="20" class="form-input" placeholder="변경하지 않으려면 비워두세요">
            <small class="form-text">8자 이상 20자 이하</small>
        </div>
    </div>

    <div class="button-section">
        <a href="${pageContext.request.contextPath}/users/mypage" class="action-btn btn-cancel">취소</a>
        <button type="submit" class="action-btn btn-save">저장</button>
    </div>
</form>

<style>
    /* Page Header */
    .edit-header {
        margin-bottom: 24px;
    }

    .page-title {
        font-size: 1.5rem;
        font-weight: 700;
        margin: 0;
    }

    /* Section Title */
    .section-title {
        font-size: 1rem;
        font-weight: 700;
        margin: 0 0 12px 0;
        color: var(--color-text);
    }

    /* Message Box */
    .message-box {
        padding: 14px 16px;
        border-radius: 8px;
        margin-bottom: 20px;
        font-size: 0.9rem;
        text-align: center;
    }

    .success-message {
        background-color: #e8f5e9;
        color: #2e7d32;
        border: 1px solid #c8e6c9;
    }

    .error-message {
        background-color: #ffebee;
        color: #d32f2f;
        border: 1px solid #ffcdd2;
    }

    /* Form Card */
    .form-card {
        background-color: var(--color-bg-content);
        border-radius: 8px;
        border: 1px solid var(--color-border);
        padding: 20px;
        margin-bottom: 20px;
    }

    /* Form Group */
    .form-group {
        margin-bottom: 0;
    }

    .form-label {
        display: block;
        font-size: 0.9rem;
        font-weight: 600;
        color: var(--color-text);
        margin-bottom: 8px;
    }

    .form-input,
    .form-select {
        width: 100%;
        padding: 12px;
        border: 1px solid var(--color-border);
        border-radius: 6px;
        font-size: 0.95rem;
        background-color: var(--color-bg, white);
        color: var(--color-text);
        box-sizing: border-box;
    }

    .form-select {
        cursor: pointer;
    }

    .form-input:focus,
    .form-select:focus {
        outline: none;
        border-color: var(--color-primary, #4CAF50);
    }

    .form-text {
        display: block;
        margin-top: 6px;
        font-size: 0.8rem;
        color: var(--color-text-sub);
    }

    /* Button Section */
    .button-section {
        display: flex;
        gap: 10px;
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid var(--color-border);
    }

    .action-btn {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 14px 20px;
        border-radius: 8px;
        border: none;
        font-size: 0.95rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s ease;
        text-decoration: none;
    }

    .btn-cancel {
        background-color: #757575;
        color: white;
    }

    .btn-cancel:hover {
        background-color: #616161;
    }

    .btn-save {
        background-color: var(--color-primary, #4CAF50);
        color: white;
    }

    .btn-save:hover {
        background-color: #45a049;
    }
</style>