package controller;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BoardPostDAO;
import model.BoardPostDTO;

@WebServlet("/admin/board")
public class AdminBoardServlet extends HttpServlet {
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
        
        BoardPostDAO postDAO = new BoardPostDAO();
        ArrayList<BoardPostDTO> postList = postDAO.findAll();
        
        request.setAttribute("postList", postList);
        request.getRequestDispatcher("board.jsp").forward(request, response);
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
        String postIdParam = request.getParameter("postId");
        
        if (postIdParam != null) {
            int postId = Integer.parseInt(postIdParam);
            BoardPostDAO postDAO = new BoardPostDAO();
            
            if ("delete".equals(action)) {
                postDAO.delete(postId);
            }
        }
        
        response.sendRedirect("board.jsp");
    }
}

