package controller;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
// 필요한 DTO/DAO는 주석 처리하거나 실제 프로젝트에 맞게 사용합니다.
// import model.HomeProfileDAO;
// import model.HomeProfileDTO;
// import model.BoardPostDAO;
// import model.BoardPostDTO;
// import model.MemberDAO;
// import model.MemberDTO;

@WebServlet("/main/MainProfile")
public class MainProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        
        String contextPath = request.getContextPath();
        
        // 로그인 세션이 없을 경우 로그인 페이지로 리다이렉트
        if (memberNo == null) {
            response.sendRedirect(contextPath + "/loginForm.jsp");
            return;
        }
        
        // TODO: 실제 프로젝트에서 필요한 프로필, 게시물 등의 DB 조회 로직 추가
        
        // MainProfile.jsp로 포워딩. JSP는 세션에 저장된 member 객체를 사용합니다.
        request.getRequestDispatcher("/main/MainProfile.jsp").forward(request, response);
    }
}