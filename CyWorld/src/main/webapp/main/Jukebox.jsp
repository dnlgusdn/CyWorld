<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld Jukebox</title>

    <link rel="stylesheet" href="./main_css/MainProfile.css">
    <link rel="stylesheet" href="./main_css/JukeboxPlayer.css"> 
    <link rel="stylesheet" href="./main_css/jukebox.css"> 
    <link rel="stylesheet" href="./main_css/MessageModal.css"> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
                         <button class="left-btn" style="width: 48%;" id="openMessageModalBtn">쪽지보내기</button>
                         <button class="left-btn" style="width: 48%;">신고하기</button>
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
    // 1. 음악 파일 목록 설정 (기존과 동일)
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
    
    // DOM 요소 가져오기 (Jukebox)
    const playBtn = document.getElementById('playBtn');
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');
    const shuffleBtn = document.getElementById('shuffleBtn');
    const repeatBtn = document.getElementById('repeatBtn');
    const progressBar = document.getElementById('progressBar');
    const currentTimeEl = document.getElementById('currentTime');
    const durationTimeEl = document.getElementById('durationTime');
    const songTitleEl = document.getElementById('songTitle');
    
    // =========================================================================
    // ❗ 쪽지 보내기 모달 관련 함수 (수신자 ID 입력 방식으로 변경됨)
    // =========================================================================

    /**
     * 폼 제출 전 유효성 검사 함수
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

        return true; 
    }

    /**
     * 모달을 열고 수신자 정보를 설정하는 함수
     */
    function openSendMessageModal() {
        const modal = document.getElementById('sendMessageModal');
        if (modal) {
            modal.style.display = 'block';
            // 모달 열릴 때 수신자 필드 초기화 및 포커스
            document.getElementById('receiverNickname').value = '';
            document.getElementById('messageContent').value = '';
            document.getElementById('receiverNickname').focus();
        }
    }

    /**
     * 모달을 닫는 함수
     */
    function closeModal(modalId) {
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.style.display = 'none';
            // 폼 필드 초기화
            document.getElementById('sendMessageForm').reset();
            // ID 입력 필드 초기화 (선택 사항이지만 일관성 유지)
            document.getElementById('receiverNickname').value = ''; 
        }
    }

    // 모달 오버레이를 클릭하면 모달 닫기
    window.onclick = function(event) {
        const modal = document.getElementById('sendMessageModal');
        if (modal && event.target === modal) {
            closeModal('sendMessageModal');
        }
    }

    // =========================================================================
    // Jukebox Utility 및 Player Control 함수 (기존과 동일)
    // =========================================================================
    
    function formatTime(time) { 
        if (isNaN(time) || time < 0) return "0:00";
        const minutes = Math.floor(time / 60);
        const seconds = Math.floor(time % 60);
        return `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
    }
    
    function updateUI() { 
        if (!playBtn || !audio || !songTitleEl) return;
        
        if (isPlaying) {
            playBtn.innerHTML = '<i class="fas fa-pause"></i>';
        } else {
            playBtn.innerHTML = '<i class="fas fa-play"></i>';
        }

        if (isShuffle) { shuffleBtn.classList.add('active-btn'); } else { shuffleBtn.classList.remove('active-btn'); }
        if (isRepeat) { repeatBtn.classList.add('active-btn'); } else { repeatBtn.classList.remove('active-btn'); }
        audio.loop = isRepeat;

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

    function loadTrack(index, seekTime = 0) {
        if(playlist.length === 0) return;
        
        currentTrackIndex = index;
        const track = playlist[index];
        
        songTitleEl.innerText = `${track.title} (로딩 중...)`;
        updateUI();

        const lastSlashIndex = track.file.lastIndexOf('/');
        const dir = track.file.substring(0, lastSlashIndex + 1); 
        const filename = track.file.substring(lastSlashIndex + 1); 
        const safeUrl = dir + encodeURIComponent(filename);
        
        audio.src = safeUrl;
        
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
    
    // =========================================================================
    // Event Listeners
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
        
        // 1. Local Storage 상태 복원 (Jukebox)
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


        // 2. ❗ 쪽지 보내기 버튼 이벤트 연결 (모달 연결)
        const messageButton = document.getElementById('openMessageModalBtn');
        if (messageButton) {
             messageButton.onclick = openSendMessageModal;
        }
    });
    
    // Jukebox 이벤트 리스너 연결 (기존과 동일)
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
</script>

</body>
</html>