<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Administrator Page</title>
<link rel="stylesheet" href="./admin_css/admin_bass.css">
<link rel="stylesheet" href="./admin_css/member.css">
</head>
<body class="member-page">

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
                    <label for="todayMemo">TODAY IS ....</label>
                    <textarea id="todayMemo" placeholder="이 페이지는 관리자계정 페이지 입니다"></textarea>
                </div>

                <p class="admin-text">이 페이지는 관리자계정 페이지 입니다</p>

                <div class="history-box">
                    <h4>HISTORY</h4>
                    <p>김진우 2000.05.01</p>
                    <p>jin0501833@naver.com</p>
                </div>

                <button class="btn-block">단체 쪽지</button>
            </div>

            <!-- 중앙 박스 -->
            <div class="middle-box">
                <div class="middle-top">
                    <div class="today-label">TODAY IS ....</div>
                    <div class="admin-welcome">Welcome to administrator page</div>
                </div>

                <div class="member-header">
                    <h2>Membership management</h2>
                    <div class="search-bar">
                        <input type="text" placeholder="회원 아이디 검색">
                        <button class="search-btn" aria-label="검색"></button>
                    </div>
                </div>

                <div class="status-legend">
                    <span><span class="status-dot active"></span> 활성화</span>
                    <span><span class="status-dot temp-stop"></span> 임시 정지</span>
                    <span><span class="status-dot perm-stop"></span> 영구 정지</span>
                </div>

                <div class="table-wrapper">
                    <table class="member-table">
                        <thead>
                            <tr>
                                <th><input type="checkbox" aria-label="전체선택"></th>
                                <th>user ID</th>
                                <th>상태</th>
                                <th>권한</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>kim203123</td>
                                <td><span class="status-pill active"><span class="status-dot active"></span> 활성화</span></td>
                                <td>administrator</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>jin30012dw</td>
                                <td><span class="status-pill active"><span class="status-dot active"></span> 활성화</span></td>
                                <td>administrator</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>4owelp2cc...</td>
                                <td><span class="status-pill perm-stop"><span class="status-dot perm-stop"></span> 영구 정지</span></td>
                                <td>user</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>indeq12xxb...</td>
                                <td><span class="status-pill temp-stop"><span class="status-dot temp-stop"></span> 임시 정지</span></td>
                                <td>user</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>02gpqedlpq...</td>
                                <td><span class="status-pill active"><span class="status-dot active"></span> 활성화</span></td>
                                <td>user</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>rlawlsdn21...</td>
                                <td><span class="status-pill active"><span class="status-dot active"></span> 활성화</span></td>
                                <td>user</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>tlsehdduq2m...</td>
                                <td><span class="status-pill active"><span class="status-dot active"></span> 활성화</span></td>
                                <td>user</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>dnlqgusdn...</td>
                                <td><span class="status-pill active"><span class="status-dot active"></span> 활성화</span></td>
                                <td>user</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>sper2134</td>
                                <td><span class="status-pill active"><span class="status-dot active"></span> 활성화</span></td>
                                <td>user</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>kgtohpp12222</td>
                                <td><span class="status-pill active"><span class="status-dot active"></span> 활성화</span></td>
                                <td>user</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="action-toolbar">
                    <button>전체 비활성화</button>
                    <button>임시 정지</button>
                    <button>영구 정지</button>
                    <button class="primary">활성화</button>
                    <button>게시판 금지</button>
                    <button>쪽지 금지</button>
                </div>
            </div>

            <!-- 오른쪽 탭 -->
            <div class="right-tabs">
                <a href="main.jsp" class="tab">대시보드</a>
                <a href="member.jsp" class="tab active">회원관리</a>
                <a href="report.jsp" class="tab">신고관리</a>
                <a href="board.jsp" class="tab">게시판관리</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
