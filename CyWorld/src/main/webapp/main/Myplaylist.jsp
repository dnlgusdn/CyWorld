<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld Minihompy</title>

    <!-- CSS 연결 -->
    <link rel="stylesheet" href="./main_css/Myplaylist.css">
    <link rel="stylesheet" href="./main_css/MessageModal.css"> 
    <link rel="stylesheet" href="./main_css/JukeboxPlayer.css"> 

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
            </div>
            <!-- ===== 전체 레이아웃(Left + Right) ===== -->
            <div class="content-container">


                <!-- ============================================================
                     [공통 영역] 오른쪽 친구 목록 (항상 고정)
                     (수정 거의 없음. 모든 페이지에서 동일)
                ============================================================= -->
                <aside class="userlist-panel">

                    <div class="userlist-area">

                        <div class="userlist-header">
                            <img src="../img/cyWORLD2.png" class="cy-logo">
                            <span class="userlist-title">친구 목록</span>
                        </div>

                        <!-- 친구 리스트 -->
                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block">
                                <div class="user-name">김진우</div>
                            </div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User.jpg">
                                <span class="user-status-dot status-mobile"></span>
                            </div>
                            <div class="user-info-block">
                                <div class="user-name">위현우</div>
                            </div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User.jpg">
                                <span class="user-status-dot status-offline"></span>
                            </div>
                            <div class="user-info-block">
                                <div class="user-name">신동엽</div>
                            </div>
                        </div>

                        <!-- 더미 데이터 -->
                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">김민서</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User.jpg">
                                <span class="user-status-dot status-offline"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">나민혁</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">김가은</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User.jpg">
                                <span class="user-status-dot status-online"></span>
                            </div>
                            <div class="user-info-block"><div class="user-name">김민성</div></div>
                        </div>

                        <div class="userlist-user">
                            <div style="position: relative;">
                                <img class="user-avatar" src="../img/User.jpg">
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
                            <img src="../img/User.jpg">
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
                            <button class="left-btn"><a href="declarationPage.jsp">신고하기</a></button>
                        </div>

                    </aside>



<!-- ===========================
     [RIGHT] 메인 컨텐츠 패널
     (페이지별로 완전히 변경됨)
=========================== -->
<main class="right-panel">
    <div class="right-panel-content">
        
        <div class="content-header-group">
            <div class="content-title">
                MyPlayList <span class="sub-title">TODAY CHOICE</span>
            </div>
            <div class="search-box">
                <input type="text" placeholder="">
                <i class="fa-solid fa-magnifying-glass"></i>
            </div>
        </div>

        <div class="playlist-section">
            <div class="table-container">
                <table class="playlist-table">
                    <thead>
                        <tr>
                            <th style="width: 8%;"><input type="checkbox"></th>
                            <th style="width: 10%;">번호</th>
                            <th style="width: 50%; text-align: left; padding-left: 20px;">곡명</th>
                            <th style="width: 32%;">아티스트</th>
                        </tr>
                    </thead>

                    <tbody>
                        <%
                            // [JSP 로직 시작] MP3 파일 목록을 읽어옵니다.
                            String musicPath = application.getRealPath("/main/music"); 
                            java.io.File dir = new java.io.File(musicPath);
                            java.io.File[] files = dir.listFiles();
                        
                            int index = 0; // JS 배열 연동을 위해 0부터 시작
                        
                            if (files != null) {
                                for (java.io.File file : files) {
                                    if (file.getName().toLowerCase().endsWith(".mp3")) {
                                        
                                        String fileName = file.getName();
                                        String title = fileName.replace(".mp3", "");
                                        String artist = "";
                                        String song = title;
                                        
                                        // 파일 이름에서 아티스트와 곡명 분리 (예: "아티스트 - 곡명.mp3")
                                        if (title.contains("-")) {
                                            String[] parts = title.split("-", 2);
                                            artist = parts[0].trim(); 
                                            song = parts[1].trim(); 
                                        }
                        %>
                        <tr class="playlist-row" 
                            onclick="playMusicByIndex(<%= index %>)" 
                            data-index="<%= index %>"> 
                            
                            <td class="center"><input type="checkbox"></td>
                            <td class="center"><%= index + 1 %></td> 
                            <td class="song-title" title="<%=fileName%>">
                                <i class="fa-solid fa-caret-right play-icon"></i> 
                                <%=song%>
                            </td>
                            <td class="center"><%=artist%></td>
                        </tr>
                        <%
                                        index++; // 다음 트랙 인덱스 증가
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="footer-actions">
            <div class="back-link">
                <a href="Jukebox.jsp">&lt; 뒤로가기</a>
            </div>
        </div>
        
    </div>
</main>


<!-- ===========================
     오른쪽 탭 메뉴 (공통)
=========================== -->
                <nav class="side-tabs">
                    <a href="MainProfile.jsp" class="tab-item">홈</a>
                    <a href="Jukebox.jsp" class="tab-item active">주크박스</a>
                    <a href="Board.jsp" class="tab-item">게시판</a> 
                </nav>


<!-- ============================================================
     [변경 영역 끝]
============================================================= -->


            </div> <!-- content-container -->
            
        </div>
        
    </div>
    
</div>
<div id="sendMessageModal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <h2>쪽지 보내기</h2>
            <button class="close-btn" onclick="closeModal('sendMessageModal')">&times;</button>
        </div>
        <div class="modal-body">
            <form id="sendMessageForm" action="MessageSendAction.jsp" method="post">
                
                <div class="form-group">
                    <label for="receiverNickname">수신자 ID (닉네임):</label>
                    <input type="text" id="receiverNickname" name="receiverNickname" 
                           placeholder="쪽지를 보낼 상대방의 ID(닉네임)를 입력하세요" required>
                </div>
                
                <div class="form-group">
                    <label for="messageContent">내용:</label>
                    <textarea id="messageContent" name="messageContent" rows="6" required></textarea>
                </div>
                
                <input type="hidden" id="receiverNo" name="receiverNo" value="0"> 

                <div class="modal-footer">
                    <button type="submit" class="modal-send-btn" onclick="return validateMessageForm()">전송</button>
                    <button type="button" class="modal-cancel-btn" onclick="closeModal('sendMessageModal')">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    // 1. 음악 파일 목록 동적 생성 (JSP Scriptlet)
  const playlist = [
	    { title: "izi - 응급실", file: "./music/izi - 응급실.mp3" },
	    { title: "MC 스나이퍼 - Bk Love", file: "./music/MC 스나이퍼 - Bk Love.mp3" },
	    { title: "김동률 - 다시 사랑한다 말할까", file: "./music/김동률 - 다시 사랑한다 말할까.mp3" },
	    { title: "나얼 - 귀로(歸路)", file: "./music/나얼 - 귀로(歸路).mp3" },
	    { title: "넬 - 기억을 걷는 시간", file: "./music/넬 - 기억을 걷는 시간.mp3" },
	    { title: "리쌍 (leessang) - 리쌍부르스 (feat  정인) [leessang Blues]", file: "./music/리쌍 (leessang) - 리쌍부르스 (feat  정인) [leessang Blues].mp3" },
	    { title: "리쌍 (leessang) - 발레리노(Ballerino) (Feat. ALI)", file: "./music/리쌍 (leessang) - 발레리노(Ballerino) (Feat. ALI).mp3" },
	    { title: "리쌍 (leessang) - 헤어지지 못하는 여자, 떠나가지 못하는 남자", file: "./music/리쌍 (leessang) - 헤어지지 못하는 여자, 떠나가지 못하는 남자.mp3" },
	    { title: "박명호 - 사진 (하늘만 바라봐) (feat. 류주환, Sam Lee)", file: "./music/박명호 - 사진 (하늘만 바라봐) (feat. 류주환, Sam Lee).mp3" },
	    { title: "버즈 Buzz - 남자를 몰라", file: "./music/버즈 Buzz - 남자를 몰라.mp3" },
	    { title: "브라운아이즈 - 벌써일년", file: "./music/브라운아이즈 - 벌써일년.mp3" },
	    { title: "수취인불명 - (Address Unknown)_ 프리스타일 freestyle", file: "./music/수취인불명 - (Address Unknown)_ 프리스타일 freestyle.mp3" },
	    { title: "씨야 - 사랑의 인사", file: "./music/씨야 - 사랑의 인사.mp3" },
	    { title: "에픽하이 - (Epik High) 우산 (Feat. 윤하)", file: "./music/에픽하이 - (Epik High) 우산 (Feat. 윤하).mp3" },
	    { title: "윤미래 - Memories", file: "./music/윤미래 - Memories.mp3" },
	    { title: "임정희 - 눈물이 안났어", file: "./music/임정희 - 눈물이 안났어.mp3" },
	    { title: "키네틱플로우 - 몽환의숲(Feat. 이루마)", file: "./music/키네틱플로우 - 몽환의숲(Feat. 이루마).mp3" },
	    { title: "타우 - 우리들의 행복한 시간", file: "./music/타우 - 우리들의 행복한 시간.mp3" },
	    { title: "프리스타일 - Y", file: "./music/프리스타일 - Y.mp3" }
	];
    
    <%
        // JSP Body 상단에서 이미 읽었던 files 변수를 재활용합니다.
        
        if (files != null) {
            for (java.io.File file : files) {
                if (file.getName().toLowerCase().endsWith(".mp3")) {
                    String fileName = file.getName();
                    String title = fileName.replace(".mp3", ""); 
                    
                    String safeFileName = fileName.replace("\"", "\\\"").replace("'", "\\'");
                    String safeTitle = title.replace("\"", "\\\"").replace("\n", "\\n");

                    // 🚨 중요: Context Path를 무시하고 웹 루트 기준 절대 경로 사용
                    // 이 경로는 'http://localhost:8080/main/music/파일이름' 으로 접근 가능해야 합니다.
                    String fileUrl = "/main/music/" + safeFileName; 
                    
                    String jsonEntry = String.format("{ title: '%s', file: '%s' },", 
                        safeTitle,
                        fileUrl);
                    
                    out.println("playlist.push(" + jsonEntry + ");");
                }
            }
        }
    %>

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
    
    /**
     * 🎵 MP3 파일을 직접 로드하여 audio.src에 할당하는 함수
     */
    function loadTrack(index, seekTime = 0) {
        if(playlist.length === 0) return;
        
        currentTrackIndex = index;
        const track = playlist[index];
        
        songTitleEl.innerText = `${track.title} (로딩 중...)`;
        updateUI();

        // 🚨 경로를 그대로 사용합니다.
        const safeUrl = track.file;
        
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
    // Player Control 및 Utility 함수
    // =========================================================================
    
    /**
     * ✅ [핵심 함수] 플레이리스트의 특정 인덱스 곡을 재생합니다.
     */
    function playMusicByIndex(index) {
        if (index === currentTrackIndex && isPlaying) {
            // 현재 곡이 이미 재생 중이면 정지
            audio.pause();
            isPlaying = false;
        } else {
            // 다른 곡이거나 정지 상태이면 로드 후 재생
            loadTrack(index);
            audio.play().then(() => {
                isPlaying = true;
            }).catch(e => {
                console.error("Play failed on list click (Check File Path/Browser Policy):", e);
                // 파일을 찾지 못하거나, 브라우저 정책 문제일 수 있습니다.
                isPlaying = false; 
            });
        }
        updateUI(); 
    }


    /**
     * UI 상태 동기화 함수 (플레이어, 플레이리스트 하이라이트)
     */
    function updateUI() { 
        if (!playBtn || !audio || !songTitleEl) return;
        
        // 1. 플레이/정지 버튼 아이콘 변경
        if (isPlaying) {
            playBtn.innerHTML = '<i class="fas fa-pause"></i>';
        } else {
            playBtn.innerHTML = '<i class="fas fa-play"></i>';
        }

        // 2. 셔플/반복 버튼 활성화 상태 토글
        if (isShuffle) { shuffleBtn.classList.add('active-btn'); } else { shuffleBtn.classList.remove('active-btn'); }
        if (isRepeat) { repeatBtn.classList.add('active-btn'); } else { repeatBtn.classList.remove('active-btn'); }

        // 3. 🌟 플레이리스트 하이라이트 처리 🌟 (목록 연동)
        const allRows = document.querySelectorAll('.playlist-table .playlist-row');
        allRows.forEach(row => {
            row.classList.remove('current-track');
            if (parseInt(row.dataset.index) === currentTrackIndex) {
                row.classList.add('current-track');
            }
        });

        // 4. 재생바 및 시간 업데이트
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

    /**
     * 다음 곡 재생 함수
     */
    function nextTrack() { 
        if (playlist.length <= 1) {
             loadTrack(0);
        } else if (isShuffle) {
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
        audio.play().catch(e => { console.error("Next Track Play failed:", e); isPlaying = false; updateUI(); });
        isPlaying = true;
        updateUI();
    }
    
    /**
     * 시간 포맷 함수
     */
    function formatTime(time) { 
        if (isNaN(time) || time < 0) return "0:00";
        const minutes = Math.floor(time / 60);
        const seconds = Math.floor(time % 60);
        return `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
    }

    // =========================================================================
    // 모달 관련 함수 (생략 없이 유지)
    // =========================================================================
    function validateMessageForm() { 
        const receiverNickname = document.getElementById('receiverNickname').value.trim();
        const messageContent = document.getElementById('messageContent').value.trim();
        if (receiverNickname.length === 0) { alert('수신자 ID를 입력해 주세요.'); return false; }
        if (messageContent.length === 0) { alert('쪽지 내용을 입력해 주세요.'); return false; }
        return true; 
    }
    function openSendMessageModal() { 
        const modal = document.getElementById('sendMessageModal');
        if (modal) {
            modal.style.display = 'block';
            document.getElementById('receiverNickname').value = '';
            document.getElementById('messageContent').value = '';
            document.getElementById('receiverNickname').focus();
        }
    }
    function closeModal(modalId) { 
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.style.display = 'none';
            document.getElementById('sendMessageForm').reset();
            document.getElementById('receiverNickname').value = '';
            document.getElementById('receiverNo').value = 0; 
        }
    }
    window.onclick = function(event) {
        const modal = document.getElementById('sendMessageModal');
        if (event.target === modal) {
            closeModal('sendMessageModal');
        }
    }

    // =========================================================================
    // Event Listeners (주크박스 및 모달 제어)
    // =========================================================================

    /**
     * Local Storage에 재생 상태 저장
     */
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

    /**
     * 페이지 로드 시 상태 복원 및 UI 업데이트 
     */
    document.addEventListener('DOMContentLoaded', async () => {
        
        // 1. Jukebox Local Storage 상태 복원
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
                // 저장된 시간으로 트랙 로드
                loadTrack(currentTrackIndex, state.time); 

                // 🚨 자동 재생 시도 로직 완전히 제거. 무조건 정지 상태로 시작.
                isPlaying = false; 
            }

        } else if (playlist.length > 0) {
            // 저장된 상태가 없으면 첫 곡을 로드
            loadTrack(currentTrackIndex); 
        }
        
        updateUI(); 


        // 2. 쪽지 보내기 버튼 이벤트 연결
        const messageButton = document.querySelector('.left-buttons .left-btn:first-child');
        if (messageButton && messageButton.innerText.includes('쪽지보내기')) {
             messageButton.onclick = openSendMessageModal;
        }

    });
    
    // Jukebox 이벤트 리스너 연결
    if (playBtn) playBtn.addEventListener('click', () => { 
        if (!isPlaying) {
            // 오디오 소스가 없으면 (첫 재생) 현재 트랙 로드
            if (!audio.src && playlist.length > 0) {
                 loadTrack(currentTrackIndex); 
            }
            // 🚨 [중요] 사용자 클릭 시에만 재생 시도 (정책 우회)
            audio.play().then(() => {
                 isPlaying = true;
                 updateUI();
            }).catch(e => {
                 console.error("Play failed on user click (Check File Path):", e);
                 isPlaying = false;
                 updateUI();
                 alert("브라우저 정책으로 인해 재생에 실패했습니다. (콘솔 확인 후 파일 경로 확인 필요)");
            });
            
        } else {
            audio.pause();
            isPlaying = false;
            updateUI();
        }
    });
    
    if (prevBtn) prevBtn.addEventListener('click', () => { 
        currentTrackIndex--; 
        if (currentTrackIndex < 0) { 
            currentTrackIndex = playlist.length - 1; 
        } 
        loadTrack(currentTrackIndex); 
        audio.play().catch(e => { console.error("Prev Play failed:", e); isPlaying = false; updateUI(); });
        isPlaying = true;
        updateUI();
    });
    
    if (nextBtn) nextBtn.addEventListener('click', nextTrack);
    
    if (shuffleBtn) shuffleBtn.addEventListener('click', () => { 
        isShuffle = !isShuffle; 
        updateUI();
    });
    
    if (repeatBtn) repeatBtn.addEventListener('click', () => { 
        isRepeat = !isRepeat; 
        audio.loop = isRepeat; 
        updateUI();
    });
    
    if (progressBar) progressBar.addEventListener('input', () => { 
        const duration = audio.duration; 
        if (!isNaN(duration)) {
             audio.currentTime = (progressBar.value / 100) * duration;
        }
    });

    // 재생 상태 변화에 따른 UI 업데이트
    audio.addEventListener('timeupdate', updateUI);
    audio.addEventListener('loadedmetadata', updateUI); 
    audio.addEventListener('ended', () => { 
        if (isRepeat) {
             audio.currentTime = 0; 
             audio.play().catch(e => { console.error("Repeat Play failed:", e); isPlaying = false; updateUI(); });
             isPlaying = true;
        } else {
             nextTrack(); 
        }
    });
    
</script>


<script>
    // 1. 음악 파일 목록 설정
	const playlist = [
	    { title: "izi - 응급실", file: "./music/izi - 응급실.mp3" },
	    { title: "MC 스나이퍼 - Bk Love", file: "./music/MC 스나이퍼 - Bk Love.mp3" },
	    { title: "김동률 - 다시 사랑한다 말할까", file: "./music/김동률 - 다시 사랑한다 말할까.mp3" },
	    { title: "나얼 - 귀로(歸路)", file: "./music/나얼 - 귀로(歸路).mp3" },
	    { title: "넬 - 기억을 걷는 시간", file: "./music/넬 - 기억을 걷는 시간.mp3" },
	    { title: "리쌍 (leessang) - 리쌍부르스 (feat  정인) [leessang Blues]", file: "./music/리쌍 (leessang) - 리쌍부르스 (feat  정인) [leessang Blues].mp3" },
	    { title: "리쌍 (leessang) - 발레리노(Ballerino) (Feat. ALI)", file: "./music/리쌍 (leessang) - 발레리노(Ballerino) (Feat. ALI).mp3" },
	    { title: "리쌍 (leessang) - 헤어지지 못하는 여자, 떠나가지 못하는 남자", file: "./music/리쌍 (leessang) - 헤어지지 못하는 여자, 떠나가지 못하는 남자.mp3" },
	    { title: "박명호 - 사진 (하늘만 바라봐) (feat. 류주환, Sam Lee)", file: "./music/박명호 - 사진 (하늘만 바라봐) (feat. 류주환, Sam Lee).mp3" },
	    { title: "버즈 Buzz - 남자를 몰라", file: "./music/버즈 Buzz - 남자를 몰라.mp3" },
	    { title: "브라운아이즈 - 벌써일년", file: "./music/브라운아이즈 - 벌써일년.mp3" },
	    { title: "수취인불명 - (Address Unknown)_ 프리스타일 freestyle", file: "./music/수취인불명 - (Address Unknown)_ 프리스타일 freestyle.mp3" },
	    { title: "씨야 - 사랑의 인사", file: "./music/씨야 - 사랑의 인사.mp3" },
	    { title: "에픽하이 - (Epik High) 우산 (Feat. 윤하)", file: "./music/에픽하이 - (Epik High) 우산 (Feat. 윤하).mp3" },
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
    
    /**
     * 🎵 MP3 파일을 직접 로드하여 audio.src에 할당하는 함수
     */
    function loadTrack(index, seekTime = 0) {
        if(playlist.length === 0) return;
        
        currentTrackIndex = index;
        const track = playlist[index];
        
        songTitleEl.innerText = `${track.title} (로딩 중...)`;
        updateUI();

        // ❗ 파일명만 인코딩하여 경로 문제를 방지 (Context Path 없이 상대 경로 기준)
        const lastSlashIndex = track.file.lastIndexOf('/');
        const dir = track.file.substring(0, lastSlashIndex + 1); 
        const filename = track.file.substring(lastSlashIndex + 1); 
        
        // 최종 URL: [music/ 경로] + [인코딩된 파일명]
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

    /**
     * UI 상태 동기화 함수
     */
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

    /**
     * 다음 곡 재생 함수
     */
    function nextTrack() { 
        if (playlist.length <= 1) {
             loadTrack(0);
             audio.play().catch(e => { console.error("Next Track Play failed:", e); isPlaying = false; updateUI(); });
             isPlaying = true;
             updateUI();
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
        audio.play().catch(e => { console.error("Next Track Play failed:", e); isPlaying = false; updateUI(); });
        isPlaying = true;
        updateUI();
    }
    
    /**
     * 시간 포맷 함수
     */
    function formatTime(time) { 
        if (isNaN(time) || time < 0) return "0:00";
        const minutes = Math.floor(time / 60);
        const seconds = Math.floor(time % 60);
        return `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
    }

    // =========================================================================
    // ❗ 모달 관련 함수 (수신자 ID 입력 방식으로 변경됨)
    // =========================================================================

    /**
     * 폼 제출 전 유효성 검사 함수
     * 전송 버튼의 onclick 이벤트에 연결됩니다.
     */
    function validateMessageForm() {
        const receiverNickname = document.getElementById('receiverNickname').value.trim();
        const messageContent = document.getElementById('messageContent').value.trim();

        if (receiverNickname.length === 0) {
            alert('쪽지를 보낼 상대방의 ID(닉네임)를 입력해 주세요.');
            document.getElementById('receiverNickname').focus();
            return false; // 제출 방지
        }
        
        if (messageContent.length === 0) {
            alert('쪽지 내용을 입력해 주세요.');
            document.getElementById('messageContent').focus();
            return false;
        }

        // *주의*: 실제 서버 전송 시, MessageSendAction.jsp에서 
        // 입력받은 'receiverNickname'을 사용하여 데이터베이스에서 'receiverNo'를 조회해야 합니다.
        
        // 서버 전송을 위해 true 반환
        return true; 
    }

    /**
     * 모달을 열고 수신자 정보를 설정하는 함수
     */
    function openSendMessageModal() {
        const modal = document.getElementById('sendMessageModal');
        if (modal) {
            // 모달을 표시
            modal.style.display = 'block';
            
            // 모달 열릴 때 수신자 필드 초기화 및 포커스
            document.getElementById('receiverNickname').value = '';
            document.getElementById('messageContent').value = '';
            document.getElementById('receiverNickname').focus();
        }
    }

    /**
     * 모달을 닫는 함수
     * @param {string} modalId - 닫을 모달의 ID
     */
    function closeModal(modalId) {
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.style.display = 'none';
            // 폼 필드 초기화
            document.getElementById('sendMessageForm').reset();
            // ID 입력 필드 초기화 (선택 사항이지만 일관성 유지)
            document.getElementById('receiverNickname').value = '';
            document.getElementById('receiverNo').value = 0; 
        }
    }

    // 모달 오버레이를 클릭하면 모달 닫기
    window.onclick = function(event) {
        const modal = document.getElementById('sendMessageModal');
        if (event.target === modal) {
            closeModal('sendMessageModal');
        }
    }

    // =========================================================================
    // Event Listeners (주크박스 및 모달 제어)
    // =========================================================================

    /**
     * Local Storage에 재생 상태 저장
     */
    window.addEventListener('beforeunload', () => {
        // 현재 오디오의 상태를 localStorage에 저장
        const playbackState = {
            time: audio.currentTime,
            index: currentTrackIndex,
            playing: isPlaying, 
            shuffle: isShuffle,
            repeat: isRepeat
        };
        localStorage.setItem('jukeboxState', JSON.stringify(playbackState));
    });

    /**
     * 페이지 로드 시 상태 복원 및 UI 업데이트 
     */
    document.addEventListener('DOMContentLoaded', async () => {
        
        // 1. Jukebox Local Storage 상태 복원 (생략)
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
                loadTrack(currentTrackIndex, state.time); 

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

        } else if (playlist.length > 0) {
            loadTrack(currentTrackIndex); 
        }
        
        updateUI(); 


        // 2. 쪽지 보내기 버튼 이벤트 연결 (모달 연결)
        const messageButton = document.querySelector('.left-buttons .left-btn:first-child');
        if (messageButton && messageButton.innerText.includes('쪽지보내기')) {
             messageButton.onclick = openSendMessageModal;
        }

    });
    
    // Jukebox 이벤트 리스너 연결 (DOMContentLoaded 외부)
    if (playBtn) playBtn.addEventListener('click', () => { 
        if (!isPlaying) {
            if (!audio.src && playlist.length > 0) {
                 loadTrack(currentTrackIndex); 
            }
            audio.play().then(() => {
                 isPlaying = true;
                 updateUI();
            }).catch(e => {
                 console.error("Play failed on user click:", e);
                 isPlaying = false;
                 updateUI();
                 alert("브라우저 정책으로 인해 재생에 실패했습니다. (콘솔 확인)");
            });
            
        } else {
            audio.pause();
            isPlaying = false;
            updateUI();
        }
    });
    
    if (prevBtn) prevBtn.addEventListener('click', () => { 
        currentTrackIndex--; 
        if (currentTrackIndex < 0) { 
            currentTrackIndex = playlist.length - 1; 
        } 
        loadTrack(currentTrackIndex); 
        audio.play().catch(e => { console.error("Prev Play failed:", e); isPlaying = false; updateUI(); });
        isPlaying = true;
        updateUI();
    });
    
    if (nextBtn) nextBtn.addEventListener('click', nextTrack);
    
    if (shuffleBtn) shuffleBtn.addEventListener('click', () => { 
        isShuffle = !isShuffle; 
        updateUI();
    });
    
    if (repeatBtn) repeatBtn.addEventListener('click', () => { 
        isRepeat = !isRepeat; 
        audio.loop = isRepeat; 
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
             audio.currentTime = 0; 
             audio.play().catch(e => { console.error("Repeat Play failed:", e); isPlaying = false; updateUI(); });
             isPlaying = true;
        } else {
             nextTrack(); 
        }
    });
    
    
    
 // 기존 updateUI 함수를 대체하여 사용
    function updateUI() { 
        // 1. 플레이/정지 버튼 아이콘 변경 (기존 로직)
        if (!playBtn || !audio || !songTitleEl) return;
        
        if (isPlaying) {
            playBtn.innerHTML = '<i class="fas fa-pause"></i>';
        } else {
            playBtn.innerHTML = '<i class="fas fa-play"></i>';
        }

        // 2. 셔플/반복 버튼 활성화 상태 토글 (기존 로직)
        if (isShuffle) { shuffleBtn.classList.add('active-btn'); } else { shuffleBtn.classList.remove('active-btn'); }
        if (isRepeat) { repeatBtn.classList.add('active-btn'); } else { repeatBtn.classList.remove('active-btn'); }

        // 🌟 3. 플레이리스트 하이라이트 처리 로직 (추가된 부분) 🌟
        const allRows = document.querySelectorAll('.playlist-table .playlist-row');
        allRows.forEach(row => {
            row.classList.remove('current-track');
            if (parseInt(row.dataset.index) === currentTrackIndex) {
                row.classList.add('current-track');
            }
        });

        // 4. 재생바 업데이트 (기존 로직)
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
</script>
</body>
</html>
