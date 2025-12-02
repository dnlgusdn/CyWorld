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
import model.BoardLikeDAO;
import model.BoardLikeDTO;
import java.sql.*;
import common.JDBConnect;

@WebServlet("/main/BoardLike")
public class BoardLikeServlet extends HttpServlet {
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
        
        String postIdParam = request.getParameter("postId");
        int postId = Integer.parseInt(postIdParam);
        
        JDBConnect jdbc = new JDBConnect();
        BoardLikeDAO likeDAO = new BoardLikeDAO(jdbc.conn);
        
        boolean isLiked = likeDAO.isLikedByMember(postId, memberNo);
        PrintWriter out = response.getWriter();
        
        try {
            if (isLiked) {
                // 좋아요 취소 - like_id를 찾아서 삭제
                String sql = "SELECT like_id FROM board_like WHERE post_id = ? AND member_no = ?";
                jdbc.pstmt = jdbc.conn.prepareStatement(sql);
                jdbc.pstmt.setInt(1, postId);
                jdbc.pstmt.setInt(2, memberNo);
                jdbc.rs = jdbc.pstmt.executeQuery();
                
                if (jdbc.rs.next()) {
                    int likeId = jdbc.rs.getInt("like_id");
                    likeDAO.deleteLike(likeId);
                }
            } else {
                // 좋아요 추가
                BoardLikeDTO like = new BoardLikeDTO();
                like.setPostId(postId);
                like.setMemberNo(memberNo);
                like.setLikedAt(new Timestamp(System.currentTimeMillis()).toString());
                likeDAO.insertLike(like);
            }
            
            int likeCount = likeDAO.countLikesByPostId(postId);
            boolean newIsLiked = likeDAO.isLikedByMember(postId, memberNo);
            
            out.print("{\"success\":true,\"likeCount\":" + likeCount + ",\"isLiked\":" + newIsLiked + "}");
        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"success\":false,\"message\":\"오류가 발생했습니다.\"}");
        } finally {
            JDBConnect.close(jdbc.conn, jdbc.pstmt, jdbc.rs);
            out.close();
        }
    }
}

