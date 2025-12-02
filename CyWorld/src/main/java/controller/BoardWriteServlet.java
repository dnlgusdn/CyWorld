package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BoardPostDAO;
import model.BoardPostDTO;

@WebServlet("/main/BoardWrite")
public class BoardWriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        
        if (memberNo == null) {
            response.sendRedirect("../../loginForm.jsp");
            return;
        }
        
        request.getRequestDispatcher("BoardWrite.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        
        if (memberNo == null) {
            response.sendRedirect("../../loginForm.jsp");
            return;
        }
        
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String isPrivateParam = request.getParameter("isPrivate");
        boolean isPrivate = isPrivateParam != null && isPrivateParam.equals("on");
        
        BoardPostDTO dto = new BoardPostDTO();
        dto.setOwner_no(memberNo); // 현재 로그인한 사용자의 홈
        dto.setWriter_no(memberNo); // 작성자
        dto.setTitle(title);
        dto.setContent(content);
        dto.setIs_private(isPrivate);
        
        BoardPostDAO dao = new BoardPostDAO();
        int result = dao.insert(dto);
        
        if (result > 0) {
            response.sendRedirect("Board.jsp");
        } else {
            response.getWriter().println("<script>alert('게시글 작성에 실패했습니다.'); history.back();</script>");
        }
    }
}

