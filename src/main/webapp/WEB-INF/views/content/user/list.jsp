<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="path" class="java.lang.String" scope="request"/>
<jsp:useBean id="data" class="java.lang.Object" scope="request"/>

<div class="list-header">
    <h2 class="page-title">회원 목록 관리</h2>
    <p class="total-count">총 ${data.users.totalElements}명</p>
</div>

<div class="user-list-section">
    <c:forEach items="${data.users.content}" var="user">
        <div class="user-item">
            <div class="user-info">
                <div class="user-main-info">
                    <h3 class="user-item-name">${user.username}</h3>
                    <span class="user-role-badge ${user.role == 'ADMIN' ? 'admin' : 'user'}">${user.role}</span>
                </div>
                <div class="user-details-rows">
                    <div class="detail-row">
                        <span class="detail-label">로그인 ID</span>
                        <span class="detail-value">${user.loginId}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">레벨</span>
                        <span class="detail-value">${user.level}</span>
                    </div>
                </div>
            </div>
            <div class="user-actions">
                <c:choose>
                    <c:when test="${user.id == data.currentUserId}">
                        <span class="self-badge">본인</span>
                    </c:when>
                    <c:otherwise>
                        <form action="${pageContext.request.contextPath}/users/delete/${user.id}?page=${data.currentPage}"
                              method="post"
                              style="margin: 0;"
                              onsubmit="return confirm('${user.username} 회원을 삭제하시겠습니까?');">
                            <button type="submit" class="btn-delete-user">삭제</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:forEach>
</div>


<style>
    /* Page Header */
    .list-header {
        margin-bottom: 24px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .page-title {
        font-size: 1.5rem;
        font-weight: 700;
        margin: 0;
    }

    .total-count {
        font-size: 0.9rem;
        color: var(--color-text-sub);
        margin: 0;
    }

    /* User List */
    .user-list-section {
        background-color: var(--color-bg-content);
        border-radius: 8px;
        border: 1px solid var(--color-border);
        overflow: hidden;
    }

    .user-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 24px;
        border-bottom: 1px solid var(--color-border);
        transition: background-color 0.2s ease;
    }

    .user-item:last-child {
        border-bottom: none;
    }

    .user-item:hover {
        background-color: var(--color-bg-hover, rgba(0, 0, 0, 0.02));
    }

    .user-info {
        flex: 1;
    }

    .user-main-info {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 10px;
    }

    .user-item-name {
        font-size: 1.2rem;
        font-weight: 600;
        margin: 0;
        color: var(--color-text);
    }

    .user-role-badge {
        display: inline-block;
        padding: 4px 12px;
        border-radius: 12px;
        font-size: 0.8rem;
        font-weight: 600;
    }

    .user-role-badge.admin {
        background-color: #e3f2fd;
        color: #1976d2;
    }

    .user-role-badge.user {
        background-color: #f5f5f5;
        color: #757575;
    }

    .user-details-rows {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .detail-row {
        display: flex;
        align-items: center;
        gap: 12px;
        font-size: 0.9rem;
    }

    .detail-label {
        min-width: 80px;
        color: var(--color-text-sub);
        font-weight: 500;
    }

    .detail-value {
        color: var(--color-text);
        font-weight: 600;
    }

    /* User Actions */
    .user-actions {
        display: flex;
        align-items: center;
    }

    .self-badge {
        display: inline-block;
        padding: 6px 16px;
        background-color: #f5f5f5;
        color: #757575;
        border-radius: 6px;
        font-size: 0.85rem;
        font-weight: 600;
    }

    .btn-delete-user {
        padding: 8px 16px;
        background-color: transparent;
        color: #f44336;
        border: 1px solid #f44336;
        border-radius: 6px;
        font-size: 0.85rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .btn-delete-user:hover {
        background-color: #f44336;
        color: white;
    }

</style>