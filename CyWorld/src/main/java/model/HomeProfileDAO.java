package model;

import java.sql.*;
import java.util.ArrayList;

import common.JDBConnect;
import model.HomeProfileDTO;

public class HomeProfileDAO extends JDBConnect {

    public int insert(HomeProfileDTO dto) {
        String sql = "INSERT INTO home_profile (member_no, profile_image, background_image) VALUES (?, ?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, dto.getMember_no());
            pstmt.setString(2, dto.getProfile_image());
            pstmt.setString(3, dto.getBackground_image());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    public int update(HomeProfileDTO dto) {
        String sql = "UPDATE home_profile SET profile_image=?, background_image=? WHERE member_no=?";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getProfile_image());
            pstmt.setString(2, dto.getBackground_image());
            pstmt.setInt(3, dto.getMember_no());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    public int delete(int member_no) {
        String sql = "DELETE FROM home_profile WHERE member_no=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, member_no);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    public HomeProfileDTO findById(int member_no) {
        String sql = "SELECT * FROM home_profile WHERE member_no=?";
        HomeProfileDTO dto = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, member_no);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto = new HomeProfileDTO();
                dto.setMember_no(rs.getInt("member_no"));
                dto.setProfile_image(rs.getString("profile_image"));
                dto.setBackground_image(rs.getString("background_image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return dto;
    }

    public ArrayList<HomeProfileDTO> findAll() {
        String sql = "SELECT * FROM home_profile";
        ArrayList<HomeProfileDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                HomeProfileDTO dto = new HomeProfileDTO();
                dto.setMember_no(rs.getInt("member_no"));
                dto.setProfile_image(rs.getString("profile_image"));
                dto.setBackground_image(rs.getString("background_image"));
                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return list;
    }
}