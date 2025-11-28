<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld 게시판</title>

    <link rel="stylesheet" href="./main_css/MainProfile.css">
    <link rel="stylesheet" href="./main_css/board.css"> 

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

                <div class="header-title">사이좋은 사람들 싸이월드~</div>

                <div class="header-link">Welcome to my profile!!</div>
            </header>

            <div class="content-container">

                <!-- 친구 목록 패널 (좌측 사이드바) -->
                <aside class="userlist-panel">
                    <div class="userlist-area">

                        <div class="userlist-header">
                            <img src="../img/cyWORLD2.png" class="cy-logo">
                            <span class="userlist-title">친구 목록</span>
                        </div>

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


                <!-- 좌측 패널 (게시판 페이지용 미니룸/히스토리) -->
                <aside class="left-panel">
                    <div class="profile-img-box">
                         <!-- 미니룸 이미지 예시 (image_29c21e.png 참고) -->
                        <img src="../img/User profile photo.jpg" style="width:100%; height:auto; border: 1px solid #ccc; border-radius: 5px;">
                    </div>
                    
                    <hr class="dashed-line" style="margin: 10px 0;">

                    <div class="history-section">
                        <div class="history-title" style="font-weight: bold; margin-bottom: 5px;">Mini Room</div>
                        <p style="font-size:11px; color:#999; margin-bottom: 10px;">Express yourself</p>
                        
                        <!-- 인기 게시물 링크 및 설명 -->
                        <div style="margin-bottom: 10px;">
                            <a href="#" style="font-size:12px; color:#369; text-decoration: underline;">popular post</a>
                            <span style="font-size:11px; color:#555;"> 인기 게시물을 확인해보세요!</span>
                        </div>
                        
                        <!-- 예시 목록 -->
                        <ul style="padding-left:15px; font-size:12px; color:#666; margin-top:5px; line-height:1.4;">
                            <li style="white-space: normal;">윤석열이 계엄을 했다고??...</li>
                            <li style="white-space: normal;">현우님 같이 한강가실래요?</li>
                            <li style="white-space: normal;">할아버지 그린노랭 피우셨...</li>
                        </ul>
                    </div>

                    <div class="left-buttons" style="display: flex; justify-content: center; margin-top: auto; padding-top: 15px;">
                         <button class="left-btn" style="width: 80%;">설정</button>
                    </div>

                </aside>



                <!-- 게시판 메인 목록 (우측 패널) -->
                <main class="right-panel">
                    <div class="board-content">
                        
                        <div class="board-header-section">
                            <div class="board-title" style="font-weight: bold;">bulletin board <span style="font-size:12px; color:#999; font-weight: normal;"> 게시판을 남겨보세요!</span></div>
                            <div class="search-box">
                                <input type="text" placeholder="제목/작성자 검색">
                                <button><i class="fas fa-search"></i></button>
                            </div>
                        </div>

                        <table class="board-table">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>좋아요</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 게시글 목록 예시 -->
                                <tr>
                                    <td>1</td>
                                    <td>윤석열이 계엄을 했다고??.... <i class="fas fa-fire like-icon" style="color:#FF6347;"></i><i class="fas fa-fire like-icon" style="color:#FF6347;"></i><i class="fas fa-fire like-icon" style="color:#FF6347;"></i></td>
                                    <td>JIN</td>
                                    <td>2025.11.12</td>
                                    <td>391</td>
                                </tr>
                                <tr><td>2</td><td>신규가입했어요</td><td>현우찡</td><td>2025.11.13</td><td>22</td></tr>
                                <tr><td>3</td><td>새벽감성 노래 추천 기능??~</td><td>할아버지</td><td>2025.11.14</td><td>33</td></tr>
                                <tr><td>4</td><td>광안리다 드라이브 할 사람</td><td>앙기모찌</td><td>2025.11.14</td><td>6</td></tr>
                                <tr><td>5</td><td>봄꽃놀이 사람 너무 많음..</td><td>안녕해요</td><td>2025.11.14</td><td>11</td></tr>
                                <tr><td>6</td><td>술먹다 끊었다 지갑잃어버림</td><td>닉넴뭔데</td><td>2025.11.15</td><td>23</td></tr>
                                <tr><td>7</td><td>오늘도 알바해야지</td><td>헤헤웅</td><td>2025.11.15</td><td>44</td></tr>
                                <tr><td>8</td><td>님들 게시물 올려주세요 부탁좀..</td><td>노래하는</td><td>2025.11.15</td><td>81</td></tr>
                                <tr><td>9</td><td>점심메뉴 추천좀</td><td>널봐버릴거다</td><td>2025.11.15</td><td>29</td></tr>
                            </tbody>
                        </table>

                        <div class="board-footer">
                            <button class="write-button">작성</button>
                        </div>

                    </div>
                </main>


                <!-- 우측 탭 메뉴 -->
                <nav class="side-tabs">
                    <a href="MainProfile.jsp" class="tab-item">홈</a>
                    <a href="Diary.jsp" class="tab-item">다이어리</a>
                    <a href="Jukebox.jsp" class="tab-item">주크박스</a>
                    <a href="Board.jsp" class="tab-item active">게시판</a> 
                </nav>

            </div> 
        </div>
    </div>
</div>

</body>
</html>