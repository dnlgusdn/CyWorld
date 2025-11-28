package model;

import java.sql.*;
import common.JDBConnect;

public class UserSummaryDAO {

    // INSERT (처음 회원 가입 시 기본 summary 생성)
    public int insert(UserSummaryDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "INSERT INTO user_summary "
                   + "(member_no, total_active_seconds, total_likes_received, total_messages_sent, total_messages_received) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try {
            db.pstmt = db.conn.prepareStatement(sql);

            db.pstmt.setInt(1, dto.member_no);
            db.pstmt.setInt(2, dto.total_active_seconds);
            db.pstmt.setInt(3, dto.total_likes_received);
            db.pstmt.setInt(4, dto.total_messages_sent);
            db.pstmt.setInt(5, dto.total_messages_received);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // SELECT ONE (회원 summary 조회)
    public UserSummaryDTO selectOne(int member_no) {
        UserSummaryDTO dto = null;
        JDBConnect db = new JDBConnect();

        String sql = "SELECT * FROM user_summary WHERE member_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, member_no);
            db.rs = db.pstmt.executeQuery();

            if (db.rs.next()) {
                dto = new UserSummaryDTO();

                dto.member_no = db.rs.getInt("member_no");
                dto.total_active_seconds = db.rs.getInt("total_active_seconds");
                dto.total_likes_received = db.rs.getInt("total_likes_received");
                dto.total_messages_sent = db.rs.getInt("total_messages_sent");
                dto.total_messages_received = db.rs.getInt("total_messages_received");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return dto;
    }

    // UPDATE (summary 값 누적 갱신)
    public int update(UserSummaryDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "UPDATE user_summary SET "
                   + "total_active_seconds = ?, "
                   + "total_likes_received = ?, "
                   + "total_messages_sent = ?, "
                   + "total_messages_received = ? "
                   + "WHERE member_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);

            db.pstmt.setInt(1, dto.total_active_seconds);
            db.pstmt.setInt(2, dto.total_likes_received);
            db.pstmt.setInt(3, dto.total_messages_sent);
            db.pstmt.setInt(4, dto.total_messages_received);
            db.pstmt.setInt(5, dto.member_no);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // DELETE (테스트용)
    public int delete(int member_no) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "DELETE FROM user_summary WHERE member_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, member_no);
            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }
}
