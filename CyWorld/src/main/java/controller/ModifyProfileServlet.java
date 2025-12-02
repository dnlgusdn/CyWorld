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

@WebServlet("/main/modifyprofile/ModifyProfile")
public class ModifyProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        
        if (memberNo == null) {
            response.sendRedirect("../../../loginForm.jsp");
            return;
        }
        
        MemberDAO dao = new MemberDAO();
        MemberDTO member = dao.getMember(memberNo);
        
        request.setAttribute("member", member);
        request.getRequestDispatcher("ModifyProfile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        
        if (memberNo == null) {
            response.sendRedirect("../../../loginForm.jsp");
            return;
        }
        
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");
        String name = request.getParameter("name");
        String phonePrefix = request.getParameter("phonePrefix");
        String phoneMiddle = request.getParameter("phoneMiddle");
        String phoneLast = request.getParameter("phoneLast");
        String email = request.getParameter("email");
        
        if (password != null && !password.isEmpty()) {
            if (!password.equals(passwordConfirm)) {
                response.getWriter().println("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
                return;
            }
        }
        
        String phone = phonePrefix + "-" + phoneMiddle + "-" + phoneLast;
        
        MemberDAO dao = new MemberDAO();
        MemberDTO member = dao.getMember(memberNo);
        
        if (password != null && !password.isEmpty()) {
            member.setPw(password);
        }
        member.setNickname(name);
        member.setPhone(phone);
        member.setEmail(email);
        
        int result = dao.updateMember(member);
        
        if (result > 0) {
            session.setAttribute("nickname", member.getNickname());
            response.getWriter().println("<script>alert('프로필이 수정되었습니다.'); location.href='../MainProfile.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('프로필 수정에 실패했습니다.'); history.back();</script>");
        }
    }
}

