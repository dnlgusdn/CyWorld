package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class AdminDAO {

    // INSERT
    public int insert(AdminDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "INSERT INTO admin(member_no, admin_level) VALUES (?, ?)";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, dto.member_no);
            db.pstmt.setInt(2, dto.admin_level);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // SELECT ONE (admin_no)
    public AdminDTO selectOne(int admin_no) {
        AdminDTO dto = null;
        JDBConnect db = new JDBConnect();

        String sql = "SELECT * FROM admin WHERE admin_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, admin_no);
            db.rs = db.pstmt.executeQuery();

            if (db.rs.next()) {
                dto = new AdminDTO();
                dto.admin_no = db.rs.getInt("admin_no");
                dto.member_no = db.rs.getInt("member_no");
                dto.admin_level = db.rs.getInt("admin_level");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return dto;
    }

    // SELECT by member_no
    public AdminDTO selectByMember(int member_no) {
        AdminDTO dto = null;
        JDBConnect db = new JDBConnect();

        String sql = "SELECT * FROM admin WHERE member_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, member_no);
            db.rs = db.pstmt.executeQuery();

            if (db.rs.next()) {
                dto = new AdminDTO();
                dto.admin_no = db.rs.getInt("admin_no");
                dto.member_no = db.rs.getInt("member_no");
                dto.admin_level = db.rs.getInt("admin_level");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return dto;
    }

    // SELECT ALL
    public List<AdminDTO> selectAll() {
        List<AdminDTO> list = new ArrayList<>();
        JDBConnect db = new JDBConnect();

        String sql = "SELECT * FROM admin ORDER BY admin_no DESC";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.rs = db.pstmt.executeQuery();

            while (db.rs.next()) {
                AdminDTO dto = new AdminDTO();
                dto.admin_no = db.rs.getInt("admin_no");
                dto.member_no = db.rs.getInt("member_no");
                dto.admin_level = db.rs.getInt("admin_level");

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
    public int update(AdminDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "UPDATE admin SET admin_level = ? WHERE admin_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, dto.admin_level);
            db.pstmt.setInt(2, dto.admin_no);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }
        return result;
    }

    // DELETE
    public int delete(int admin_no) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "DELETE FROM admin WHERE admin_no = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setInt(1, admin_no);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }
}
