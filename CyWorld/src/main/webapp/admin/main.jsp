<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Page - Dashboard</title>
	<link rel="stylesheet" href="../main/main_css/MessageModal.css"> 
    <link rel="stylesheet" href="./admin_css/admin_bass.css?v=20251202E">
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

                <div class="header-title">Dashboard</div>

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
                    <div class="dashboard-content">

                        <div class="top-row">
                            <div class="card calendar-card">
                                <h3>Calendar</h3>
                                <div class="cal-header">
                                    <span class="month">November</span> <span class="year">2025</span>
                                </div>
                                <table class="cal-table">
                                    <thead>
                                        <tr><th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr><td class="past">27</td><td class="past">28</td><td class="past">29</td><td class="past">30</td><td class="past">31</td><td>1</td><td>2</td></tr>
                                        <tr><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td></tr>
                                        <tr><td>10</td><td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td></tr>
                                        <tr><td>17</td><td>18</td><td>19</td><td>20</td><td>21</td><td>22</td><td>23</td></tr>
                                        <tr><td>24</td><td class="today">25</td><td>26</td><td>27</td><td>28</td><td>29</td><td>30</td></tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="card usage-card">
                                <h3>Usage Trends</h3>
                                <div class="graph-area">
                                    <img src="../img/graph.png" alt="Usage Graph" class="graph-img">
                                </div>
                            </div>

                            <div class="card availability-card">
                                <h3>Home page availability</h3>
                                <div class="gauge-area">
                                    <div class="gauge-circle" data-percent="60">
                                        <div class="gauge-fill"></div>
                                        <div class="gauge-text">60%</div>
                                    </div>
                                    <button class="restart-btn"><i class="fas fa-power-off"></i> Restart</button>
                                </div>
                            </div>
                        </div> <div class="bottom-row">
                            <div class="card summary-card">
                                <h3>Top Summary Cards</h3>
                                <ul>
                                    <li>Number of new visitors today: <span>33</span></li>
                                    <li>Number of new subscribers today: <span>9</span></li>
                                    <li>Number of outstanding reports (reported today): <span>5</span></li>
                                    <li>Number of posts written today: <span>2</span></li>
                                </ul>
                            </div>

                            <div class="card report-card">
                                <h3>Reporting/Suspension Information</h3>
                                <ul>
                                    <li>First permanent suspension: <span>3422</span></li>
                                    <li>Final report: <span>423</span></li>
                                </ul>
                            </div>
                        </div> </div> </main>


                <nav class="side-tabs">
                    <a href="main.jsp" class="tab-item active">대시보드</a>
                    <a href="member.jsp" class="tab-item">회원관리</a>
                    <a href="report" class="tab-item">신고관리</a>
                    <a href="board.jsp" class="tab-item">게시판관리</a> 
                </nav>


            </div> </div>
    </div>
</div>
<div id="sendMessageModal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <h2>단체쪽지</h2>
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
        // 단체쪽지여도 수신자 닉네임 필드가 DOM에 남아있으므로 유효성 검사는 그대로 유지합니다.
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
        
        // 🚨 수정된 부분: '단체쪽지' 또는 '쪽지보내기' 텍스트를 포함하는 경우 모두 모달을 연결
        if (messageButton) {
            // innerText를 trim()하여 앞뒤 공백을 제거하고 비교합니다.
            const buttonText = messageButton.innerText.trim();
            
            if (buttonText === '단체쪽지' || buttonText === '쪽지보내기') {
                 messageButton.onclick = openSendMessageModal;
            }
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
</script>
</body>
</html>