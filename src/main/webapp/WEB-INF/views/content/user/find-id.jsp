<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .form-container {
            background: white;
            padding: 40px;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
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
        .btn-submit {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
        }
        .link-group {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #ecf0f1;
        }
        .link-group a {
            color: #3498db;
            text-decoration: none;
            margin: 0 10px;
        }
        .link-group a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>아이디 찾기</h1>

        <c:if test="${not empty foundLoginId}">
            <div class="result-message">
                회원님의 아이디는 <strong>${foundLoginId}</strong> 입니다.
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/view/users/find-id" method="post">
            <div class="form-group">
                <label for="username">사용자 이름</label>
                <input type="text" id="username" name="username" required>
            </div>
            <button type="submit" class="btn btn-primary btn-submit">아이디 찾기</button>
        </form>

        <div class="link-group">
            <a href="${pageContext.request.contextPath}/view/users/login">로그인</a>
            <a href="${pageContext.request.contextPath}/view/users/find-password">비밀번호 찾기</a>
        </div>
    </div>
</body>
</html>