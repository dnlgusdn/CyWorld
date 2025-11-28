<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld - 회원가입</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/register.css">
</head>
<body>
    <div class="top-border"></div>
    <div class="container">
        <div class="content-panel">
            <div class="logo-container">
                <a href="./index.jsp">
                    <img src="./img/cyWORLD2.png" alt="Cyworld Logo" class="logo-image">
                </a>
            </div>
            
            <form class="register-form">
                <div class="form-row">
                    <label class="form-label">아이디</label>
                    <div class="input-group">
                        <input type="text" class="form-input" id="userId">
                        <button type="button" class="check-button">중복확인</button>
                    </div>
                </div>
                <div class="form-row">
                    <label class="form-label">닉네임</label>
                    <input type="text" class="form-input" id="nickname">
                </div>
                <div class="form-row">
                    <label class="form-label">비밀번호</label>
                    <input type="password" class="form-input" id="password">
                </div>
                <div class="form-row">
                    <label class="form-label">비밀번호 확인</label>
                    <input type="password" class="form-input" id="passwordConfirm">
                </div>
                <div class="form-row">
                    <label class="form-label">이메일</label>
                    <div class="email-group">
                        <input type="text" class="form-input email-input" id="emailId">
                        <span class="email-separator">@</span>
                        <select class="form-select email-select" id="emailDomain">
                            <option value="naver.com" selected>naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="dongyang.ac.kr">dongyang.ac.kr</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <label class="form-label">전화번호</label>
                    <div class="phone-group">
                        <select class="form-select phone-select" id="phonePrefix">
                            <option value="010" selected>010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select>
                        <input type="text" class="form-input phone-input" id="phoneMiddle" maxlength="4">
                        <input type="text" class="form-input phone-input" id="phoneLast" maxlength="4">
                    </div>
                </div>
                <div class="form-row">
                    <label class="form-label">유형</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <input type="radio" name="userType" value="general" checked>
                            <span>일반</span>
                        </label>
                        <label class="radio-label">
                            <input type="radio" name="userType" value="admin">
                            <span>관리자</span>
                        </label>
                    </div>
                </div>
                <div class="form-row button-row">
                    <button type="submit" class="register-button">회원가입</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 아이디 중복확인 모달 -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <a href="./index.html">
                <img src="./img/cyWORLD2.png" alt="Cyworld Logo" class="logo">
            </a>
            <h2>아이디 중복 체크</h2>
            <input type="text" id="checkUserId" placeholder="아이디를 입력하세요">
            <button type="button" class="check-btn">확인</button>
        </div>
    </div>

    <!-- 관리자 승인 코드 모달 -->
    <div id="adminModal" class="admin-modal">
        <div class="admin-modal-content">
            <span class="admin-close">&times;</span>
            <a href="./index.html">
                <img src="./img/cyWORLD2.png" alt="Cyworld Logo" class="admin-logo">
            </a>
            <h2>관리자 승인 코드 입력</h2>
            <input type="text" id="adminCode" placeholder="승인 코드를 입력하세요">
            <button type="button" class="admin-check-btn">확인</button>
        </div>
    </div>

    <script src="./js/logincheck.js"></script>
    <script src="./js/admin.js"></script>
</body>
</html>