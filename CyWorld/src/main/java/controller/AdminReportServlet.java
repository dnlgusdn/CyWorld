package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/report")
public class AdminReportServlet extends HttpServlet {
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
        
        // 신고 목록 조회 (UserWarningLogDAO 사용)
        // TODO: 신고 관련 DAO 구현 필요
        
        request.getRequestDispatcher("report.jsp").forward(request, response);
    }
}

