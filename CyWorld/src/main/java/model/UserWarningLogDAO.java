package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class UserWarningLogDAO {

    // INSERT
    public int insert(UserWarningLogDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "INSERT INTO user_warning_log "
                   + "(member_no, warning_type, status, reason) "
                   + "VALUES (?, ?, ?, ?)";

        try {
            db.pstmt = db.conn.prepareStatement(sql);

            db.pstmt.setInt(1, dto.member_no);
            db.pstmt.setString(2, dto.warning_type);
            db.pstmt.setString(3, dto.status);
            db.pstmt.setString(4, dto.reason);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // SELECT ONE
    public UserWarningLogDTO selectOne(int log_no) {
        UserWarningLogDTO dto = null;
        JDBConnect db = new JDBConnect();

        String sql = "SELECT * FROM user_warning_log WHERE log_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, log_no);
            db.rs = db.pstmt.executeQuery();

            if (db.rs.next()) {
                dto = new UserWarningLogDTO();

                dto.log_no = db.rs.getInt("log_no");
                dto.member_no = db.rs.getInt("member_no");
                dto.warning_type = db.rs.getString("warning_type");
                dto.status = db.rs.getString("status");
                dto.reason = db.rs.getString("reason");
                dto.created_at = db.rs.getString("created_at");
                dto.updated_at = db.rs.getString("updated_at");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return dto;
    }

    // SELECT ALL (특정 회원의 경고 목록 조회)
    public List<UserWarningLogDTO> selectByMember(int member_no) {
        List<UserWarningLogDTO> list = new ArrayList<>();
        JDBConnect db = new JDBConnect();

        String sql = "SELECT * FROM user_warning_log "
                   + "WHERE member_no = ? "
                   + "ORDER BY log_no DESC";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, member_no);
            db.rs = db.pstmt.executeQuery();

            while (db.rs.next()) {
                UserWarningLogDTO dto = new UserWarningLogDTO();

                dto.log_no = db.rs.getInt("log_no");
                dto.member_no = db.rs.getInt("member_no");
                dto.warning_type = db.rs.getString("warning_type");
                dto.status = db.rs.getString("status");
                dto.reason = db.rs.getString("reason");
                dto.created_at = db.rs.getString("created_at");
                dto.updated_at = db.rs.getString("updated_at");

                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return list;
    }

    // SELECT ALL (전체 로그 조회)
    public List<UserWarningLogDTO> selectAll() {
        List<UserWarningLogDTO> list = new ArrayList<>();
        JDBConnect db = new JDBConnect();

        String sql = "SELECT * FROM user_warning_log ORDER BY log_no DESC";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.rs = db.pstmt.executeQuery();

            while (db.rs.next()) {
                UserWarningLogDTO dto = new UserWarningLogDTO();

                dto.log_no = db.rs.getInt("log_no");
                dto.member_no = db.rs.getInt("member_no");
                dto.warning_type = db.rs.getString("warning_type");
                dto.status = db.rs.getString("status");
                dto.reason = db.rs.getString("reason");
                dto.created_at = db.rs.getString("created_at");
                dto.updated_at = db.rs.getString("updated_at");

                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return list;
    }

    // UPDATE (상태 변경, 업데이트 시간 자동 반영)
    public int updateStatus(int log_no, String newStatus) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "UPDATE user_warning_log "
                   + "SET status = ?, updated_at = NOW() "
                   + "WHERE log_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setString(1, newStatus);
            db.pstmt.setInt(2, log_no);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // DELETE
    public int delete(int log_no) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "DELETE FROM user_warning_log WHERE log_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, log_no);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }
}
