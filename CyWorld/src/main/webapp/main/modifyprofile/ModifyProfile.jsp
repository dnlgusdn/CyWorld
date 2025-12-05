<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld Minihompy</title>

    <!-- CSS 연결 -->
    <link rel="stylesheet" href="../../css/ModifyProfile.css">

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
     → 각 페이지 HTML 아래쪽에 위치 (더 쉽게 수정 가능)
============================================================= -->

<!-- ===========================
     [LEFT] 프로필 패널 (페이지별 수정 가능)
=========================== -->
              <aside class="left-panel">

                        <div class="profile-img-box">
                            <img src="../../img/User profile photo.jpg">
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


                    <!-- =====================================================
                         [RIGHT 패널] — ❤ 이 페이지에서 유일하게 바뀌는 영역
                    ====================================================== -->
                    <main class="right-panel">

                        <div class="right-panel-content">

                            <div class="content-header">
                                <div class="content-title">개인정보 수정</div>
                                <div class="content-subtitle">
                                    회원님의 소중한 정보를 안전하게 관리하세요.
                                </div>
                            </div>

                            <div class="profile-form">

                                <div class="form-row">
                                    <label>아이디</label>
                                    <input type="text" value="cyworld_king" disabled>
                                    <span class="helper-text">(변경불가)</span>
                                </div>

                                <div class="form-row">
                                    <label>비밀번호</label>
                                    <input type="password" placeholder="새 비밀번호를 입력하세요">
                                </div>

                                <div class="form-row">
                                    <label>비밀번호 확인</label>
                                    <input type="password" placeholder="비밀번호 재입력">
                                </div>

                                <div class="dashed-divider"></div>

                                <div class="form-row">
                                    <label>이름</label>
                                    <input type="text" value="김진우">
                                </div>

                                <div class="form-row">
                                    <label>전화번호</label>
                                    <div class="phone-inputs">
                                        <input type="text" maxlength="3" value="010"> -
                                        <input type="text" maxlength="4" value="1234"> -
                                        <input type="text" maxlength="4" value="5678">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <label>이메일</label>
                                    <input type="email" value="jin0501833@naver.com">
                                </div>

                                <div class="action-buttons">
                                    <button class="btn-cancel"><a href="Profile_setting.jsp">취소</a></button>
                                    <button class="btn-save">수정 완료</button>
                                </div>

                            </div>

                        </div>

                    </main>


                    <!-- =====================================================
                         [공통] 오른쪽 TABS
                    ====================================================== -->
                    <nav class="side-tabs">
                        <div class="tab-item active">개인정보 수정</div>
                        <div class="tab-item">다이어리</div>
                        <div class="tab-item">주크박스</div>
                        <div class="tab-item">게시판</div>
                    </nav>

                </div> <!-- content-container END -->

            </div>
        </div>
    </div>

</body>
</html>
