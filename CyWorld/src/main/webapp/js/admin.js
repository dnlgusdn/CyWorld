/**
 * 
 */
// 관리자 승인 코드 모달 관련 기능
document.addEventListener('DOMContentLoaded', function() {
    // 관리자 라디오 버튼 클릭 시 모달 열기
    const adminRadio = document.querySelector('input[name="userType"][value="admin"]');
    if (adminRadio) {
        adminRadio.addEventListener('change', function() {
            if (this.checked) {
                const adminModal = document.getElementById('adminModal');
                if (adminModal) {
                    adminModal.style.display = 'flex';
                }
            }
        });
    }

    // 관리자 모달 닫기 (X 버튼)
    const adminCloseBtn = document.querySelector('.admin-close');
    if (adminCloseBtn) {
        adminCloseBtn.addEventListener('click', function() {
            const adminModal = document.getElementById('adminModal');
            if (adminModal) {
                adminModal.style.display = 'none';
                // 모달 닫을 때 일반 라디오 버튼으로 변경
                const generalRadio = document.querySelector('input[name="userType"][value="general"]');
                if (generalRadio) {
                    generalRadio.checked = true;
                }
            }
        });
    }

    // 관리자 모달 배경 클릭 시 닫기
    const adminModal = document.getElementById('adminModal');
    if (adminModal) {
        adminModal.addEventListener('click', function(e) {
            if (e.target === this) {
                this.style.display = 'none';
                // 모달 닫을 때 일반 라디오 버튼으로 변경
                const generalRadio = document.querySelector('input[name="userType"][value="general"]');
                if (generalRadio) {
                    generalRadio.checked = true;
                }
            }
        });
    }

});

