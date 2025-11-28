<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld Jukebox</title>

    <link rel="stylesheet" href="./main_css/MainProfile.css">
    <link rel="stylesheet" href="./main_css/jukebox.css"> 

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
                    
                    <div class="left-buttons" style="display: flex; justify-content: space-between;">
                         <button class="left-btn" style="width: 48%;">오늘의 기분</button>
                         <button class="left-btn" style="width: 48%;">기쁨</button>
                    </div>

                </aside>


                <main class="right-panel">
                    <div class="right-panel-content">
                        
                        <div class="content-header">
                            <div class="content-title">
                                추억의 BGM 
                                <span style="font-size:12px; color:#999;">TODAY CHOICE</span>
                            </div>
                        </div>

                        <div class="album-covers-section">
                            
                            <div class="album-item">
                                <img src="./jukebox_img/f1.png" alt="F1 The Album">
                                <div class="album-info">
                                    <div class="album-title">F1 The Album (Cinematic Edition)</div>
                                    <div class="album-artist">Hans Zimmer</div>
                                </div>
                            </div>

                            <div class="album-item">
                                <img src="./jukebox_img/jump.png" alt="뛰어 (JUMP)">
                                <div class="album-info">
                                    <div class="album-title">뛰어(JUMP)</div>
                                    <div class="album-artist">BLACKPINK</div>
                                </div>
                            </div>

                            <div class="album-item">
                                <img src="./jukebox_img/hello.png" alt="Hello Stranger">
                                <div class="album-info">
                                    <div class="album-title">Hello Stranger</div>
                                    <div class="album-artist">권은비</div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="playlist-section">
                            <div class="playlist-header">MyPlayList TODAY CHOICE</div>
                            <table class="playlist-table">
                                <thead>
                                    <tr>
                                        <th style="width: 5%;"></th>
                                        <th style="width: 10%;">번호</th>
                                        <th style="width: 40%;">곡명</th>
                                        <th style="width: 45%;">아티스트</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>1</td>
                                        <td><i class="fa-solid fa-play play-icon"></i> 눈의 꽃</td>
                                        <td>박효신</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2</td>
                                        <td><i class="fa-solid fa-play play-icon"></i> 사랑스러워</td>
                                        <td>김종국</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>3</td>
                                        <td><i class="fa-solid fa-play play-icon"></i> 애인 있어요</td>
                                        <td>이은미</td>
                                    </tr>
                                    </tbody>
                            </table>

                            <div class="jukebox-buttons">
                                <button>듣기</button>
                                <button>내 노래 리스트</button>
                            </div>
                        </div>

                    </div>
                </main>


                <nav class="side-tabs">
                    <a href="MainProfile.jsp" class="tab-item">홈</a>
                    <a href="Diary.jsp" class="tab-item">다이어리</a>
                    <a href="Jukebox.jsp" class="tab-item active">주크박스</a>
                    <a href="Board.jsp" class="tab-item">게시판</a> 
                </nav>


            </div>
        </div>
    </div>
</div>

</body>
</html>