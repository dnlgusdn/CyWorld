package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BoardCommentDAO;
import model.BoardCommentDTO;
import java.sql.*;
import common.JDBConnect;

@WebServlet("/main/BoardComment")
public class BoardCommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        
        if (memberNo == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
        
        String action = request.getParameter("action");
        String postIdParam = request.getParameter("postId");
        int postId = Integer.parseInt(postIdParam);
        
        JDBConnect jdbc = new JDBConnect();
        BoardCommentDAO commentDAO = new BoardCommentDAO(jdbc.conn);
        PrintWriter out = response.getWriter();
        
        try {
            if ("add".equals(action)) {
                String content = request.getParameter("content");
                
                BoardCommentDTO comment = new BoardCommentDTO();
                comment.setPostId(postId);
                comment.setWriterNo(memberNo);
                comment.setContent(content);
                comment.setCreatedAt(new Timestamp(System.currentTimeMillis()).toString());
                
                boolean result = commentDAO.insertComment(comment);
                
                if (result) {
                    out.print("{\"success\":true,\"message\":\"댓글이 등록되었습니다.\"}");
                } else {
                    out.print("{\"success\":false,\"message\":\"댓글 등록에 실패했습니다.\"}");
                }
            } else if ("delete".equals(action)) {
                String commentIdParam = request.getParameter("commentId");
                int commentId = Integer.parseInt(commentIdParam);
                
                boolean result = commentDAO.deleteComment(commentId);
                
                if (result) {
                    out.print("{\"success\":true,\"message\":\"댓글이 삭제되었습니다.\"}");
                } else {
                    out.print("{\"success\":false,\"message\":\"댓글 삭제에 실패했습니다.\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"success\":false,\"message\":\"오류가 발생했습니다.\"}");
        } finally {
            JDBConnect.close(jdbc.conn, null, null);
            out.close();
        }
    }
}

