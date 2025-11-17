<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<div class="mypage-header">
    <h2 class="page-title">마이페이지</h2>
</div>

<h3 class="section-title">👤 내 정보</h3>
<div class="user-info-card">
    <div class="info-row">
        <span class="info-label">이름</span>
        <span class="info-value">${data.username}</span>
    </div>
    <div class="info-row">
        <span class="info-label">로그인 ID</span>
        <span class="info-value">${data.loginId}</span>
    </div>
    <div class="info-row">
        <span class="info-label">레벨</span>
        <span class="info-value level-text">${data.level}</span>
    </div>
</div>

<h3 class="section-title">⚙️ 계정 관리</h3>
<div class="menu-section">
    <a href="${pageContext.request.contextPath}/users/edit" class="menu-item">
        <span class="menu-text">정보 수정</span>
        <span class="menu-arrow">›</span>
    </a>
    <a href="${pageContext.request.contextPath}/users/logout" class="menu-item">
        <span class="menu-text">로그아웃</span>
        <span class="menu-arrow">›</span>
    </a>
</div>

<c:if test="${data.role == 'ADMIN'}">
    <h3 class="section-title">👥 관리자</h3>
    <div class="menu-section">
        <a href="${pageContext.request.contextPath}/users/list" class="menu-item">
            <span class="menu-text">회원 목록 관리</span>
            <span class="menu-arrow">›</span>
        </a>
        <a href="${pageContext.request.contextPath}/quiz/configs" class="menu-item">
            <span class="menu-text">퀴즈 설정 관리</span>
            <span class="menu-arrow">›</span>
        </a>
    </div>
</c:if>

<div class="danger-zone">
    <form action="${pageContext.request.contextPath}/users/delete" method="post"
          onsubmit="return confirm('정말로 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.');">
        <button type="submit" class="delete-account-btn">회원 탈퇴</button>
    </form>
</div>

<style>
    /* Page Header */
    .mypage-header {
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

    /* User Info Card */
    .user-info-card {
        background-color: var(--color-bg-content);
        border-radius: 8px;
        border: 1px solid var(--color-border);
        margin-bottom: 20px;
    }

    .info-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px;
        border-bottom: 1px solid var(--color-border);
    }

    .info-row:last-child {
        border-bottom: none;
    }

    .info-label {
        font-size: 0.9rem;
        color: var(--color-text-sub);
        font-weight: 500;
    }

    .info-value {
        font-size: 0.95rem;
        color: var(--color-text);
        font-weight: 600;
    }

    .level-text {
        color: var(--color-primary, #4CAF50);
        font-weight: 700;
    }

    /* Menu Section */
    .menu-section {
        background-color: var(--color-bg-content);
        border-radius: 8px;
        border: 1px solid var(--color-border);
        margin-bottom: 20px;
    }

    .menu-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px;
        text-decoration: none;
        color: var(--color-text);
        border-bottom: 1px solid var(--color-border);
        transition: background-color 0.2s ease;
    }

    .menu-item:last-child {
        border-bottom: none;
    }

    .menu-item:hover {
        background-color: var(--color-bg-hover, rgba(0, 0, 0, 0.02));
    }

    .menu-text {
        font-size: 0.95rem;
        font-weight: 500;
    }

    .menu-arrow {
        font-size: 1.5rem;
        color: var(--color-text-sub);
    }

    .danger-zone {
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid var(--color-border);
    }

    .delete-account-btn {
        width: 100%;
        padding: 14px;
        background-color: transparent;
        color: #f44336;
        border: 1px solid #f44336;
        border-radius: 8px;
        font-size: 0.95rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .delete-account-btn:hover {
        background-color: #f44336;
        color: white;
    }
</style>