package controller;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.HomeProfileDAO;
import model.HomeProfileDTO;
import model.BoardPostDAO;
import model.BoardPostDTO;
import model.MemberDAO;
import model.MemberDTO;

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
        
        // 로그인 세션이 없을 경우 로그인 페이지로 리다이렉트 (절대 경로)
        if (memberNo == null) {
            response.sendRedirect(contextPath + "/loginForm.jsp");
            return;
        }
        
        // 프로필 정보 조회 (DAO 메서드는 selectOne(memberNo)을 사용한다고 가정)
        HomeProfileDAO profileDAO = new HomeProfileDAO();
        HomeProfileDTO profile = profileDAO.selectOne(memberNo); 
        
        // 인기 게시물 조회
        BoardPostDAO postDAO = new BoardPostDAO();
        // findByOwner(memberNo) 대신, owner_no를 조회하는 findByOwner_no를 가정합니다.
        // 또는 특정 사용자의 게시물이 아니므로 findAll() 또는 findPopular()가 더 적합할 수 있습니다. 
        // 여기서는 임시로 특정 사용자의 게시물을 가져오는 메서드를 사용합니다.
        ArrayList<BoardPostDTO> popularPosts = postDAO.findByOwner(memberNo); 
        
        // 작성자 정보 포함
        MemberDAO memberDAO = new MemberDAO();
        
        request.setAttribute("profile", profile);
        request.setAttribute("popularPosts", popularPosts);
        request.setAttribute("memberDAO", memberDAO);
        
        // ⭐ [필수 수정] /webapp 루트에 있는 MainProfile.jsp로 절대 경로(/) 포워드
        request.getRequestDispatcher("/MainProfile.jsp").forward(request, response);
    }
}