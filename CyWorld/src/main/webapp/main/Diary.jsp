<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld Diary</title>

    <link rel="stylesheet" href="./main_css/MainProfile.css">
    <link rel="stylesheet" href="./main_css/diary.css"> 

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
                    <div class="diary-left-panel-content">
                        <div class="date-header">
                            <span class="month-year">DESEMBER / 2025</span>
                        </div>

<div class="mini-calendar-box">
    <div class="month-name">NOVEMBER</div>
    <table class="mini-calendar">
        <thead>
            <tr><th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th></tr>
        </thead>
        <tbody>
            <tr>
                <td class="inactive"></td>
                <td class="inactive"></td>
                <td class="inactive"></td>
                <td class="inactive"></td>
                <td class="inactive"></td>
                <td class="inactive"></td>
                <td>1</td>
            </tr>
            <tr><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td></tr>
            <tr><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td><td>14</td><td>15</td></tr>
            <tr><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td><td>21</td><td>22</td></tr>
            <tr><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td><td>28</td><td>29</td></tr>
            <tr>
                <td>30</td>
                <td class="inactive">1</td>
                <td class="inactive">2</td>
                <td class="inactive">3</td>
                <td class="inactive">4</td>
                <td class="inactive">5</td>
                <td class="inactive">6</td>
            </tr>
        </tbody>
    </table>
</div>

                        <div class="folder-structure">
                            <p>📂 내 다이어리</p>
                            <div class="folder-indent">
                                <p>├─ 📁 JIN</p>
                                <p>├─ 📁 KIM</p>
                                <p>└─ 📁 WOO</p>
                            </div>
                        </div>

                        <div class="diary-button-group">
                            <!-- DiaryWrite.jsp로 이동하는 기능을 추가했습니다. -->
                            <button class="left-btn" onclick="location.href='DiaryWrite.jsp'">작성</button>
                            <button class="left-btn">삭제</button>
                        </div>
                    </div>
                </aside>


                <main class="right-panel">
                    <div class="main-calendar-view">
                        <table class="main-calendar">
                            <thead>
                                <tr>
                                    <th class="sun">SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THUR</th><th>FRI</th><th class="sat">SAT</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="inactive-day"></td> 
                                    <td class="inactive-day"></td>
                                    <td class="inactive-day"></td>
                                    <td class="inactive-day"></td>
                                    <td class="inactive-day"></td>
                                    <td class="inactive-day"></td>
                                    
                                    <td class="sat">
                                        <span class="day-num">1</span>
                                        <div class="icon-group"><span class="icon locked">🔒</span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sun">
                                        <span class="day-num red">2</span>
                                        <div class="icon-group"></div>
                                    </td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                    <td>6</td>
                                    <td>7</td>
                                    <td class="sat">
                                        <span class="day-num">8</span>
                                        <div class="icon-group"><span class="icon locked">🔒</span><span class="icon music">🎵</span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sun">
                                        <span class="day-num red">9</span>
                                        <div class="icon-group"><span class="icon diary">❤️</span></div>
                                    </td>
                                    <td>10</td>
                                    <td>
                                        <span class="day-num">11</span>
                                        <div class="icon-group"><span class="icon music">🎵</span><span class="icon diary">❤️</span></div>
                                    </td>
                                    <td>
                                        <span class="day-num">12</span>
                                        <div class="icon-group"><span class="icon music">🎵</span></div>
                                    </td>
                                    <td>
                                        <span class="day-num">13</span>
                                        <div class="icon-group"><span class="icon locked">🔒</span></div>
                                    </td>
                                    <td>14</td>
                                    <td class="sat">
                                        <span class="day-num">15</span>
                                        <div class="icon-group"><span class="icon locked">🔒</span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sun">
                                        <span class="day-num red">16</span>
                                        <div class="icon-group"><span class="icon diary">❤️</span></div>
                                    </td>
                                    <td>17</td>
                                    <td>
                                        <span class="day-num">18</span>
                                        <div class="icon-group"><span class="icon music">🎵</span></div>
                                    </td>
                                    <td>19</td><td>20</td><td>21</td>
                                    <td class="sat">
                                        <span class="day-num">22</span>
                                        <div class="icon-group"><span class="icon locked">🔒</span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sun"><span class="day-num red">23</span></td>
                                    <td>24</td>
                                    <td>
                                        <span class="day-num">25</span>
                                        <div class="icon-group"><span class="icon music">🎵</span><span class="icon locked">🔒</span></div>
                                    </td>
                                    <td>
                                        <span class="day-num">26</span>
                                        <div class="icon-group"><span class="icon diary">❤️</span><span class="icon locked">🔒</span></div>
                                    </td>
                                    <td>27</td><td>28</td>
                                    <td class="sat">
                                        <span class="day-num">29</span>
                                        <div class="icon-group"><span class="icon music">🎵</span><span class="icon locked">🔒</span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sun">
                                        <span class="day-num red">30</span>
                                        <div class="icon-group"><span class="icon diary">❤️</span></div>
                                    </td>
                                    <td class="inactive-day"></td><td class="inactive-day"></td><td class="inactive-day"></td><td class="inactive-day"></td><td class="inactive-day"></td><td class="inactive-day"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </main>


                <nav class="side-tabs">
                    <a href="MainProfile.jsp" class="tab-item">홈</a>
                    <a href="Diary.jsp" class="tab-item active">다이어리</a>
                    <a href="Jukebox.jsp" class="tab-item">주크박스</a>
                    <a href="Board.jsp" class="tab-item">게시판</a> 
                </nav>

            </div> 
        </div>
    </div>
</div>



</body>
</html>