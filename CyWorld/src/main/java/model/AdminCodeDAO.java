package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class AdminCodeDAO {

    // INSERT
    public int insert(AdminCodeDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();
        String sql = "INSERT INTO admin_code(code) VALUES (?)";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setString(1, dto.code);
            result = db.pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }
        return result;
    }

    // SELECT ONE by code
    public AdminCodeDTO selectByCode(String code) {
        AdminCodeDTO dto = null;
        JDBConnect db = new JDBConnect();
        String sql = "SELECT * FROM admin_code WHERE code = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setString(1, code);
            db.rs = db.pstmt.executeQuery();

            if (db.rs.next()) {
                dto = new AdminCodeDTO();
                dto.code_no = db.rs.getInt("code_no");
                dto.code = db.rs.getString("code");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return dto;
    }

    // SELECT ONE by code_no
    public AdminCodeDTO selectOne(int code_no) {
        AdminCodeDTO dto = null;
        JDBConnect db = new JDBConnect();
        String sql = "SELECT * FROM admin_code WHERE code_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, code_no);
            db.rs = db.pstmt.executeQuery();

            if (db.rs.next()) {
                dto = new AdminCodeDTO();
                dto.code_no = db.rs.getInt("code_no");
                dto.code = db.rs.getString("code");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return dto;
    }

    // SELECT ALL
    public List<AdminCodeDTO> selectAll() {
        List<AdminCodeDTO> list = new ArrayList<>();
        JDBConnect db = new JDBConnect();
        String sql = "SELECT * FROM admin_code ORDER BY code_no DESC";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.rs = db.pstmt.executeQuery();

            while (db.rs.next()) {
                AdminCodeDTO dto = new AdminCodeDTO();
                dto.code_no = db.rs.getInt("code_no");
                dto.code = db.rs.getString("code");

                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return list;
    }

    // UPDATE
    public int update(AdminCodeDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();
        String sql = "UPDATE admin_code SET code = ? WHERE code_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setString(1, dto.code);
            db.pstmt.setInt(2, dto.code_no);
            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // DELETE
    public int delete(int code_no) {
        int result = 0;
        JDBConnect db = new JDBConnect();
        String sql = "DELETE FROM admin_code WHERE code_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, code_no);
            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // Validate code
    public boolean validateCode(String code) {
        AdminCodeDTO dto = selectByCode(code);
        return dto != null;
    }
}
