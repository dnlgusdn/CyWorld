package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.HomeProfileDAO;
import model.HomeProfileDTO;

@WebServlet("/main/modifyprofile/ProfileSetting")
public class ProfileSettingServlet extends HttpServlet {
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
        
        HomeProfileDAO dao = new HomeProfileDAO();
        HomeProfileDTO profile = dao.findByMemberNo(memberNo);
        
        request.setAttribute("profile", profile);
        request.getRequestDispatcher("Profile_setting.jsp").forward(request, response);
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
        
        String todayIs = request.getParameter("todayIs");
        String history = request.getParameter("history");
        String miniRoomImage = request.getParameter("miniRoomImage");
        String profileImage = request.getParameter("profileImage");
        
        HomeProfileDAO dao = new HomeProfileDAO();
        HomeProfileDTO profile = dao.findByMemberNo(memberNo);
        
        if (profile == null) {
            profile = new HomeProfileDTO();
            profile.setMember_no(memberNo);
        }
        
        if (todayIs != null) profile.setToday_is(todayIs);
        if (history != null) profile.setHistory(history);
        if (miniRoomImage != null) profile.setMiniroom_image(miniRoomImage);
        if (profileImage != null) profile.setProfile_image(profileImage);
        
        int result;
        if (profile.getProfile_id() > 0) {
            result = dao.update(profile);
        } else {
            result = dao.insert(profile);
        }
        
        if (result > 0) {
            response.getWriter().println("<script>alert('프로필 설정이 저장되었습니다.'); location.href='../MainProfile.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('프로필 설정 저장에 실패했습니다.'); history.back();</script>");
        }
    }
}

