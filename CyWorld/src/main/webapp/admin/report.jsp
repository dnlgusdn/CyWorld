<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Page - Report Management</title> 

    <link rel="stylesheet" href="./admin_css/report.css?v=20251202F"> 
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

                <div class="header-title">Report management</div> 

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
                    <div class="report-management-content">
                        
                        <div class="search-box-wrap">
                            <input type="text" class="search-input" placeholder="Search...">
                            <button class="search-btn"><i class="fas fa-search"></i></button>
                        </div>

                        <div class="report-flow-container">
                            <div class="flow-box received">
                                <span>접수 중</span>
                                <span class="count">10건</span>
                            </div>
                            <i class="fas fa-arrow-right flow-arrow"></i>
                            <div class="flow-box review">
                                <span>검토 중</span>
                                <span class="count">2건</span>
                            </div>
                            <i class="fas fa-arrow-right flow-arrow"></i>
                            <div class="flow-box completed">
                                <span>처리 완료</span>
                                <span class="count">12건</span>
                            </div>
                        </div>


                        <div class="table-wrap report-table-wrap">
                            <table class="report-table">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkAll"></th>
                                        <th>신고번호</th>
                                        <th>신고자</th>
                                        <th>피신고자</th>
                                        <th>유형</th>
                                        <th>신고 사유</th>
                                        <th>상태</th>
                                        <th></th> </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>1</td>
                                        <td>kim12</td>
                                        <td>jin0401</td>
                                        <td>쪽지</td>
                                        <td>성적인 콘텐츠</td>
                                        <td class="status-col process-completed">처리 완료</td>
                                        <td><button class="action-btn">보기</button></td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2</td>
                                        <td>jin203</td>
                                        <td>JIN22</td>
                                        <td>쪽지</td>
                                        <td>폭력적 또는 혐오스러운 콘텐츠</td>
                                        <td class="status-col process-received">접수 중</td>
                                        <td><button class="action-btn">보기</button></td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>3</td>
                                        <td>hihi22</td>
                                        <td>KIM22</td>
                                        <td>게시판</td>
                                        <td>증오 또는 악의적인 콘텐츠</td>
                                        <td class="status-col process-received">접수 중</td>
                                        <td><button class="action-btn">보기</button></td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>4</td>
                                        <td>wiplem</td>
                                        <td>USER1</td>
                                        <td>게시판</td>
                                        <td>명예훼손</td>
                                        <td class="status-col process-received">접수 중</td>
                                        <td><button class="action-btn">보기</button></td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>5</td>
                                        <td>qwer2</td>
                                        <td>HELLO</td>
                                        <td>게시판</td>
                                        <td>명예훼손</td>
                                        <td class="status-col process-received">접수 중</td>
                                        <td><button class="action-btn">보기</button></td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>6</td>
                                        <td>admi11</td>
                                        <td>l2lw22</td>
                                        <td>프로필</td>
                                        <td>명예훼손</td>
                                        <td class="status-col process-review">검토 중</td>
                                        <td><button class="action-btn">보기</button></td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>7</td>
                                        <td>set12e</td>
                                        <td>e231qw</td>
                                        <td>프로필</td>
                                        <td>명예훼손</td>
                                        <td class="status-col process-review">검토 중</td>
                                        <td><button class="action-btn">보기</button></td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>8</td>
                                        <td>zmi2zx</td>
                                        <td>efweg2</td>
                                        <td>프로필</td>
                                        <td>명예훼손</td>
                                        <td class="status-col process-review">검토 중</td>
                                        <td><button class="action-btn">보기</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="control-buttons">
                            <button class="control-btn review-btn">검토 중으로 변경</button>
                            <button class="control-btn complete-btn">처리 완료로 변경</button>
                            <button class="control-btn reject-btn">신고 반려</button>
                        </div>
                    </div>
                </main>


                <nav class="side-tabs">
                    <a href="main.jsp" class="tab-item">대시보드</a>
                    <a href="member.jsp" class="tab-item">회원관리</a>
                    <a href="report.jsp" class="tab-item active">신고관리</a> 
                    <a href="board.jsp" class="tab-item">게시판관리</a> 
                </nav>


            </div> </div>
    </div>
</div>

</body>
</html>