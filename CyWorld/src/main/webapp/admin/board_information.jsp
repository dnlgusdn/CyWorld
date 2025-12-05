<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Page - Bulletin Board Management</title> 

    <link rel="stylesheet" href="./admin_css/board_information.css?v=20251202F"> 
    <link rel="stylesheet" href="../main_css/board.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
   /* ******** [핵심] 스크롤바 및 높이 설정 ******** */
main.right-panel {
   height: 572px !important; 
    overflow-y: auto !important; /* 내용이 넘칠 경우에만 수직 스크롤바 표시 */
    padding: 20px; /* 패널 내부 여백 */
}
/* ****************************************** */


/* [1] 상세 페이지 박스 스타일 */
.post-detail-box {
    border: 1px solid #ddd;
    background-color: #fff;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 5px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

.detail-header {
    border-bottom: 2px solid #55b2d4;
    padding-bottom: 10px;
    margin-bottom: 15px;
}
.detail-title {
    font-size: 20px;
    font-weight: bold;
    color: #333;
}
.detail-info {
    font-size: 12px;
    color: #777;
    margin-top: 5px;
    display: flex;
    justify-content: space-between;
}

.detail-content {
    min-height: 250px; 
    padding: 15px 0;
    line-height: 1.6;
    font-size: 14px;
    white-space: pre-wrap; 
}

.detail-footer {
    border-top: 1px dotted #ccc;
    padding-top: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* [2] 좋아요 버튼 스타일 */
.like-button {
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 14px;
    color: #777;
    user-select: none;
}
.like-button i {
    transition: color 0.2s;
}
.liked i {
    color: #FF6347 !important; /* 토마토 색상 */
}

.detail-actions {
    text-align: right;
}
.detail-btn {
    padding: 5px 15px;
    margin-left: 5px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 3px;
    cursor: pointer;
    font-size: 13px;
}
.detail-btn:hover { background-color: #f5f5f5; }

/* [3] 댓글 섹션 스타일 */
.comment-section {
    padding: 15px 0;
    display: block !important;
}
.comment-header {
    font-weight: bold;
    margin-bottom: 10px;
    border-bottom: 1px solid #eee;
    padding-bottom: 5px;
}
.comment-item {
    border-left: 3px solid #ccc;
    padding-left: 10px;
    margin-bottom: 10px;
    font-size: 13px;
    display: flex;
    flex-direction: column;
}
.comment-text-line {
    display: flex;
    align-items: flex-start;
}
.comment-text-line i {
    margin-right: 5px; 
    margin-top: 2px; 
}
.comment-info {
    font-size: 11px;
    color: #999;
    margin-top: 3px;
    padding-left: 24px; 
}

/* [4] 댓글 입력 영역 스타일 (수정됨) */
.comment-input-area {
    display: block !important;
    margin-top: 10px;
    border-top: 1px dashed #eee;
    padding-top: 10px;
}
.comment-input-area textarea {
    width: 100%; 
    height: 60px;
    resize: none; 
    border: 1px solid #ccc; 
    padding: 5px; 
    font-family: inherit; 
    font-size: 13px;
    box-sizing: border-box; 
    display: block;
}
.comment-btn-container {
    text-align: right;
    margin-top: 5px;
}
</style>
</head>

<body>
<%
    // ******* [수정됨] 이 스크립틀릿 블록이 body 시작 부분에서 변수를 정의해야 오류가 해결됩니다. *******
    String boardIDParam = request.getParameter("boardID");
    int boardID = 1;
    if (boardIDParam != null && !boardIDParam.equals("")) {
        try {
            boardID = Integer.parseInt(boardIDParam);
        } catch (NumberFormatException e) {}
    }
    
    String postTitle = "게시글 번호 " + boardID + "의 제목입니다.";
    String postWriter = (boardID % 2 == 0) ? "현우찡" : "JIN";
    String postDate = "2025.11.28 14:00:00";
    String postContent = 
        "이것은 게시글 번호 " + boardID + "의 상세 내용입니다.\n\n" +
        "여기에 게시글 본문이 출력됩니다. DB 연동이 완료되면 실제 내용이 보일 것입니다.\n";
    int postLikes = 10 + boardID * 5;
%>

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
    <div class="board-content">
        
        <div class="board-header-section" style="margin-bottom: 15px;">
            <div class="board-title" style="font-weight: bold; font-size: 16px; color: #55b2d4;">
                게시글 상세 보기 (#<%= boardID %>)
            </div>
        </div>

        <div class="post-detail-box">
            <div class="detail-header">
                <div class="detail-title"><%= postTitle %></div>
                <div class="detail-info">
                    <span>작성자: <strong><%= postWriter %></strong></span>
                    <span>작성일: <%= postDate %></span>
                </div>
            </div>
            
            <div class="detail-content">
                <p><%= postContent %></p>
            </div>

            <div class="detail-footer">
                <div class="like-button" id="likeButton">
                    <i class="far fa-heart" id="likeIcon" style="font-size: 18px;"></i>
                    <span id="likeCount"><%= postLikes %></span>
                </div>
                <div class="detail-actions">
                    <button type="button" class="detail-btn">수정</button>
                    <button type="button" class="detail-btn">삭제</button>
                    <button type="button" class="detail-btn" onclick="location.href='Board.jsp'">목록으로</button>
                </div>
            </div>
        </div>
        
        <div class="comment-section">
            <div class="comment-header">댓글 (<span id="commentCount">2</span>)</div>
            
            <div id="commentList">
                <div class="comment-item">
                    <div class="comment-text-line">
                        <i class="fas fa-comment-dots"></i> <strong>김민서</strong>: 진짜 계엄 맞아요? ㄷㄷ
                    </div>
                    <div class="comment-info">2025.11.28 14:05</div>
                </div>
                <div class="comment-item">
                    <div class="comment-text-line">
                        <i class="fas fa-comment-dots"></i> <strong>위현우</strong>: 밥은 국밥 먹는 게 정배 아님?
                    </div>
                    <div class="comment-info">2025.11.28 14:10</div>
                </div>
            </div>
            
            <div class="comment-input-area">
                <textarea id="commentInput" placeholder="댓글을 입력하세요..." maxlength="150"></textarea>
                <div class="comment-btn-container">
                    <button class="detail-btn" onclick="addComment()">댓글 등록</button>
                </div>
            </div>
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

<script>
window.onload = function() {
    
    // ------------------------------------
    // [1] 좋아요 기능
    // ------------------------------------
    let isLiked = false; 
    const likeButton = document.getElementById('likeButton');
    const likeIcon = document.getElementById('likeIcon');
    const likeCountSpan = document.getElementById('likeCount');
    
    if(likeButton && likeCountSpan) {
        let currentLikes = parseInt(likeCountSpan.innerText);
    
        likeButton.addEventListener('click', function() {
            if (isLiked) {
                isLiked = false;
                currentLikes--;
                likeButton.classList.remove('liked');
                likeIcon.classList.remove('fas');
                likeIcon.classList.add('far'); // 빈 하트
            } else {
                isLiked = true;
                currentLikes++;
                likeButton.classList.add('liked');
                likeIcon.classList.remove('far');
                likeIcon.classList.add('fas'); // 채워진 하트
            }
            likeCountSpan.innerText = currentLikes;
        });
    }

    // ------------------------------------
    // [2] 댓글 기능 (전역 함수로 만들기 위해 window에 할당)
    // ------------------------------------
    const commentInput = document.getElementById('commentInput');
    const commentList = document.getElementById('commentList');
    const commentCountSpan = document.getElementById('commentCount');
    
    // 숫자 2자리 만들기 함수 (padStart 대체용 - 호환성 문제 해결)
    function padTwo(num) {
        return num < 10 ? '0' + num : num;
    }

    // 전역 함수로 등록
    window.addComment = function() {
        const commentText = commentInput.value.trim();

        if (commentText === "") {
            alert("댓글 내용을 입력해 주세요.");
            return;
        }

        const writer = "신동엽"; 
        const now = new Date();
        // 호환성 문제 없는 날짜 포맷팅
        const timeString = now.getFullYear() + '.' + 
                           padTwo(now.getMonth() + 1) + '.' + 
                           padTwo(now.getDate()) + ' ' + 
                           padTwo(now.getHours()) + ':' + 
                           padTwo(now.getMinutes());

        const newCommentItem = document.createElement('div');
        newCommentItem.className = 'comment-item';
        
        newCommentItem.innerHTML = 
            '<div class="comment-text-line">' +
                '<i class="fas fa-comment-dots"></i> <strong>' + writer + '</strong>: ' + commentText +
            '</div>' +
            '<div class="comment-info">' + timeString + '</div>';

        commentList.prepend(newCommentItem);

        commentInput.value = '';
        
        if(commentCountSpan) {
            let currentCommentCount = parseInt(commentCountSpan.innerText);
            currentCommentCount++;
            commentCountSpan.innerText = currentCommentCount;
        }
    };
};
</script>
</body>
</html>