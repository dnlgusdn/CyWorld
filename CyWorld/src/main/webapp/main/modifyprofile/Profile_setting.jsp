<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 수정</title>
    
    <!-- CSS 연결 -->
    <link rel="stylesheet" href="../main_css/MainProfile.css">
    <link rel="stylesheet" href="../../css/Profile_setting.css">
    
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
                            <img src="../../img/cyWORLD2.png" class="cy-logo">
                            <span class="userlist-title">친구 목록</span>
                        </div>

                        <!-- 친구 리스트 -->
                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../../img/User profile photo.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block">
                                <div class="user-name">김진우</div>
                            </div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../../img/User profile photo.jpg">
                                <span class="user-status-dot status-mobile"></span>
                            </div>
                            <div class="user-info-block">
                                <div class="user-name">위현우</div>
                            </div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../../img/User profile photo.jpg">
                                <span class="user-status-dot status-offline"></span>
                            </div>
                            <div class="user-info-block">
                                <div class="user-name">신동엽</div>
                            </div>
                        </div>

                        <!-- 더미 데이터 -->
                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../../img/User profile photo.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">김민서</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../../img/User profile photo.jpg">
                                <span class="user-status-dot status-offline"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">나민혁</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../../img/User profile photo.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">김가은</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../../img/User profile photo.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">김민성</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../../img/User profile photo.jpg">
                                <span class="user-status-dot status-mobile"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">홍다은</div></div>
                        </div>

                    </div>

                </aside>



<!-- ============================================================
     [변경되는 영역 시작]
     아래부터 left-panel + right-panel은 페이지마다 바뀜
============================================================= -->

<!-- ===========================
     [LEFT] 프로필 설정 패널
=========================== -->
<aside class="left-panel profile-setting-left">
    
    <!-- 설정 아이콘 -->
    <a href="./ModifyProfile.jsp" class="setting-icon">
        <i class="fas fa-cog"></i>
    </a>
    
    <!-- TODAY / TOTAL -->
    <div class="today-count-left">
        TODAY 12 | TOTAL 12345
    </div>
    
    <!-- 프로필 이미지 박스 -->
    <div class="profile-img-box-setting" id="profileImageBox">
        <img id="profileImage" src="../../img/background_img.png" alt="프로필 이미지">
        <input type="file" id="profileImageInput" accept="image/*" style="display: none;">
    </div>
    
    <!-- 이미지 변경 버튼 -->
    <button class="change-img-btn">이미지 변경</button>
    
    <!-- TODAY IS 섹션 -->
    <div class="today-is-section">
        <div class="section-header">
            <span class="section-title">TODAY IS ....</span>
            <i class="fas fa-edit edit-icon"></i>
        </div>
        <textarea class="today-textarea" readonly>아 그만살고 싶다~
아 그만살고 싶다~
아 그만살고 싶다~
아 그만살고 싶다~
아 그만살고 싶다~</textarea>
        <i class="fas fa-edit edit-icon-right"></i>
    </div>
    
    <!-- HISTORY 섹션 -->
    <div class="history-section-setting">
        <div class="section-header">
            <span class="section-title">HISTORY</span>
            <i class="fas fa-edit edit-icon"></i>
        </div>
        <div class="history-content">
            김진우 2000.05.01<br>
            jin0501833@naver.com
        </div>
        <i class="fas fa-edit edit-icon-right"></i>
    </div>
    
    <!-- 오늘의 기분 탭 -->
    <div class="mood-tabs">
        <div class="mood-tab">쪽지보내기</div>
        <div class="mood-tab active">신고하기</div>
    </div>
    
</aside>



<!-- ===========================
     [RIGHT] 메인 컨텐츠 패널
=========================== -->
<main class="right-panel profile-setting-right">
    <div class="right-panel-content">
        
        <!-- Mini Room Express yourself -->
        <div class="miniroom-section">
            <div class="section-header">
                <div class="section-title">Mini Room Express yourself</div>
                <i class="fas fa-edit edit-icon"></i>
            </div>
            <div class="miniroom-box" id="miniroomBox">
                <img id="miniroomImage" src="../../img/background_img.png" alt="미니룸 이미지">
                <input type="file" id="miniroomImageInput" accept="image/*" style="display: none;">
            </div>
        </div>
        
        <!-- popular post -->
        <div class="post-section">
            <div class="post-title">
                popular post
                <span class="description">인기게시물을 확인해보세요!</span>
            </div>
            <ul>
                <li>윤석열이 계엄을 했다고?? 미친거아님?? 뭔데??? 우리 뒤지는거임?</li>
            </ul>
        </div>
        
        <!-- bulletin board -->
        <div class="post-section">
            <div class="post-title">
                bulletin board
                <span class="description">게시판을 남겨보세요!</span>
            </div>
            <ul>
                <li>안녕하세요 가입 인사드립니다 잘부탁드립니다~</li>
                <li>현우님 같이 한강가실래요?ㅎㅎ</li>
                <li>할아버지 그만 농땅피우죠 뉴옥에서도 보입니다 ^^</li>
                <li>아 심심한데 할거없나?~~~~</li>
            </ul>
        </div>
        
        <!-- 취소/완료 버튼 -->
        <div class="action-buttons">
            <button class="cancel-btn"><a href="../MainProfile.jsp">취소</a></button>
            <button class="complete-btn">완료</button>
        </div>
        
    </div>
</main>



<!-- ============================================================
     [변경 영역 끝]
============================================================= -->

            </div> <!-- content-container -->
        </div>
    </div>
</div>

<!-- JavaScript 연결 -->
<script src="./Profile_setting.js"></script>

</body>
</html>
