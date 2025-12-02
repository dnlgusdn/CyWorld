package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MemberDAO;
import model.MemberDTO;
import model.MemberStatusDAO;
import model.MemberStatusDTO;

@WebServlet("/admin/member")
public class AdminMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        String userType = (String) session.getAttribute("type");
        
        if (memberNo == null || !"admin".equals(userType)) {
            response.sendRedirect("../../loginForm.jsp");
            return;
        }
        
        MemberDAO memberDAO = new MemberDAO();
        List<MemberDTO> memberList = memberDAO.getAllMembers();
        
        // 회원 상태 정보 포함
        MemberStatusDAO statusDAO = new MemberStatusDAO();
        for (MemberDTO member : memberList) {
            MemberStatusDTO status = statusDAO.findByMemberNo(member.getMember_no());
            // 상태 정보를 member에 포함시키거나 별도로 전달
        }
        
        request.setAttribute("memberList", memberList);
        request.getRequestDispatcher("member.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        String userType = (String) session.getAttribute("type");
        
        if (memberNo == null || !"admin".equals(userType)) {
            response.sendRedirect("../../loginForm.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        String memberNoParam = request.getParameter("memberNo");
        
        if (memberNoParam != null) {
            int targetMemberNo = Integer.parseInt(memberNoParam);
            MemberStatusDAO statusDAO = new MemberStatusDAO();
            
            if ("suspend".equals(action)) {
                // 임시 정지
                statusDAO.updateStatus(targetMemberNo, "temp_stop");
            } else if ("ban".equals(action)) {
                // 영구 정지
                statusDAO.updateStatus(targetMemberNo, "perm_stop");
            } else if ("activate".equals(action)) {
                // 활성화
                statusDAO.updateStatus(targetMemberNo, "active");
            }
        }
        
        response.sendRedirect("member.jsp");
    }
}

