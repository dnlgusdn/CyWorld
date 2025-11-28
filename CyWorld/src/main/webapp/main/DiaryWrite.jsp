<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld Diary - 작성</title>

    <link rel="stylesheet" href="./main_css/MainProfile.css">
    <link rel="stylesheet" href="./main_css/diary.css"> 
    <link rel="stylesheet" href="./main_css/diary_write.css"> 

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
                    </div>
                </aside>


                <aside class="left-panel">
                    <div class="diary-left-panel-content write-left-panel-content">
                        <div class="date-header">
                            <span class="month-year" style="font-size: 18px; font-weight: bold;">다이어리 작성</span>
                        </div>
                        
                        <div style="margin-top: 15px; display: flex; align-items: center;">
                            <i class="fas fa-calendar-alt" style="font-size: 13px; color: #555; margin-right: 5px;"></i> 
                            <label for="diaryDate" style="font-size: 13px; color: #555;">작성일:</label>
                            
                            <input type="date" id="diaryDate" name="diaryDate" 
                                   value="2025-11-25" 
                                   class="diary-date-input"
                                   style="font-weight: bold; font-size: 13px; color: #333; cursor: pointer;">
                        </div>
                        <script>
                            // 초기 날짜 설정
                            document.getElementById('diaryDate').value = '2025-11-25'; 
                        </script>
                        <div class="folder-structure" style="margin-top: 20px;">
                            <label for="folderSelect" style="font-weight: bold; display: block; margin-bottom: 5px;">📂 폴더 선택</label>
                            <select id="folderSelect" style="width: 100%; padding: 7px; border: 1px solid #ccc; border-radius: 3px;">
                                <option value="jin">JIN</option>
                                <option value="kim">KIM</option>
                                <option value="woo">WOO</option>
                            </select>
                        </div>
                        
                        <div style="margin-top: 20px;">
                            <label for="moodSelect" style="font-weight: bold; display: block; margin-bottom: 5px;">😊 오늘 기분</label>
                            <select id="moodSelect" style="width: 100%; padding: 7px; border: 1px solid #ccc; border-radius: 3px;">
                                <option value="happy">😄 기쁨</option>
                                <option value="sad">😢 슬픔</option>
                                <option value="angry">😡 화남</option>
                                <option value="peace">😌 평온</option>
                                <option value="love">😍 사랑</option>
                            </select>
                        </div>

                        <div style="flex-grow: 1;"></div> 

                        <div class="left-buttons" style="padding-top: 15px; border-top: 1px dotted #ddd;">
                            <p style="font-size: 12px; color: #999; text-align: center;">소중한 추억을 기록하세요.</p>
                        </div>
                    </div>
                </aside>


                <main class="right-panel">
                    <form class="diary-write-container">
                        
                        <input type="text" class="diary-title-input" placeholder="제목을 입력하세요">
                        
                        <textarea class="diary-content-textarea" placeholder="오늘의 일기를 솔직하게 작성해보세요. (사진은 하단에서 첨부)"></textarea>
                        
                        <div class="diary-controls">
                            <div class="privacy-setting">
                                <label for="privacy"><i class="fas fa-lock"></i> 공개 설정</label>
                                <select id="privacy">
                                    <option value="public">전체 공개</option>
                                    <option value="friends">일촌 공개</option>
                                    <option value="private">비공개 (🔒)</option>
                                </select>
                                
                                <label for="file" style="margin-left: 20px;"><i class="fas fa-image"></i> 사진 첨부</label>
                                <input type="file" id="file" accept="image/*" style="width: auto;">
                            </div>
                            
                            <div class="button-group">
                                <button type="submit" class="action-button"><i class="fas fa-save"></i> 저장</button>
                                <button type="button" class="action-button cancel-button" onclick="location.href='Diary.jsp'"><i class="fas fa-times"></i> 취소</button>
                            </div>
                        </div>
                    </form>
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