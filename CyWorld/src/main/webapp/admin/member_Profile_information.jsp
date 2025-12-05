<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Page - Dashboard</title>

    <link rel="stylesheet" href="./admin_css/member_Profile_information.css?v=20251202E">
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
    
    <div class="profile-header-block">Profile information</div>
    
    <div class="profile-grid-container">
        
        <div class="profile-area">
            <div class="profile-image-box">
                <img src="../img/User.jpg" alt="Profile Image"> 
            </div>
            
            <div class="profile-info-list">
                <div class="info-item">ID : **jin050183**</div>
                <div class="info-item">PW : **jin050183!!**</div>
                <div class="info-item">Email : **jin0501833@naver.com**</div>
                <div class="info-item">Phone : **010-9038-5829**</div>
                <div class="info-item">Nickname : **JIN**</div>
            </div>
        </div>
        
        <div class="warning-area">
            <div class="warning-box">
                <div class="warning-title">Delete note warning</div>
                <div class="warning-status">
                    <span class="status-bar processed"></span>
                    <span class="status-bar processed"></span>
                    <span class="status-bar processed"></span>
                    <span class="status-bar processing"></span>
                    <span class="status-bar processing"></span>
                    <span class="status-bar processing"></span>
                </div>
            </div>
            
            <div class="warning-box">
                <div class="warning-title">Bulletin Delete Warning</div>
                <div class="warning-status">
                    <span class="status-bar processed"></span>
                    <span class="status-bar processed"></span>
                    <span class="status-bar processed"></span>
                    <span class="status-bar processing"></span>
                    <span class="status-bar processing"></span>
                    <span class="status-bar processing"></span>
                </div>
            </div>
            
            <div class="warning-box">
                <div class="warning-title">Warning</div>
                <div class="warning-status">
                    <span class="status-bar processed"></span>
                    <span class="status-bar processed"></span>
                    <span class="status-bar processed"></span>
                    <span class="status-bar processing"></span>
                    <span class="status-bar processing"></span>
                    <span class="status-bar processing"></span>
                </div>
            </div>
            
            <div class="completion-box status-info">
                <div class="completion-text">Processed (완료)</div>
                <div class="completion-bar"><div class="completion-status-bar processed-bar"></div></div>
            </div>

            <div class="completion-box status-info">
                <div class="completion-text">Processing (검토 중)</div>
                <div class="completion-bar"><div class="completion-status-bar processing-bar-small"></div></div>
            </div>
        </div>
        
        <div class="board-time-area">
            <table class="post-table">
                <thead>
                    <tr>
                        <th style="width: 10%;">번호</th>
                        <th style="width: 45%;">제목</th>
                        <th style="width: 20%;">작성자</th>
                        <th style="width: 15%;">좋아요</th>
                    </tr>
                </thead>
                <tbody>
                    <tr><td>1</td><td>윤석열이 계엄을 한다고??......</td><td>JIN</td><td>391</td></tr>
                    <tr><td>2</td><td>신규가입했어요</td><td>JIN</td><td>22</td></tr>
                    <tr><td>3</td><td>새벽감성 노래 추천 가능??~</td><td>JIN</td><td>33</td></tr>
                    <tr><td>4</td><td>광안리다 드라이브 할 사람</td><td>JIN</td><td>6</td></tr>
                </tbody>
            </table>
            
            <div class="time-of-use-box">
                <div class="date-display">2023-04-11 23:00:22</div>
                <div class="time-title">Time of use</div>
                <div class="time-value-highlight">230h 30m 20s</div> <div class="usage-stats-grid">
                    <div class="stat-item">
                        <div class="stat-value-highlight">391</div>
                        <div class="stat-label">좋아요수</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value-highlight">223</div>
                        <div class="stat-label">댓글수</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value-highlight">293</div>
                        <div class="stat-label">게시판수</div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="bottom-button-area-full">
            <button class="action-btn">쪽지 삭제 요청</button>
            <button class="action-btn">게시판 삭제 요청</button>
            <button class="action-btn">정보 변경 요청</button>
            <button class="action-btn">쪽지 보내기</button>
            <button class="action-btn">게시판 활성화</button>
            <button class="action-btn">쪽지 활성화</button>
        </div>
        
    </div>

</main>


                <nav class="side-tabs">
                    <a href="MainProfile.jsp" class="tab-item active">대시보드</a>
                    <a href="Diary.jsp" class="tab-item">회원관리</a>
                    <a href="Jukebox.jsp" class="tab-item">신고관리</a>
                    <a href="Board.jsp" class="tab-item">게시판관리</a> 
                </nav>


            </div> </div>
    </div>
</div>

</body>
</html>