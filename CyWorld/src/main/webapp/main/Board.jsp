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
    <link rel="stylesheet" href="./main_css/JukeboxPlayer.css"> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
    						<button class="write-button" onclick="location.href='BoardWrite.jsp'">작성</button>
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
    // 1. 음악 파일 목록 설정
	const playlist = [
	    { title: "izi - 응급실", file: "./music/izi - 응급실.mp3" },
	    { title: "MC 스나이퍼 - Bk Love", file: "./music/MC 스나이퍼 - Bk Love.mp3" },
	    { title: "김동률 - 다시 사랑한다 말할까", file: "./music/김동률 - 다시 사랑한다 말할까.mp3" },
	    { title: "나얼 - 귀로(歸路)", file: "./music/나얼 - 귀로(歸路).mp3" },
	    { title: "넬 - 기억을 걷는 시간", file: "./music/넬 - 기억을 걷는 시간.mp3" },
	    { title: "리쌍(LeeSSang) - 발레리노(Ballerino) (Feat. ALI)", file: "./music/리쌍(LeeSSang) - 발레리노(Ballerino) (Feat. ALI).mp3" },
	    { title: "리쌍 - 헤어지지 못하는 여자, 떠나가지 못하는 남자", file: "./music/리쌍 - 헤어지지 못하는 여자, 떠나가지 못하는 남자.mp3" },
	    { title: "버즈 Buzz - 남자몰래", file: "./music/버즈 Buzz - 남자몰래.mp3" },
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
    // Event Listeners (이어 듣기 로직)
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
        
        // 1. Local Storage 상태 복원
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

        } else if (playlist.length > 0) {
            // 저장된 상태가 없으면 첫 곡 로드
            loadTrack(currentTrackIndex); 
        }
        
        updateUI(); 
    });
    
    // 이벤트 리스너 연결
    if (playBtn) playBtn.addEventListener('click', () => { 
        if (!isPlaying) {
            if (!audio.src && playlist.length > 0) {
                 // 오디오 소스가 설정되지 않은 경우 초기 로드
                 loadTrack(currentTrackIndex); 
            }
            // 재생 시도
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
             audio.play().catch(e => { console.error("Repeat Play failed:", e); isPlaying = false; updateUI(); });
             isPlaying = true;
        } else {
             nextTrack(); 
        }
    });
</script>


</body>
</html>