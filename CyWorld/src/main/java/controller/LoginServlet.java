package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import common.JDBConnect; // 사용자님의 DB 연결 클래스
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
        
        // JDBConnect는 사용자님의 DB 연결 객체
        JDBConnect jdbc = new JDBConnect(); 
        MemberDTO member = null;
        
        try {
            String sql = "SELECT * FROM member WHERE login_id = ? AND pw = ?";
            
            jdbc.pstmt = jdbc.conn.prepareStatement(sql);
            jdbc.pstmt.setString(1, loginId);
            jdbc.pstmt.setString(2, password);
            jdbc.rs = jdbc.pstmt.executeQuery();
            
            if (jdbc.rs.next()) {
                // 1. 로그인 성공 및 DTO 설정
                member = new MemberDTO();
                member.setMember_no(jdbc.rs.getInt("member_no"));
                member.setLogin_id(jdbc.rs.getString("login_id"));
                member.setNickname(jdbc.rs.getString("nickname"));
                member.setEmail(jdbc.rs.getString("email"));
                member.setType(jdbc.rs.getString("type")); // type 필드 사용
                
                // 세션 설정
                HttpSession session = request.getSession();
                session.setAttribute("member", member);
                session.setAttribute("memberNo", member.getMember_no());
                session.setAttribute("loginId", member.getLogin_id());
                session.setAttribute("nickname", member.getNickname());
                session.setAttribute("type", member.getType());
                
                // 2. MainProfileServlet으로 리다이렉트 (Context Path 사용)
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
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('로그인 처리 중 데이터베이스 오류가 발생했습니다. 콘솔을 확인하세요.'); history.back();</script>");
        } finally {
            // JDBConnect의 close 메서드를 사용한다고 가정
            try {
                if (jdbc.rs != null) jdbc.rs.close();
                if (jdbc.pstmt != null) jdbc.pstmt.close();
                if (jdbc.conn != null) jdbc.conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}