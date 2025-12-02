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
import model.MemberDAO;
import model.MemberDTO;
import java.sql.*;
import common.JDBConnect;

@WebServlet("/main/Board")
public class BoardListServlet extends HttpServlet {
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
        
        BoardPostDAO dao = new BoardPostDAO();
        ArrayList<BoardPostDTO> postList = dao.findAll();
        
        // 작성자 정보를 포함하여 리스트 구성
        ArrayList<BoardPostDTO> postListWithWriter = new ArrayList<>();
        MemberDAO memberDAO = new MemberDAO();
        
        for (BoardPostDTO post : postList) {
            MemberDTO writer = memberDAO.getMember(post.getWriter_no());
            if (writer != null) {
                postListWithWriter.add(post);
            }
        }
        
        request.setAttribute("postList", postListWithWriter);
        request.setAttribute("memberDAO", memberDAO);
        
        request.getRequestDispatcher("Board.jsp").forward(request, response);
    }
}

