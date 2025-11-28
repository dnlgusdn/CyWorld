/**
 * 
 */
// 아이디 중복확인 모달 관련 기능
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

});
