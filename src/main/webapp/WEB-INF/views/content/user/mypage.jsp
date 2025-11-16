<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .mypage-container {
        max-width: 600px;
        margin: 40px auto;
        padding: 20px;
    }
    .mypage-container h2 {
        color: #2c3e50;
        margin-bottom: 30px;
        padding-bottom: 15px;
        border-bottom: 2px solid #3498db;
    }
    .info-section {
        background: white;
        padding: 20px;
        border-radius: 4px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        margin-bottom: 20px;
    }
    .info-row {
        display: flex;
        padding: 15px 0;
        border-bottom: 1px solid #ecf0f1;
    }
    .info-row:last-child {
        border-bottom: none;
    }
    .info-label {
        flex: 0 0 150px;
        font-weight: 600;
        color: #555;
    }
    .info-value {
        flex: 1;
        color: #333;
    }
    .btn-group {
        display: flex;
        gap: 10px;
        margin-top: 20px;
    }
</style>

<div class="mypage-container">
    <h2>마이페이지</h2>

    <div class="info-section">
        <div class="info-row">
            <div class="info-label">로그인 ID</div>
            <div class="info-value">${user.loginId}</div>
        </div>
        <div class="info-row">
            <div class="info-label">사용자 이름</div>
            <div class="info-value">${user.username}</div>
        </div>
    </div>

    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/view/users/edit" class="btn btn-primary">정보 수정</a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">홈으로</a>
    </div>

    <div class="action-section">
        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/view/users/logout" class="btn btn-secondary">로그아웃</a>
            <form action="${pageContext.request.contextPath}/view/users/delete" method="post"
                  onsubmit="return confirm('정말로 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.');"
                  style="flex: 1; margin: 0;">
                <button type="submit" class="btn btn-secondary">회원 탈퇴</button>
            </form>
        </div>
    </div>
</div>