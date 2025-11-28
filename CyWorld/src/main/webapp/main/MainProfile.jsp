<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld Minihompy</title>

    <!-- CSS 연결 -->
    <link rel="stylesheet" href="./main_css/MainProfile.css">

    <!-- 아이콘(Font Awesome) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body>

<!-- ============================================================
     [공통 영역 - 모든 페이지 동일]
     background / book-cover / header / friend list
     (수정 X, 모든 페이지에서 그대로 사용)
============================================================= -->

<div class="background-skin">
    <div class="book-cover">
        <div class="dot-background">

            <!-- ===== 헤더 (TODAY / TITLE / LINK) ===== -->
            <header class="header-bar">
                <div class="today-count">
                    TODAY <span class="highlight">12</span> | TOTAL 12345
                </div>

                <div class="header-title">사이좋은 사람들 싸이월드~</div>

                <div class="header-link">Welcome to my profile!!</div>
            </header>

            <!-- ===== 전체 레이아웃(Left + Right) ===== -->
            <div class="content-container">


                <!-- ============================================================
                     [공통 영역] 오른쪽 친구 목록 (항상 고정)
                     (수정 거의 없음. 모든 페이지에서 동일)
                ============================================================= -->
                <aside class="userlist-panel">

                    <div class="userlist-area">

                        <div class="userlist-header">
                            <img src="../img/cyWORLD2.png" class="cy-logo">
                            <span class="userlist-title">친구 목록</span>
                        </div>

                        <!-- 친구 리스트 -->
                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User profile photo.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block">
                                <div class="user-name">김진우</div>
                            </div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User profile photo.jpg">
                                <span class="user-status-dot status-mobile"></span>
                            </div>
                            <div class="user-info-block">
                                <div class="user-name">위현우</div>
                            </div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User profile photo.jpg">
                                <span class="user-status-dot status-offline"></span>
                            </div>
                            <div class="user-info-block">
                                <div class="user-name">신동엽</div>
                            </div>
                        </div>

                        <!-- 더미 데이터 -->
                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User profile photo.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">김민서</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User profile photo.jpg">
                                <span class="user-status-dot status-offline"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">나민혁</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User profile photo.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">김가은</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User profile photo.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">김민성</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User profile photo.jpg">
                                <span class="user-status-dot status-mobile"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">홍다은</div></div>
                        </div>

                    </div>

                </aside>



<!-- ============================================================
     [변경되는 영역 시작]
     아래부터 left-panel + right-panel은 페이지마다 바뀜
     → 각 페이지 HTML 아래쪽에 위치 (더 쉽게 수정 가능)
============================================================= -->

<!-- ===========================
     [LEFT] 프로필 패널 (페이지별 수정 가능)
=========================== -->
              <aside class="left-panel">

                        <div class="profile-img-box">
                            <img src="../img/User profile photo.jpg">
                        </div>

                        <hr class="dashed-line">

                        <div class="today-box">TODAY IS ....</div>

                        <textarea class="intro-textarea">
아 그만살고 싶다~
아 그만살고 싶다~
아 그만살고 싶다~
아 그만살고 싶다~
아 그만살고 싶다~

 
                        </textarea>

                        <div class="history-section">
                            <div class="history-title">HISTORY</div>
                            <div class="user-info">
                                김진우 2000.05.01<br>
                                jin0501833@naver.com
                            </div>
                        </div>

                        <div class="left-buttons">
                            <button class="left-btn">쪽지보내기</button>
                            <button class="left-btn">신고하기</button>
                        </div>

                    </aside>



<!-- ===========================
     [RIGHT] 메인 컨텐츠 패널
     (페이지별로 완전히 변경됨)
=========================== -->
<main class="right-panel">
    <div class="right-panel-content">

        <div class="content-header">
            <div class="content-title">
                Mini Room
                <span style="font-size:12px; color:#999;">Express yourself</span>
            </div>
        </div>

        <div class="miniroom-wrapper">
            <img src="../img/mini room background.png" class="miniroom-img">
        </div>

        <div class="post-section">
            <div class="post-title">
                popular post
                <span class="description">인기게시물을 확인해보세요!</span>
            </div>
            <ul>
                <li>윤석열이 계엄을 했다고?? 미친거아님?? 우리 뒤지는거아님?? 어캐되는거임??</li>
            </ul>
        </div>

        <div class="post-section">
            <div class="post-title">
                bulletin board
                <span class="description">게시판을 남겨보세요!</span>
            </div>

            <ul>
                <li>안녕하세요 가입 인사드립니다 잘부탁드립니다~</li>
                <li>현우씨 같이 한강갈래요?ㅎㅎ</li>
                <li>할아버지 농땡이 피우지마세요 뉴옥에서도 다 보입니다 ^^</li>
                <li>아 심심한데 드라이브하러갈사람 광안리임 ㅎㅎ</li>
            </ul>

            <a href="./modifyprofile/Profile_setting.jsp" class="setting-btn">설정</a>
        </div>

    </div>
</main>


<!-- ===========================
     오른쪽 탭 메뉴 (공통)
=========================== -->
                <nav class="side-tabs">
                    <a href="MainProfile.jsp" class="tab-item active">홈</a>
                    <a href="Diary.jsp" class="tab-item">다이어리</a>
                    <a href="Jukebox.jsp" class="tab-item">주크박스</a>
                    <a href="Board.jsp" class="tab-item">게시판</a> 
                </nav>


<!-- ============================================================
     [변경 영역 끝]
============================================================= -->

            </div> <!-- content-container -->
        </div>
    </div>
</div>

</body>
</html>
