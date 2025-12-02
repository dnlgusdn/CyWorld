package model;

import java.sql.*;
import java.util.ArrayList;
import common.JDBConnect;

public class DiaryDAO extends JDBConnect {

    public int insert(DiaryDTO dto) {
        String sql = "INSERT INTO diary (member_no, diary_name) VALUES (?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getMember_no());
            pstmt.setString(2, dto.getDiary_name());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    public int update(DiaryDTO dto) {
        String sql = "UPDATE diary SET diary_name=? WHERE diary_id=?";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getDiary_name());
            pstmt.setInt(2, dto.getDiary_id());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    public int delete(int diary_id) {
        String sql = "DELETE FROM diary WHERE diary_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, diary_id);

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    public DiaryDTO findById(int diary_id) {
        String sql = "SELECT * FROM diary WHERE diary_id=?";
        DiaryDTO dto = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, diary_id);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto = new DiaryDTO();
                dto.setDiary_id(rs.getInt("diary_id"));
                dto.setMember_no(rs.getString("member_no"));
                dto.setDiary_name(rs.getString("diary_name"));
                dto.setCreated_at(rs.getTimestamp("created_at"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return dto;
    }

    public ArrayList<DiaryDTO> findAll() {
        String sql = "SELECT * FROM diary";
        ArrayList<DiaryDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                DiaryDTO dto = new DiaryDTO();

                dto.setDiary_id(rs.getInt("diary_id"));
                dto.setMember_no(rs.getString("member_no"));
                dto.setDiary_name(rs.getString("diary_name"));
                dto.setCreated_at(rs.getTimestamp("created_at"));

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