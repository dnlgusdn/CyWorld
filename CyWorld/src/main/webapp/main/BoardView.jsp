<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld 게시글 보기</title>

    <link rel="stylesheet" href="./main_css/MainProfile.css">
    <link rel="stylesheet" href="./main_css/board.css"> 
    <link rel="stylesheet" href="./main_css/JukeboxPlayer.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        /* [추가] Jukebox 버튼 활성화 스타일 */
        .active-btn {
            color: #ff5050; 
        }
        /* [추가] 로딩 메시지 스타일 */
        #loadingMessage {
            color: gray;
            font-size: 11px;
            text-align: center;
            margin-top: 10px;
        }

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
            color: #FF6347 !important;
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
        .detail-btn:hover { background-color: #f5f5f5;
        }
        
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
                <div class="today-count">TODAY <span class="highlight">12</span> | TOTAL 12345</div>
                <div class="header-title">사이좋은 사람들 싸이월드~</div>
                <div class="header-link">Welcome to my profile!!</div>
            </header>
            
            <div class="music-player-container" id="globalJukeboxPlayer">
                <div class="progress-area">
                    <span id="currentTime">0:00</span>
                    <input type="range" class="progress-bar" id="progressBar" value="0" min="0" max="100">
                    <span id="durationTime">-0:00</span>
                </div>
                <div class="controls">
                    <button class="btn-control" id="repeatBtn" title="반복 재생"><i class="fas fa-retweet"></i></button>
                    <button class="btn-control" title="곡 추가"><i class="fas fa-plus"></i></button>
                    <button class="btn-control" id="prevBtn"><i class="fas fa-backward"></i></button>
                    <button class="btn-control btn-play" id="playBtn"><i class="fas fa-play"></i></button>
                    <button class="btn-control" id="nextBtn"><i class="fas fa-forward"></i></button>
                    <button class="btn-control" title="메뉴"><i class="fas fa-ellipsis-h"></i></button>
                    <button class="btn-control" id="shuffleBtn" title="셔플"><i class="fas fa-random"></i></button>
                </div>
                <div class="song-info">
                    <i class="fas fa-music"></i> <span id="songTitle">재생할 곡을 선택해주세요</span>
                </div>
                <div id="loadingMessage"></div> 
            </div>
            
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
                            <div class="user-info-block"><div class="user-name">김진우</div></div>
                        </div>
                    </div>
                </aside>

                <aside class="left-panel">
                    <div class="profile-img-box">
                        <img src="../img/User profile photo.jpg" style="width:100%; height:auto; border: 1px solid #ccc; border-radius: 5px;">
                    </div>
                    <hr class="dashed-line" style="margin: 10px 0;">
                    <div class="history-section">
                        <div class="history-title" style="font-weight: bold; margin-bottom: 5px;">Mini Room</div>
                        <p style="font-size:11px; color:#999; margin-bottom: 10px;">Express yourself</p>
                        <div style="margin-bottom: 10px;">
                            <a href="#" style="font-size:12px; color:#369; text-decoration: underline;">popular post</a>
                            <span style="font-size:11px; color:#555;"> 인기 게시물을 확인해보세요!</span>
                        </div>
                    </div>
                    <div class="left-buttons" style="display: flex; justify-content: center; margin-top: auto; padding-top: 15px;">
                         <button class="left-btn" style="width: 80%;">설정</button>
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
                    <a href="MainProfile.jsp" class="tab-item">홈</a>
                    <a href="Diary.jsp" class="tab-item">다이어리</a>
                    <a href="Jukebox.jsp" class="tab-item">주크박스</a>
                    <a href="Board.jsp" class="tab-item active">게시판</a> 
                </nav>

            </div> 
        </div>
    </div>
</div>

<script>
    // 1. 음악 파일 목록 설정 (경로: "./music/")
    const playlist = [
        // ❗ 파일명에 한글이나 공백이 있어도 JavaScript에서 인코딩 처리를 하므로 상대 경로를 그대로 사용합니다.
        { title: "izi - 응급실", file: "./music/izi - 응급실.mp3" },
        { title: "MC 스나이퍼 - Bk Love", file: "./music/MC 스나이퍼 - Bk Love.mp3" },
        { title: "김동률 - 다시 사랑한다 말할까", file: "./music/김동률 - 다시 사랑한다 말할까.mp3" },
        { title: "나얼 - 귀로(歸路)", file: "./music/나얼 - 귀로(歸路).mp3" },
        { title: "넬 - 기억을 걷는 시간", file: "./music/넬 - 기억을 걷는 시간.mp3" },
        { title: "리쌍(leessang) - 리쌍부르쓰 (feat. 정인)", file: "./music/리쌍(leessang) - 리쌍부르쓰 (feat. 정인).mp3" },
        { title: "리쌍(LeeSSang) - 발레리노(Ballerino) (Feat. ALI)", file: "./music/리쌍(LeeSSang) - 발레리노(Ballerino) (Feat. ALI).mp3" },
        { title: "리쌍 - 헤어지지 못하는 여자, 떠나가지 못하는 남자", file: "./music/리쌍 - 헤어지지 못하는 여자, 떠나가지 못하는 남자.mp3" },
        { title: "박명호 - 사진 (하늘만 바라봐) (feat. 류주화, Sam Lee)", file: "./music/박명호 - 사진 (하늘만 바라봐) (feat. 류주화, Sam Lee).mp3" },
        { title: "버즈 Buzz - 남자를 몰라", file: "./music/버즈 Buzz-남자를 몰라.mp3" },
        { title: "브라운아이즈-벌써일년", file: "./music/브라운아이즈-벌써일년.mp3" },
        { title: "수취인불명(Address Unknown) _ 프리스타일 freestyle", file: "./music/수취인불명(Address Unknown) _ 프리스타일 freestyle.mp3" },
        { title: "씨야-사랑의 인사", file: "./music/씨야-사랑의 인사.mp3" },
        { title: "에픽하이(Epik High) 우산 (Feat. 윤하)", file: "./music/에픽하이(Epik High) 우산 (Feat. 윤하).mp3" },
        { title: "윤미래 - Memories", file: "./music/윤미래 - Memories.mp3" },
        { title: "임정희 - 눈물이 안났어", file: "./music/임정희 - 눈물이 안났어.mp3" },
        { title: "키네틱플로우 - 몽환의숲(Feat. 이루마)", file: "./music/키네틱플로우 - 몽환의숲(Feat. 이루마).mp3" },
        { title: "타우 - 우리들의 행복한 시간", file: "./music/타우 - 우리들의 행복한 시간.mp3" },
        { title: "프리스타일 - Y", file: "./music/프리스타일 - Y.mp3" }
    ];

    let currentTrackIndex = 0;
    let isPlaying = false;
    let isShuffle = false;
    let isRepeat = false;
    
    // 오디오 객체는 window 객체에 저장하여 페이지 이동 시 상태 유지
    window.audio = window.audio || new Audio();
    const audio = window.audio; 
    
    // DOM 요소 가져오기
    const playBtn = document.getElementById('playBtn');
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');
    const shuffleBtn = document.getElementById('shuffleBtn');
    const repeatBtn = document.getElementById('repeatBtn');
    const progressBar = document.getElementById('progressBar');
    const currentTimeEl = document.getElementById('currentTime');
    const durationTimeEl = document.getElementById('durationTime');
    const songTitleEl = document.getElementById('songTitle');
    const loadingMessageEl = document.getElementById('loadingMessage'); 

    
    /**
     * 🎵 MP3 파일을 직접 로드하여 audio.src에 할당하는 함수
     * @param {number} index - 재생할 playlist 인덱스
     * @param {number} seekTime - 재생을 시작할 시간 (이어 듣기용)
     */
    function loadTrack(index, seekTime = 0) {
        if(playlist.length === 0) return;
        
        currentTrackIndex = index;
        const track = playlist[index];
        
        songTitleEl.innerText = `${track.title} (로딩 중...)`;
        updateUI();

        // ❗ 파일명만 인코딩하여 경로 문제를 방지
        const lastSlashIndex = track.file.lastIndexOf('/');
        const dir = track.file.substring(0, lastSlashIndex + 1); 
        const filename = track.file.substring(lastSlashIndex + 1); 
        const safeUrl = dir + encodeURIComponent(filename);
        
        audio.src = safeUrl;
        
        // 로드 완료 시 seekTime으로 이동
        const handleLoadedMetadata = () => {
            if (seekTime > 0) {
                audio.currentTime = seekTime;
            }
            songTitleEl.innerText = track.title;
            updateUI();
            audio.removeEventListener('loadedmetadata', handleLoadedMetadata);
        };
        
        audio.addEventListener('loadedmetadata', handleLoadedMetadata);
    }

    // =========================================================================
    // Utility 및 Player Control 함수
    // =========================================================================
    
    // UI 상태 동기화 함수
    function updateUI() {
        if (!playBtn || !audio || !songTitleEl) return;
        
        if (isPlaying) {
            playBtn.innerHTML = '<i class="fas fa-pause"></i>';
        } else {
            playBtn.innerHTML = '<i class="fas fa-play"></i>';
        }

        // 셔플/반복 버튼 활성화 상태 토글
        if (isShuffle) { shuffleBtn.classList.add('active-btn'); } else { shuffleBtn.classList.remove('active-btn'); }
        if (isRepeat) { repeatBtn.classList.add('active-btn'); } else { repeatBtn.classList.remove('active-btn'); }

        // 재생바 업데이트
        if (audio.duration && !isNaN(audio.duration)) {
             progressBar.max = 100;
             const progressPercent = (audio.currentTime / audio.duration) * 100;
             progressBar.value = progressPercent;
             currentTimeEl.innerText = formatTime(audio.currentTime);
             durationTimeEl.innerText = "-" + formatTime(audio.duration - audio.currentTime);
        } else {
             progressBar.value = 0;
             currentTimeEl.innerText = "0:00";
             durationTimeEl.innerText = "-0:00";
        }
    }

    function playMusic() {
        if (!audio.src && playlist.length > 0) {
             loadTrack(currentTrackIndex);
        }
        audio.play().catch(e => {
             console.error("Autoplay failed:", e);
             isPlaying = false;
             updateUI();
        });
        isPlaying = true;
        updateUI(); 
    }

    function pauseMusic() {
        audio.pause();
        isPlaying = false;
        updateUI();
    }
    
    function nextTrack() {
        if (playlist.length <= 1) {
             loadTrack(0);
             playMusic();
             return;
        }
        
        if (isShuffle) {
            let randomIndex;
            do {
                randomIndex = Math.floor(Math.random() * playlist.length);
            } while (randomIndex === currentTrackIndex);
            currentTrackIndex = randomIndex;
        } else {
            currentTrackIndex++;
            if (currentTrackIndex > playlist.length - 1) {
                currentTrackIndex = 0;
            }
        }
        loadTrack(currentTrackIndex);
        playMusic();
    }
    
    function formatTime(time) {
        if (isNaN(time) || time < 0) return "0:00";
        const minutes = Math.floor(time / 60);
        const seconds = Math.floor(time % 60);
        return `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
    }
    
    // =========================================================================
    // Event Listeners (이어 듣기 로직 및 기타 기능)
    // =========================================================================

    // Local Storage에 상태 저장 (페이지 이동 직전)
    window.addEventListener('beforeunload', () => {
        const playbackState = {
            time: audio.currentTime,
            index: currentTrackIndex,
            playing: isPlaying,
            shuffle: isShuffle,
            repeat: isRepeat
        };
        localStorage.setItem('jukeboxState', JSON.stringify(playbackState));
    });

    // 페이지 로드 시 상태 복원 및 재생 재개
    document.addEventListener('DOMContentLoaded', () => {
        const savedStateString = localStorage.getItem('jukeboxState');
        let state = null;

        if (savedStateString) {
            state = JSON.parse(savedStateString);
        }

        if (state) {
            currentTrackIndex = state.index;
            isShuffle = state.shuffle;
            isRepeat = state.repeat;

            if (currentTrackIndex < 0 || currentTrackIndex >= playlist.length) {
                currentTrackIndex = 0;
            }

            if (playlist.length > 0) {
                // 저장된 재생 위치(state.time)와 함께 로드
                loadTrack(currentTrackIndex, state.time); 

                // 자동 재생 시도 (브라우저 정책에 의해 차단될 수 있음)
                if (state.playing) {
                    audio.play().then(() => {
                         isPlaying = true;
                    }).catch(e => {
                        console.warn("자동 재생 차단. 수동 재생 필요.", e);
                        isPlaying = false;
                    });
                } else {
                    isPlaying = false;
                }
            }
            
            // localStorage.removeItem('jukeboxState'); // 상태 복원 후 제거 (선택 사항)

        } else if (playlist.length > 0) {
            // 저장된 상태가 없을 경우 (최초 접속 시): 첫 곡을 로드
            loadTrack(currentTrackIndex); 
        }
        
        updateUI(); 
    });
    
    // Jukebox Event Listeners
    if (playBtn) playBtn.addEventListener('click', () => { 
        isPlaying ? pauseMusic() : playMusic(); 
    });
    
    if (prevBtn) prevBtn.addEventListener('click', () => { 
        currentTrackIndex--; 
        if (currentTrackIndex < 0) { 
            currentTrackIndex = playlist.length - 1; 
        } 
        loadTrack(currentTrackIndex); 
        playMusic(); 
    });

    if (nextBtn) nextBtn.addEventListener('click', nextTrack);

    if (shuffleBtn) shuffleBtn.addEventListener('click', () => { 
        isShuffle = !isShuffle; 
        updateUI(); 
    });

    if (repeatBtn) repeatBtn.addEventListener('click', () => { 
        isRepeat = !isRepeat; 
        updateUI(); 
    });

    if (progressBar) progressBar.addEventListener('input', () => { 
        const duration = audio.duration; 
        if (!isNaN(duration)) {
             audio.currentTime = (progressBar.value / 100) * duration; 
        }
    });

    audio.addEventListener('timeupdate', updateUI);
    audio.addEventListener('loadedmetadata', updateUI); 
    audio.addEventListener('ended', () => { 
        if (isRepeat) {
             audio.currentTime = 0; // 곡 처음으로 돌려서 반복 재생
             playMusic();
        } else {
             nextTrack(); 
        }
    });
    
    // ------------------------------------
    // [1] 좋아요 기능
    // ------------------------------------
    window.onload = function() {
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
            
            // 가장 최근 댓글이 위에 오도록 prepend 사용
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