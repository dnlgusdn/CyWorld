package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MemberDAO;
import model.MemberDTO;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String contextPath = request.getContextPath(); 
        
        // 1. 파라미터 받기
        String userId = request.getParameter("userId");
        String nickname = request.getParameter("nickname");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");
        // ⭐ birth_date 파라미터 추가
        String birthDate = request.getParameter("birth_date"); 
        String emailId = request.getParameter("emailId");
        String emailDomain = request.getParameter("emailDomain");
        String phonePrefix = request.getParameter("phonePrefix");
        String phoneMiddle = request.getParameter("phoneMiddle");
        String phoneLast = request.getParameter("phoneLast");
        String userType = request.getParameter("userType");
        String adminCode = request.getParameter("adminCode"); 
        
        // 2. 필수 파라미터 검증 
        if (userId == null || userId.trim().isEmpty() ||
            nickname == null || nickname.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            birthDate == null || birthDate.trim().isEmpty() || // ⭐ birthDate 검증 추가
            emailId == null || emailId.trim().isEmpty() ||
            emailDomain == null || emailDomain.trim().isEmpty() ||
            phoneMiddle == null || phoneMiddle.trim().isEmpty() || 
            phoneLast == null || phoneLast.trim().isEmpty()) {
            response.getWriter().println("<script>alert('모든 필수 항목을 입력해주세요.'); history.back();</script>");
            return;
        }
        
        // 3. 비밀번호 확인
        if (!password.equals(passwordConfirm)) {
            response.getWriter().println("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
            return;
        }
        
        // 데이터 조합
        String email = emailId + "@" + emailDomain;
        String phone = phonePrefix + "-" + phoneMiddle + "-" + phoneLast; 
        
        // 4. 관리자 타입인 경우 승인 코드 확인 로직
        if ("admin".equals(userType)) {
            if (adminCode == null || adminCode.trim().isEmpty()) {
                response.getWriter().println("<script>alert('관리자 승인 코드를 입력해주세요.'); history.back();</script>");
                return;
            }
            // 실제 관리자 코드 확인 로직은 여기에 추가해야 합니다.
        }
        
        // 5. DTO 설정
        MemberDTO dto = new MemberDTO();
        dto.setLogin_id(userId);
        dto.setNickname(nickname);
        dto.setPw(password);
        dto.setEmail(email);
        dto.setPhone(phone);
        dto.setBirth_date(birthDate); // ⭐ DTO에 birth_date 설정
        dto.setType(userType != null ? userType : "user");
        
        // 6. DB 저장
        MemberDAO dao = new MemberDAO();
        int result = dao.insertMember(dto);
        // ⭐ 오류 해결: dao.close() 호출을 제거했습니다.
        
        // 7. 결과 처리
        if (result > 0) {
            response.getWriter().println("<script>alert('회원가입이 완료되었습니다.'); location.href='" + contextPath + "/index.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('회원가입에 실패했습니다.\\n(아이디/닉네임 중복 또는 서버 오류)'); history.back();</script>");
        }
    }
}