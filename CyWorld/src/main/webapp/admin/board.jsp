<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Page - Bulletin Board Management</title> 

    <link rel="stylesheet" href="./admin_css/board.css?v=20251202F"> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
</head>

<body>

<div class="background-skin">
    <div class="book-cover">
        <div class="dot-background">

            <header class="header-bar">
                <div class="today-count">
                    TODAY <span class="highlight">12</span> | TOTAL 12345
                </div>

                <div class="header-title">Bulletin Board Management</div>

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
                    <div class="board-management-content">

                        <div class="search-box-wrap centered-search">
                            <input type="text" class="search-input" placeholder="검색...">
                            <button class="search-btn"><i class="fas fa-search"></i></button>
                        </div>

                        <div class="table-wrap board-table-wrap">
                            <table class="board-table">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>좋아요</th>
                                        <th></th> 
                                        <th></th> 
                                        <th></th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>윤석이 게임을 했다고?... 드라이브 썰 풀어봐용!</td>
                                        <td>현우짱</td>
                                        <td>2025.11.12</td>
                                        <td>391</td>
                                        <td><button class="action-btn warn-btn">경고</button></td>
                                        <td><button class="action-btn delete-btn">삭제</button></td>
                                        <td><button class="action-btn delete-req-btn">삭제 요청</button></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>신기했어요! 이번에 새로 가입했는데 미니홈피 꾸미는 거 재미있네요.</td>
                                        <td>현우짱</td>
                                        <td>2025.11.13</td>
                                        <td>22</td>
                                        <td><button class="action-btn warn-btn">경고</button></td>
                                        <td><button class="action-btn delete-btn">삭제</button></td>
                                        <td><button class="action-btn delete-req-btn">삭제 요청</button></td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>새벽감성 노래 추천 가능~? (잔잔한 팝송 위주로 부탁해요)</td>
                                        <td>할아버지</td>
                                        <td>2025.11.14</td>
                                        <td>334</td>
                                        <td><button class="action-btn warn-btn">경고</button></td>
                                        <td><button class="action-btn delete-btn">삭제</button></td>
                                        <td><button class="action-btn delete-req-btn">삭제 요청</button></td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>광안리다 드라이브 할 사람, 팝송 들으면서 드라이브하기 좋아요!</td>
                                        <td>앙기모찌</td>
                                        <td>2025.11.14</td>
                                        <td>1234</td>
                                        <td><button class="action-btn warn-btn">경고</button></td>
                                        <td><button class="action-btn delete-btn">삭제</button></td>
                                        <td><button class="action-btn delete-req-btn">삭제 요청</button></td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>불꽃놀이 사람 너무 많음.. 그래도 예뻐서 좋았어요ㅎㅎ</td>
                                        <td>안녕하세요</td>
                                        <td>2025.11.14</td>
                                        <td>653</td>
                                        <td><button class="action-btn warn-btn">경고</button></td>
                                        <td><button class="action-btn delete-btn">삭제</button></td>
                                        <td><button class="action-btn delete-req-btn">삭제 요청</button></td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>오늘의 일기: 날씨가 너무 좋았어!</td>
                                        <td>user123</td>
                                        <td>2025.11.15</td>
                                        <td>15</td>
                                        <td><button class="action-btn warn-btn">경고</button></td>
                                        <td><button class="action-btn delete-btn">삭제</button></td>
                                        <td><button class="action-btn delete-req-btn">삭제 요청</button></td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>추억의 사진첩 정리하다가 발견한 짤방ㅎㅎㅎ</td>
                                        <td>minihome</td>
                                        <td>2025.11.15</td>
                                        <td>88</td>
                                        <td><button class="action-btn warn-btn">경고</button></td>
                                        <td><button class="action-btn delete-btn">삭제</button></td>
                                        <td><button class="action-btn delete-req-btn">삭제 요청</button></td>
                                    </tr>
                                    <tr>
                                        <td>8</td>
                                        <td>다들 폰트 뭐 쓰시나요?</td>
                                        <td>fontlover</td>
                                        <td>2025.11.16</td>
                                        <td>420</td>
                                        <td><button class="action-btn warn-btn">경고</button></td>
                                        <td><button class="action-btn delete-btn">삭제</button></td>
                                        <td><button class="action-btn delete-req-btn">삭제 요청</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="control-buttons">
                            <button class="control-btn view-all-btn">보기</button>
                        </div>
                    </div> 
                </main>


                <nav class="side-tabs">
                    <a href="main.jsp" class="tab-item">대시보드</a>
                    <a href="member.jsp" class="tab-item">회원관리</a>
                    <a href="report.jsp" class="tab-item">신고관리</a>
                    <a href="Board.jsp" class="tab-item active">게시판관리</a> 
                </nav>


            </div> </div>
    </div>
</div>

</body>
</html>