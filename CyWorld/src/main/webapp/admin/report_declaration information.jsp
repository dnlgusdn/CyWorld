<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Page - Dashboard</title>

    <link rel="stylesheet" href="./admin_css/report_declaration information.css?v=20251202E">
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

                <div class="header-title">Report Management</div>

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
    
    <div class="declaration-panel-container">
        
        <div class="declaration-header-view">
            declaration information
            <div class="status-badge">접수중</div>
        </div>
        
        <div class="declaration-scroll-container">
            
            <div class="declaration-content-container">
                
                <div class="image-compare-area">
                    <div class="image-box">
                        <img src="../img/User.jpg" alt="Reported User Image"> 
                        <div class="user-id">ID : KIM123</div>
                    </div>
                    
                    <div class="arrow-icon">
                        <i class="fas fa-arrow-right"></i>
                    </div>
                    
                    <div class="image-box">
                        <img src="../img/User.jpg" alt="Reporting User Image">
                        <div class="user-id">ID : JIN100</div>
                    </div>
                </div>
                
                <div class="report-details-grid">
                    <div class="report-label-box">신고 카테고리</div>
                    <div class="report-reason-box">쪽지</div>
                    
                    <div class="report-label-box">신고 사유</div>
                    <div class="report-reason-box">폭력적 또는 혐오스러운 콘텐츠</div>
                    
                    <div class="report-label-box large">신고상황 설명</div>
                    <div class="report-description-box">
                  		쪽지로 협박성 쪽지가 왔고 욕하고 때리고 죽인다고 뭐라했어요 
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
        <div class="action-buttons-area">
            <button class="action-btn">상세보기</button>
            <button class="action-btn">관리자 메모</button>
            <button class="action-btn status-change-btn">상태수정</button>
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