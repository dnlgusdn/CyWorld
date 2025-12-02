package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardCommentDAO {

    private Connection con;

    public BoardCommentDAO(Connection con) {
        this.con = con;
    }

    // 1. 댓글 추가
    public boolean insertComment(BoardCommentDTO comment) {
        String sql = "INSERT INTO board_comment (post_id, writer_no, content, created_at) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, comment.getPostId());
            pstmt.setInt(2, comment.getWriterNo());
            pstmt.setString(3, comment.getContent());
            pstmt.setString(4, comment.getCreatedAt());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. 댓글 전체 조회 (특정 게시글 기준)
    public List<BoardCommentDTO> getCommentsByPostId(int postId) {
        List<BoardCommentDTO> comments = new ArrayList<>();
        String sql = "SELECT comment_id, post_id, writer_no, content, created_at FROM board_comment WHERE post_id = ? ORDER BY created_at ASC";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, postId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardCommentDTO comment = new BoardCommentDTO();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setPostId(rs.getInt("post_id"));
                comment.setWriterNo(rs.getInt("writer_no"));
                comment.setContent(rs.getString("content"));
                comment.setCreatedAt(rs.getString("created_at"));
                comments.add(comment);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }

    // 3. 댓글 수정
    public boolean updateComment(BoardCommentDTO comment) {
        String sql = "UPDATE board_comment SET content = ? WHERE comment_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, comment.getContent());
            pstmt.setInt(2, comment.getCommentId());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. 댓글 삭제
    public boolean deleteComment(int commentId) {
        String sql = "DELETE FROM board_comment WHERE comment_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, commentId);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 5. 특정 댓글 조회
    public BoardCommentDTO getCommentById(int commentId) {
        String sql = "SELECT comment_id, post_id, writer_no, content, created_at FROM board_comment WHERE comment_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, commentId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                BoardCommentDTO comment = new BoardCommentDTO();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setPostId(rs.getInt("post_id"));
                comment.setWriterNo(rs.getInt("writer_no"));
                comment.setContent(rs.getString("content"));
                comment.setCreatedAt(rs.getString("created_at"));
                rs.close();
                return comment;
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
