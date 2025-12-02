package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DailyDashboardStatsDAO;
import model.DailyDashboardStatsDTO;

@WebServlet("/admin/main")
public class AdminMainServlet extends HttpServlet {
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
        
        // 대시보드 통계 조회
        DailyDashboardStatsDAO statsDAO = new DailyDashboardStatsDAO();
        DailyDashboardStatsDTO stats = statsDAO.getTodayStats();
        
        request.setAttribute("stats", stats);
        request.getRequestDispatcher("main.jsp").forward(request, response);
    }
}

