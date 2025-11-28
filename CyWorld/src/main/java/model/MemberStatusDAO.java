package model;

import java.sql.*;
import common.JDBConnect;

public class MemberStatusDAO {

    // INSERT (회원 제재 정보 신규 생성)
    public int insert(MemberStatusDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "INSERT INTO member_status "
                   + "(member_no, is_perm_banned, is_temp_banned, temp_ban_end, board_write_ban, message_ban) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            db.pstmt = db.conn.prepareStatement(sql);

            db.pstmt.setInt(1, dto.member_no);
            db.pstmt.setBoolean(2, dto.is_perm_banned);
            db.pstmt.setBoolean(3, dto.is_temp_banned);
            db.pstmt.setString(4, dto.temp_ban_end);
            db.pstmt.setBoolean(5, dto.board_write_ban);
            db.pstmt.setBoolean(6, dto.message_ban);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // SELECT ONE (member_no 기준으로 조회)
    public MemberStatusDTO selectOne(int member_no) {
        MemberStatusDTO dto = null;
        JDBConnect db = new JDBConnect();

        String sql = "SELECT * FROM member_status WHERE member_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, member_no);
            db.rs = db.pstmt.executeQuery();

            if (db.rs.next()) {
                dto = new MemberStatusDTO();

                dto.member_no = db.rs.getInt("member_no");
                dto.is_perm_banned = db.rs.getBoolean("is_perm_banned");
                dto.is_temp_banned = db.rs.getBoolean("is_temp_banned");

                // DATE → String
                dto.temp_ban_end = db.rs.getString("temp_ban_end");

                dto.board_write_ban = db.rs.getBoolean("board_write_ban");
                dto.message_ban = db.rs.getBoolean("message_ban");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return dto;
    }

    // UPDATE (회원 상태 변경)
    public int update(MemberStatusDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "UPDATE member_status SET "
                   + "is_perm_banned=?, is_temp_banned=?, temp_ban_end=?, "
                   + "board_write_ban=?, message_ban=? "
                   + "WHERE member_no=?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);

            db.pstmt.setBoolean(1, dto.is_perm_banned);
            db.pstmt.setBoolean(2, dto.is_temp_banned);
            db.pstmt.setString(3, dto.temp_ban_end);
            db.pstmt.setBoolean(4, dto.board_write_ban);
            db.pstmt.setBoolean(5, dto.message_ban);
            db.pstmt.setInt(6, dto.member_no);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // DELETE (주로 테스트용)
    public int delete(int member_no) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "DELETE FROM member_status WHERE member_no = ?";

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
