<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .find-id-page .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .find-id-form-container {
            padding: 40px;
            width: 100%;
            max-width: 400px;
        }

        .find-id-form-container h1 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--color-text);
        }

        .result-message {
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
<body class="find-id-page">
<div class="app-container">
    <jsp:include page="../../layout/header.jsp"/>

    <main class="main-content">
        <div class="find-id-form-container">
        <h1>아이디 찾기</h1>

        <c:if test="${not empty foundLoginId}">
            <div class="result-message">
                회원님의 아이디는 <strong>${foundLoginId}</strong> 입니다.
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/users/find-id" method="post">
            <div class="form-group">
                <label for="username">사용자 이름</label>
                <input type="text" id="username" name="username" required>
            </div>
            <button type="submit" class="btn btn-primary btn-submit">아이디 찾기</button>
        </form>

        <div class="link-group">
            <a href="${pageContext.request.contextPath}/users/login">로그인</a>
            <a href="${pageContext.request.contextPath}/users/find-password">비밀번호 찾기</a>
        </div>
    </main>
</div>
</body>
</html>