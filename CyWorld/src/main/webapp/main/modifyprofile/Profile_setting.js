/**
 * 
 */
// 프로필 이미지 클릭 시 파일 선택
document.getElementById('profileImageBox').addEventListener('click', function() {
    document.getElementById('profileImageInput').click();
});

// 미니룸 이미지 클릭 시 파일 선택
document.getElementById('miniroomBox').addEventListener('click', function() {
    document.getElementById('miniroomImageInput').click();
});

// 프로필 이미지 파일 선택 시 미리보기
document.getElementById('profileImageInput').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const img = document.getElementById('profileImage');
            img.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
});

// 미니룸 이미지 파일 선택 시 미리보기
document.getElementById('miniroomImageInput').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const img = document.getElementById('miniroomImage');
            img.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
});

