package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BoardPostDAO;
import model.BoardPostDTO;
import model.BoardCommentDAO;
import model.BoardCommentDTO;
import model.BoardLikeDAO;
import model.MemberDAO;
import model.MemberDTO;
import java.sql.*;
import common.JDBConnect;

@WebServlet("/main/BoardView")
public class BoardViewServlet extends HttpServlet {
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
        
        String boardIDParam = request.getParameter("boardID");
        int boardID = 1;
        if (boardIDParam != null && !boardIDParam.equals("")) {
            try {
                boardID = Integer.parseInt(boardIDParam);
            } catch (NumberFormatException e) {
                response.sendRedirect("Board.jsp");
                return;
            }
        }
        
        BoardPostDAO postDAO = new BoardPostDAO();
        BoardPostDTO post = postDAO.findById(boardID);
        
        if (post == null) {
            response.sendRedirect("Board.jsp");
            return;
        }
        
        // 작성자 정보 조회
        MemberDAO memberDAO = new MemberDAO();
        MemberDTO writer = memberDAO.getMember(post.getWriter_no());
        
        // 댓글 목록 조회
        JDBConnect jdbc = new JDBConnect();
        BoardCommentDAO commentDAO = new BoardCommentDAO(jdbc.conn);
        List<BoardCommentDTO> comments = commentDAO.getCommentsByPostId(boardID);
        
        // 댓글 작성자 정보 포함
        for (BoardCommentDTO comment : comments) {
            MemberDTO commentWriter = memberDAO.getMember(comment.getWriterNo());
            if (commentWriter != null) {
                // 댓글에 작성자 닉네임 정보 추가 (DTO에 필드가 있다면)
            }
        }
        
        // 좋아요 여부 확인
        BoardLikeDAO likeDAO = new BoardLikeDAO(jdbc.conn);
        boolean isLiked = likeDAO.isLikedByMember(boardID, memberNo);
        int likeCount = likeDAO.countLikesByPostId(boardID);
        
        request.setAttribute("post", post);
        request.setAttribute("writer", writer);
        request.setAttribute("comments", comments);
        request.setAttribute("isLiked", isLiked);
        request.setAttribute("likeCount", likeCount);
        request.setAttribute("memberDAO", memberDAO);
        
        request.getRequestDispatcher("BoardView.jsp").forward(request, response);
        
        JDBConnect.close(jdbc.conn, null, null);
    }
}

