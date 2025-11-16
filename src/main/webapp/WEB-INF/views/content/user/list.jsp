<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .list-container {
        max-width: 1000px;
        margin: 40px auto;
        padding: 20px;
    }
    .list-container h2 {
        color: #2c3e50;
        margin-bottom: 30px;
    }
    .user-table {
        width: 100%;
        background: white;
        border-collapse: collapse;
    }
    .user-table th {
        background-color: #3498db;
        color: white;
        padding: 15px;
        text-align: left;
    }
    .user-table td {
        padding: 12px 15px;
        border-bottom: 1px solid #ecf0f1;
    }
    .btn-delete {
        background-color: #e74c3c;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 4px;
        cursor: pointer;
    }
    .btn-delete:disabled {
        background-color: #bdc3c7;
        cursor: not-allowed;
    }
</style>

<div class="list-container">
    <h2>회원 목록 관리</h2>

    <table class="user-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>로그인 ID</th>
                <th>사용자 이름</th>
                <th>역할</th>
                <th>작업</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users.content}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.loginId}</td>
                    <td>${user.username}</td>
                    <td>${user.role}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.id == currentUserId}">
                                <button class="btn-delete" disabled>본인</button>
                            </c:when>
                            <c:otherwise>
                                <form action="${pageContext.request.contextPath}/view/users/delete/${user.id}?page=${currentPage}"
                                      method="post"
                                      style="display: inline; margin: 0;"
                                      onsubmit="return confirm('${user.username} 회원을 삭제하시겠습니까?');">
                                    <button type="submit" class="btn-delete">삭제</button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div style="margin-top: 20px;">
        <a href="${pageContext.request.contextPath}/view/users/mypage" class="btn btn-secondary">마이페이지로</a>
    </div>
</div>