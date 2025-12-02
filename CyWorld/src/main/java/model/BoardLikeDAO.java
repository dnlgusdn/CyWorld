package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardLikeDAO {

    private Connection con;

    public BoardLikeDAO(Connection con) {
        this.con = con;
    }

    // 1. 좋아요 추가
    public boolean insertLike(BoardLikeDTO like) {
        String sql = "INSERT INTO board_like (post_id, member_no, liked_at) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, like.getPostId());
            pstmt.setInt(2, like.getMemberNo());
            pstmt.setString(3, like.getLikedAt());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. 좋아요 삭제
    public boolean deleteLike(int likeId) {
        String sql = "DELETE FROM board_like WHERE like_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, likeId);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 3. 특정 게시글의 좋아요 수 조회
    public int countLikesByPostId(int postId) {
        String sql = "SELECT COUNT(*) AS like_count FROM board_like WHERE post_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, postId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("like_count");
                rs.close();
                return count;
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 4. 특정 회원이 특정 게시글을 좋아요 했는지 확인
    public boolean isLikedByMember(int postId, int memberNo) {
        String sql = "SELECT 1 FROM board_like WHERE post_id = ? AND member_no = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, postId);
            pstmt.setInt(2, memberNo);
            ResultSet rs = pstmt.executeQuery();
            boolean exists = rs.next();
            rs.close();
            return exists;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 5. 회원 기준 좋아요 목록 조회
    public List<BoardLikeDTO> getLikesByMember(int memberNo) {
        List<BoardLikeDTO> likes = new ArrayList<>();
        String sql = "SELECT like_id, post_id, member_no, liked_at FROM board_like WHERE member_no = ? ORDER BY liked_at DESC";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, memberNo);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardLikeDTO like = new BoardLikeDTO();
                like.setLikeId(rs.getInt("like_id"));
                like.setPostId(rs.getInt("post_id"));
                like.setMemberNo(rs.getInt("member_no"));
                like.setLikedAt(rs.getString("liked_at"));
                likes.add(like);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return likes;
    }

    // 6. 특정 좋아요 조회
    public BoardLikeDTO getLikeById(int likeId) {
        String sql = "SELECT like_id, post_id, member_no, liked_at FROM board_like WHERE like_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, likeId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                BoardLikeDTO like = new BoardLikeDTO();
                like.setLikeId(rs.getInt("like_id"));
                like.setPostId(rs.getInt("post_id"));
                like.setMemberNo(rs.getInt("member_no"));
                like.setLikedAt(rs.getString("liked_at"));
                rs.close();
                return like;
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
