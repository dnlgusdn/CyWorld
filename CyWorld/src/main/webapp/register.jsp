<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyworld - 회원가입</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/register.css">
</head>
<body>
    <div class="top-border"></div>
    <div class="container">
        <div class="content-panel">
            <div class="logo-container">
                <a href="./index.jsp">
                    <img src="./img/cyWORLD2.png" alt="Cyworld Logo" class="logo-image">
                </a>
            </div>
            
            <form class="register-form" action="<%= request.getContextPath() %>/register" method="post">
                <div class="form-row">
                 
                    <label class="form-label">아이디</label>
                    <div class="input-group">
                        <input type="text" class="form-input" id="userId" name="userId" required>
                        <button type="button" class="check-button">중복확인</button>
                    </div>
  
                </div>
                <div class="form-row">
                    <label class="form-label">닉네임</label>
                    <input type="text" class="form-input" id="nickname" name="nickname" required>
                </div>
         
                <div class="form-row">
                    <label class="form-label">비밀번호</label>
                    <input type="password" class="form-input" id="password" name="password" required>
                </div>
                <div class="form-row">
               
                    <label class="form-label">비밀번호 확인</label>
                    <input type="password" class="form-input" id="passwordConfirm" name="passwordConfirm" required>
                </div>
                
                <div class="form-row">
                    <label class="form-label">생년월일</label>
                    <input type="date" class="form-input" id="birthDate" name="birth_date" required>
                </div>

                <div class="form-row">
                    <label class="form-label">이메일</label>
                
                    <div class="email-group">
                        <input type="text" class="form-input email-input" id="emailId" name="emailId" required>
                        <span class="email-separator">@</span>
                        <select class="form-select email-select" id="emailDomain" name="emailDomain" required>
               
                            <option value="naver.com" selected>naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                           
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="dongyang.ac.kr">dongyang.ac.kr</option>
                        </select>
                    </div>
                </div>
         
                <div class="form-row">
                    <label class="form-label">전화번호</label>
                    <div class="phone-group">
                        <select class="form-select phone-select" id="phonePrefix" name="phonePrefix" required>
                       
                            <option value="010" selected>010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
      
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select>
                        
                        <input type="text" class="form-input phone-input" id="phoneMiddle" name="phoneMiddle" maxlength="4" required>
                        <input type="text" class="form-input phone-input" id="phoneLast" name="phoneLast" maxlength="4" required>
                    </div>
                </div>
                
                <div class="form-row">
             
                    <label class="form-label">유형</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <input type="radio" name="userType" value="user" checked>
              
                            <span>일반</span>
                        </label>
                        <label class="radio-label">
                            <input type="radio" name="userType" value="admin">
      
                            <span>관리자</span>
                        </label>
                    </div>
                </div>
                <div class="form-row button-row">
                    <button type="submit" class="register-button">회원가입</button>
                </div>
            </form>
        </div>
    </div>

    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
  
            <a href="./index.html">
                <img src="./img/cyWORLD2.png" alt="Cyworld Logo" class="logo">
            </a>
            <h2>아이디 중복 체크</h2>
            <input type="text" id="checkUserId" placeholder="아이디를 입력하세요">
            <button type="button" class="check-btn">확인</button>
        </div>
    </div>

 
    <div id="adminModal" class="admin-modal">
        <div class="admin-modal-content">
            <span class="admin-close">&times;</span>
            <a href="./index.html">
                <img src="./img/cyWORLD2.png" alt="Cyworld Logo" class="admin-logo">
            </a>
            <h2>관리자 승인 코드 입력</h2>
            <input type="text" id="adminCode" name="adminCode" placeholder="승인 코드를 입력하세요">
            <button type="button" class="admin-check-btn">확인</button>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const contextPath = '<%= request.getContextPath() %>';
            
            const modal = document.getElementById('modal');
            const closeBtn = modal.querySelector('.close');
            const checkUserIdInput = document.getElementById('checkUserId'); 
            const checkButton = document.querySelector('.check-button'); 
            const checkBtn = modal.querySelector('.check-btn'); 
            const mainUserIdInput = document.getElementById('userId'); 
            const registerForm = document.querySelector('.register-form');
            
            let isIdChecked = false;
            let availableId = "";

            // 중복확인 버튼 클릭 시 모달 열기
            checkButton.addEventListener('click', function() {
                checkUserIdInput.value = mainUserIdInput.value;
                // ⭐ 모달 중앙 정렬 수정: 'block' 대신 'flex' 사용
                modal.style.display = 'flex'; 
            });

            // 모달 닫기
            closeBtn.addEventListener('click', function() {
                modal.style.display = 'none';
            });
            window.addEventListener('click', function(event) {
                if (event.target == modal) {
                    modal.style.display = 'none';
                }
            });

            // 모달 내부 '확인' 버튼 클릭 시 중복 확인 요청 (AJAX)
            checkBtn.addEventListener('click', function() {
                const userId = checkUserIdInput.value.trim();

                if (userId === "") {
                    alert('아이디를 입력하세요.');
                    return;
                }
                
                // AJAX 요청 (CheckIdServlet.java로 요청)
                fetch(contextPath + '/checkId', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'userId=' + encodeURIComponent(userId)
                })
                .then(response => response.text()) 
                .then(result => {
                    if (result.trim() === 'available') {
                        alert('✅ 사용 가능한 아이디입니다.');
                        isIdChecked = true;
                        availableId = userId;
                        
                        mainUserIdInput.value = userId;
                        mainUserIdInput.readOnly = true; 
                        
                        modal.style.display = 'none'; 
                    } else if (result.trim() === 'duplicate') {
                        alert('❌ 이미 사용 중인 아이디입니다.');
                        isIdChecked = false;
                        mainUserIdInput.readOnly = false;
                        mainUserIdInput.value = ""; 
                    } else {
                        alert('⚠️ 아이디 확인 중 오류가 발생했습니다. (서버 응답 오류)');
                        isIdChecked = false;
                    }
                })
                .catch(error => {
                    console.error('AJAX 오류:', error);
                    alert('서버 통신 중 오류가 발생했습니다.');
                    isIdChecked = false;
                });
            });
            
            // 폼 제출 시 최종 확인
            registerForm.addEventListener('submit', function(e) {
                if (!isIdChecked || mainUserIdInput.value !== availableId) {
                    e.preventDefault(); 
                    alert('아이디 중복 확인을 완료하고, 확인된 아이디를 그대로 사용해야 합니다.');
                    mainUserIdInput.readOnly = false; 
                    return;
                }
            });
            
            // 메인 폼의 아이디 입력 필드가 변경되면 중복확인 상태 초기화
            mainUserIdInput.addEventListener('input', function() {
                if (mainUserIdInput.readOnly) {
                    isIdChecked = false;
                    availableId = "";
                    mainUserIdInput.readOnly = false;
                    alert('아이디를 다시 입력하려면 중복 확인을 다시 해주세요.');
                }
            });
            
            // 관리자 모달 로직 (admin.js 대신 여기에 직접 추가하거나 별도 파일로 관리)
            const adminModal = document.getElementById('adminModal');
            const radioButtons = document.querySelectorAll('input[name="userType"]');
            
            radioButtons.forEach(radio => {
                radio.addEventListener('change', function() {
                    if (this.value === 'admin') {
                        // ⭐ 관리자 선택 시 모달 중앙 정렬 수정: 'flex' 사용
                        adminModal.style.display = 'flex';
                    } else {
                        adminModal.style.display = 'none';
                    }
                });
            });

            // 관리자 모달 닫기 버튼
            document.querySelector('.admin-close').addEventListener('click', function() {
                adminModal.style.display = 'none';
            });
            
        });
    </script>
    </body>
</html>