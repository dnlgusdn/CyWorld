<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Administrator Page</title>
<link rel="stylesheet" href="./admin_css/admin_bass.css">
</head>
<body>

<!-- 오른쪽 사이드 메뉴 -->
<div class="side-menu">
    <div class="logo">
        <img src="../img/cyWORLD.png" class="side-logo-img">
    </div>
    <a href="#" class="menu-btn">메인페이지</a>
    <a href="#" class="menu-btn">회원가입 페이지</a>
    <a href="#" class="menu-btn">관리자 페이지</a>
    <a href="#" class="menu-btn">사용자 페이지</a>
</div>

<!-- 중앙 전체 박스 -->
<div class="dashboard-wrapper">
    <div class="dashboard-container">
        <div class="inner-paper">

            <!-- 좌측 정보 박스 -->
            <div class="left-box">
                <div class="today-count">TODAY 12 | TOTAL 12345</div>

                <div class="profile-box">
                    <img src="../img/admin.png" alt="admin">
                </div>

                <div class="today-is">
                    <input type="text" placeholder="TODAY IS ....">
                </div>

                <p class="admin-text">이 페이지는 관리자계정 페이지 입니다</p>

                <div class="history-box">
                    <h4>HISTORY</h4>
                    김진우 2000.05.01<br>
                    jin0501833@naver.com
                </div>

                <div class="button-group">
                    <button>쪽지보내기</button>
                    <button>신고하기</button>
                </div>
            </div>

            <!-- 중앙 박스 -->
            <div class="middle-box">
                <h2>Membership management</h2>

                <div class="search-bar">
                    <input type="text" placeholder="게시글 검색...">
                    <button class="search-btn">🔍</button>
                </div>

                <div class="content-box"></div>
            </div>

            <!-- 오른쪽 탭 -->
            <div class="right-tabs">
                <a href="main.jsp" class="tab">대시보드</a>
                <a href="member.jsp" class="tab">회원관리</a>
                <a href="report.jsp" class="tab active">신고관리</a>
                <a href="board.jsp" class="tab">게시판관리</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>

