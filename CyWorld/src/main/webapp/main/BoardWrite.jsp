<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld 게시글 작성</title>

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

        /* 작성 폼 전체 컨테이너 */
        .write-container {
            border: 1px solid #ccc;
            background-color: #fff;
            padding: 5px;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        /* 1. 회색 상단 바 (날짜, 비공개) */
        .write-header-bar {
            background-color: #e0e0e0; /* 진한 회색 */
            padding: 8px 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid #b0b0b0;
            border-bottom: none;
            font-size: 13px;
            color: #333;
        }
        .privacy-check {
            font-size: 12px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        /* 2. 본문 영역 (테두리 감싸기) */
        .write-body {
            border: 1px solid #b0b0b0;
            padding: 15px;
        }

        /* 제목 입력 */
        .write-title-row {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
        }
        .write-title-label {
            font-weight: bold;
            font-size: 14px;
            color: #555;
        }
        .write-input-title {
            flex-grow: 1;
            border: 1px solid #ddd;
            padding: 5px;
            font-family: inherit;
            background-color: #fff;
        }

        /* 내용 입력 (Textarea) */
        .write-textarea {
            width: 100%;
            height: 250px;
            border: none;
            resize: none;
            font-family: 'DungGeunMo', 'Malgun Gothic', sans-serif;
            font-size: 13px;
            line-height: 1.6;
            outline: none;
        }

        /* 하단 태그 및 잠금 영역 */
        .write-footer-area {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            padding-top: 10px;
            border-top: 1px dotted #ccc;
        }

        /* 태그 버튼 스타일 */
        .tag-group {
            display: flex;
            gap: 5px;
        }
        .tag-btn {
            background-color: #f1f1f1;
            border: 1px solid #ccc;
            border-radius: 15px;
            padding: 3px 10px;
            font-size: 11px;
            color: #555;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 3px;
        }
        .tag-btn:hover { background-color: #e2e2e2; }
        
        /* 잠금 아이콘 */
        .lock-icons {
            font-size: 16px;
            color: #333;
            letter-spacing: 5px;
        }

        /* 3. 하단 완료/취소 버튼 */
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
        }
        .btn-submit, .btn-cancel {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 5px 20px;
            font-size: 13px;
            cursor: pointer;
            border-radius: 3px;
            box-shadow: 1px 1px 1px rgba(0,0,0,0.1);
        }
        .btn-submit:active, .btn-cancel:active {
            box-shadow: inset 1px 1px 2px rgba(0,0,0,0.1);
            transform: translateY(1px);
        }
    </style>
</head>

<body>

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
                        
                        <ul style="padding-left:15px; font-size:12px; color:#666; margin-top:5px; line-height:1.4;">
                            <li>윤석열이 계엄을 했다고??...</li>
                            <li>현우님 같이 한강가실래요?</li>
                            <li>할아버지 그린노랭 피우셨...</li>
                        </ul>
                    </div>

                    <div class="left-buttons" style="display: flex; justify-content: center; margin-top: auto; padding-top: 15px;">
                         <button class="left-btn" style="width: 80%;">설정</button>
                    </div>
                </aside>


                <main class="right-panel">
                    <div class="board-content">
                        
                        <div class="board-header-section" style="margin-bottom: 15px;">
                            <div class="board-title" style="font-weight: bold; font-size: 16px; color: #55b2d4;">
                                bulletin board <span style="font-size:12px; color:#999; font-weight: normal;"> 게시판을 남겨보세요!</span>
                            </div>
                            <div class="search-box">
                                <input type="text" placeholder="제목/작성자 검색">
                                <button><i class="fas fa-search"></i></button>
                            </div>
                        </div>

                        <form action="BoardWriteAction.jsp" method="post"> <div class="write-header-bar">
                                <span>2025-11-14</span> <div class="privacy-check">
                                    <span>비공개</span>
                                    <input type="checkbox" name="isPrivate">
                                </div>
                            </div>

                            <div class="write-body">
                                
                                <div class="write-title-row">
                                    <span class="write-title-label">제목 :</span>
                                    <input type="text" name="title" class="write-input-title" placeholder="제목을 입력하세요">
                                </div>

                                <textarea name="content" class="write-textarea" placeholder="학교앞에서 밥먹을건데 점심 뭐먹을까? 다들 좋아요 눌러줘 핫게시물에 등재되게"></textarea>

								<div class="write-footer-area">
								    <div class="tag-group" id="tagGroup">
								        <button type="button" class="tag-btn" onclick="showTagInput()"><i class="fas fa-hashtag"></i></button>
								
								        <div id="tagInputContainer" style="display: none;">
								            <input type="text" id="newTagInput" placeholder="키워드 입력 후 Enter"
								                   style="border: 1px solid #ccc; padding: 3px; font-size: 11px; width: 120px; font-family: inherit;">
								        </div>
								    </div>
								    
								    <div class="lock-icons">
								        <i class="fas fa-lock"></i>
								        <i class="fas fa-unlock"></i>
								    </div>
								</div>

                            <div class="action-buttons">
                                <button type="submit" class="btn-submit">완료</button>
                                <button type="button" class="btn-cancel" onclick="history.back()">취소</button>
                            </div>

                        </form>
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
    // Event Listeners (이어 듣기 로직 및 Jukebox 기능)
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
        } else if (playlist.length > 0) {
            // 저장된 상태가 없을 경우 (최초 접속 시): 첫 곡을 로드
            loadTrack(currentTrackIndex); 
        }
        
        updateUI(); 

        // Jukebox Event Listeners 연결
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
        // 게시글 작성 기능 (기존 로직 유지)
        // ------------------------------------

        const inputField = document.getElementById('newTagInput');
        if (inputField) {
            // 인풋 박스에서 키를 누르는 이벤트를 감지하여 handleTagInput 함수 실행
            inputField.addEventListener('keydown', handleTagInput);
            
            // (선택 사항: 포커스를 잃었을 때 (Blur) 입력창 숨기기)
            inputField.addEventListener('blur', () => {
                 // 입력값이 비어있을 때만 숨김
                 if (inputField.value.trim() === '') {
                    document.getElementById('tagInputContainer').style.display = 'none';
                 }
            });
        }
    });

    // 태그 입력 필드를 표시하는 함수 (전역 함수로 유지)
    function showTagInput() {
        const container = document.getElementById('tagInputContainer');
        const inputField = document.getElementById('newTagInput');
        
        container.style.display = 'flex'; // 인풋 박스를 표시
        inputField.focus(); // 바로 입력할 수 있도록 포커스 이동
    }

    // 태그를 추가하는 함수 (Enter 키 이벤트 처리)
    function handleTagInput(event) {
        // 1. Enter 키(keyCode 13 또는 key 'Enter')가 눌렸는지 확인
        if (event.key === 'Enter' || event.keyCode === 13) {
            event.preventDefault(); // Enter로 인해 폼이 제출되는 것을 방지
            
            const inputField = event.target;
            let tagName = inputField.value.trim();

            // 2. 입력값이 유효한지 확인
            if (tagName) {
                // 해시태그(#)가 없으면 추가
                if (!tagName.startsWith('#')) {
                    tagName = '#' + tagName;
                }
                
                // 3. 새로운 태그 버튼 생성
                const newTagButton = document.createElement('button');
                newTagButton.type = 'button';
                newTagButton.className = 'tag-btn';
                newTagButton.innerText = tagName;
                
                // (선택 사항: 클릭 시 태그 삭제 기능 추가)
                newTagButton.onclick = function() {
                    newTagButton.remove();
                };

                // 4. 태그 그룹 컨테이너에 추가
                document.getElementById('tagGroup').appendChild(newTagButton);

                // 5. 입력 필드 초기화 및 숨기기
                inputField.value = '';
                document.getElementById('tagInputContainer').style.display = 'none';
            }
        }
    }
</script>
</body>
</html>