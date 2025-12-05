<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Page - Member Management</title> 

    <link rel="stylesheet" href="./admin_css/member.css?v=20251202F"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
</head>

<body>

<div class="background-skin">
    <div class="book-cover">
        <div class="dot-background">

            <header class="header-bar">
                <div class="today-count">
                    TODAY <span class="highlight">12</span> | TOTAL 12345
                </div>

                <div class="header-title">Membership management</div> 

                <div class="header-link">Welcome to administrator page</div>
            </header>

            <div class="content-container">


                <aside class="admin-quick-links">
                    <div class="quick-link-header">
                        <img src="../img/cyWORLD2.png" class="quick-logo" alt="Cyworld Logo">
                    </div>
                    <div class="quick-link-area">
                       <a href="main.jsp" class="quick-btn active">대시보드</a>
                        <a href="../index.jsp" class="quick-btn">메인 페이지</a>
                        <a href="../register.jsp" class="quick-btn">회원가입 페이지</a>
                        <a href="../loginForm.jsp" class="quick-btn">로그인</a>
                        <a href="../main/MainProfile.jsp" class="quick-btn user-page-link">사용자 페이지</a>
                    </div>
                </aside>


                <aside class="left-panel">
                        <div class="profile-img-box">
                            <img src="../img/admin.png" alt="Admin Profile"> 
                        </div>

                        <hr class="dashed-line">

                        <div class="today-box">TODAY IS ....</div>

                        <textarea class="intro-textarea" readonly>
이 페이지는 관리자 계정입니다.
                        </textarea>

                        <div class="history-section">
                            <div class="history-title">HISTORY</div>
                            <div class="user-info">
                                김진우 2000.05.01<br>
                                jin0501833@naver.com
                            </div>
                        </div>

                        <div class="left-buttons">
                            <button class="left-btn">단체쪽지</button>
                        </div>

                </aside>


                <main class="right-panel">
                    <div class="member-management-content">
                        
                        <div class="search-box-wrap">
                             <input type="text" class="search-input" placeholder="Search...">
                             <button class="search-btn"><i class="fas fa-search"></i></button>
                        </div>

                        <div class="table-wrap">
                            <table class="member-table">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkAll"></th>
                                        <th>user ID</th>
                                        <th>상태</th>
                                        <th>권한</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>kim203123</td>
                                        <td class="status-col"><span class="status-dot active"></span> 활성화</td>
                                        <td>administrator</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>jin30012dw</td>
                                        <td class="status-col"><span class="status-dot active"></span> 활성화</td>
                                        <td>administrator</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>40wlelp2cc</td>
                                        <td class="status-col"><span class="status-dot banned"></span> 영구 정지</td>
                                        <td>user</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>indelq12xxb</td>
                                        <td class="status-col"><span class="status-dot suspended"></span> 일시 정지</td>
                                        <td>user</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>02gopedlpq</td>
                                        <td class="status-col"><span class="status-dot active"></span> 활성화</td>
                                        <td>user</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>rlawlsdn21</td>
                                        <td class="status-col"><span class="status-dot active"></span> 활성화</td>
                                        <td>user</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>tlsehddduq2m</td>
                                        <td class="status-col"><span class="status-dot active"></span> 활성화</td>
                                        <td>user</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>dnlgsdn</td>
                                        <td class="status-col"><span class="status-dot active"></span> 활성화</td>
                                        <td>user</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>sper2134</td>
                                        <td class="status-col"><span class="status-dot active"></span> 활성화</td>
                                        <td>user</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>kgtohpp1222</td>
                                        <td class="status-col"><span class="status-dot active"></span> 활성화</td>
                                        <td>user</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="control-buttons">
                            <button class="control-btn">전체 비활성화</button>
                            <button class="control-btn">일시 정지</button>
                            <button class="control-btn permanent">영구 정지</button>
                            <button class="control-btn activate">활성화</button>
                            <button class="control-btn">게시판 금지</button>
                            <button class="control-btn">쪽지 금지</button>
                        </div>
                    </div>
                </main>


                <nav class="side-tabs">
                    <a href="main.jsp" class="tab-item">대시보드</a>
                    <a href="member.jsp" class="tab-item active">회원관리</a> <a href="report.jsp" class="tab-item">신고관리</a>
                    <a href="board.jsp" class="tab-item">게시판관리</a> 
                </nav>


            </div> </div>
    </div>
</div>

</body>
</html>