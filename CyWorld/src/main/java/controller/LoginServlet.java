package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MemberDAO; 
import model.MemberDTO;

@WebServlet("/login") // 로그인 폼의 action 경로
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String loginId = request.getParameter("loginId");
        String password = request.getParameter("password");
        
        String contextPath = request.getContextPath();
        
        // DAO를 사용하여 로그인 처리
        // MemberDAO 내부의 login 메서드에서 rs와 pstmt를 닫고,
        // conn은 JDBConnect/MemberDAO의 기본 로직에 따른다고 가정합니다.
        MemberDAO dao = new MemberDAO(); 
        MemberDTO member = dao.login(loginId, password); // DAO에서 login 메서드를 호출하여 MemberDTO 반환
        
        try {
            if (member != null) {
                // 1. 로그인 성공: 세션에 회원 정보 저장
                HttpSession session = request.getSession();
                session.setAttribute("memberNo", member.getMember_no());
                session.setAttribute("loginId", member.getLogin_id());
                session.setAttribute("nickname", member.getNickname()); // 닉네임 세션 저장
                session.setAttribute("type", member.getType());
                session.setAttribute("member", member); // DTO 객체 전체를 세션에 저장
                
                // 2. MainProfileServlet으로 리다이렉트
                if ("admin".equals(member.getType())) {
                    response.sendRedirect(contextPath + "/admin/main.jsp");
                } else {
                    // MainProfileServlet의 @WebServlet("/main/MainProfile") 경로로 이동
                    response.sendRedirect(contextPath + "/main/MainProfile"); 
                }
            } else {
                // 3. 로그인 실패
                response.getWriter().println("<script>");
                response.getWriter().println("alert('아이디 또는 비밀번호가 잘못되었습니다.');");
                response.getWriter().println("history.back();"); 
                response.getWriter().println("</script>");
            }
        } catch (Exception e) { 
            e.printStackTrace();
            response.getWriter().println("<script>alert('로그인 처리 중 오류가 발생했습니다. 콘솔을 확인하세요.'); history.back();</script>");
        } 
        // 🚨 dao.close()로 인한 오류 발생을 방지하기 위해 finally 블록을 의도적으로 제거했습니다.
    }
}