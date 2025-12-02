/**
 * 
 */
// 아이디 중복확인 모달 및 중복 체크 기능
document.addEventListener('DOMContentLoaded', function() {
    // 모달 열기 (중복확인 버튼 클릭)
    const checkButton = document.querySelector('.check-button');
    if (checkButton) {
        checkButton.addEventListener('click', function() {
            const modal = document.getElementById('modal');
            if (modal) {
                modal.style.display = 'flex';
                // 현재 입력된 아이디를 모달에 복사
                const currentId = document.getElementById('userId');
                const checkUserId = document.getElementById('checkUserId');
                if (currentId && checkUserId) {
                    checkUserId.value = currentId.value;
                }
            }
        });
    }

    // 모달 닫기 (X 버튼)
    const closeBtn = document.querySelector('.close');
    if (closeBtn) {
        closeBtn.addEventListener('click', function() {
            const modal = document.getElementById('modal');
            if (modal) {
                modal.style.display = 'none';
            }
        });
    }

    // 모달 배경 클릭 시 닫기
    const modal = document.getElementById('modal');
    if (modal) {
        modal.addEventListener('click', function(e) {
            if (e.target === this) {
                this.style.display = 'none';
            }
        });
    }

    // 모달 안의 "확인" 버튼으로 실제 중복 체크 요청
    const checkBtn = document.querySelector('.check-btn');
    if (checkBtn) {
        checkBtn.addEventListener('click', function() {
            const checkUserIdInput = document.getElementById('checkUserId');
            const userIdInput = document.getElementById('userId');
            const modal = document.getElementById('modal');

            if (!checkUserIdInput || !userIdInput) return;

            const userId = checkUserIdInput.value.trim();
            if (!userId) {
                alert('아이디를 입력하세요.');
                return;
            }

            // CheckIdServlet(/checkId)로 AJAX 요청
            fetch('./checkId', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
                },
                body: 'userId=' + encodeURIComponent(userId)
            })
            .then(response => response.text())
            .then(result => {
                if (result === 'duplicate') {
                    alert('이미 사용 중인 아이디입니다.');
                } else if (result === 'available') {
                    alert('사용 가능한 아이디입니다.');
                    // 사용 가능한 경우, 메인 폼 아이디에 반영
                    userIdInput.value = userId;
                    if (modal) {
                        modal.style.display = 'none';
                    }
                } else {
                    alert('중복 확인 중 오류가 발생했습니다.');
                }
            })
            .catch(err => {
                console.error('checkId error:', err);
                alert('중복 확인 중 오류가 발생했습니다.');
            });
        });
    }

});
