<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* 로그인 폼 중앙 정렬 */
        .login-page .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-form-container {
            padding: 40px;
            width: 100%;
            max-width: 400px;
        }

        .login-form-container h1 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--color-text);
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

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--color-text);
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid var(--color-border);
            border-radius: 4px;
            font-size: 1rem;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--color-primary);
        }

        .link-group {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid var(--color-border);
        }

        .link-group a {
            color: var(--color-primary);
            text-decoration: none;
            margin: 0 8px;
        }

        .link-group a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body class="login-page">
<div class="app-container">
    <jsp:include page="../../layout/header.jsp"/>

    <main class="main-content">
        <div class="login-form-container">
        <h1>로그인</h1>
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>
        <form action="${pageContext.request.contextPath}/users/login" method="post">
            <div class="form-group">
                <label for="loginId">로그인 ID</label>
                <input type="text" id="loginId" name="loginId" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-submit">로그인</button>
        </form>
        <div class="link-group">
            <a href="${pageContext.request.contextPath}/users/find-id">아이디 찾기</a>
            <a href="${pageContext.request.contextPath}/users/find-password">비밀번호 찾기</a>
            <a href="${pageContext.request.contextPath}/users/new">회원가입</a>
        </div>
    </main>
</div>
</body>
</html>