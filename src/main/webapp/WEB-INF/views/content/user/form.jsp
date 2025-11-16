<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .signup-page .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .signup-form-container {
            padding: 40px;
            width: 100%;
            max-width: 400px;
        }

        .signup-form-container h1 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--color-text);
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
    </style>
</head>
<body class="signup-page">
<div class="app-container">
    <jsp:include page="../../layout/header.jsp"/>

    <main class="main-content">
        <div class="signup-form-container">
        <h1>회원가입</h1>
        <form action="${pageContext.request.contextPath}/users/new" method="post">
            <div class="form-group">
                <label for="loginId">로그인 ID</label>
                <input type="text" id="loginId" name="loginId" required minlength="5" maxlength="20">
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required minlength="8" maxlength="20">
            </div>
            <div class="form-group">
                <label for="username">사용자 이름</label>
                <input type="text" id="username" name="username" required maxlength="50">
            </div>
            <button type="submit" class="btn btn-primary btn-submit">가입하기</button>
        </form>
        </div>
    </main>
</div>
</body>
</html>