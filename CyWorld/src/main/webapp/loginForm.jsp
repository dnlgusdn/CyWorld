<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld - 로그인</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/login.css">
</head>
<body>
    <div class="top-border"></div>
    <div class="container">
        <div class="content-panel">
            <div class="logo-container">
                <a href="./index.html">
                    <img src="./img/cyWORLD.png" alt="Cyworld Logo" class="logo-image">
                </a>
            </div>
            
            <form class="login-form">
                <div class="form-row">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-input">
                </div>
                <div class="form-row">
                    <label class="form-label">비밀번호</label>
                    <input type="password" class="form-input">
                </div>
                <div class="form-row button-row">
                    <button type="submit" class="login-button">로그인</button>
                </div>
            </form>
            
            <p class="welcome-message">
                계정이 없으신가요? <a href="./register.html" class="nav-link">회원가입</a>
            </p>
        </div>
    </div>
</body>
</html>