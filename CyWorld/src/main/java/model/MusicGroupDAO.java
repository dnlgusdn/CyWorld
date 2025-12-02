package model;

import java.sql.*;
import java.util.ArrayList;

import common.JDBConnect;

public class MusicGroupDAO extends JDBConnect {

    // INSERT
    public int insert(MusicGroupDTO dto) {
        String sql = "INSERT INTO music_group (member_no, group_name) VALUES (?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, dto.getMember_no());
            pstmt.setString(2, dto.getGroup_name());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    // UPDATE
    public int update(MusicGroupDTO dto) {
        String sql = "UPDATE music_group SET group_name=? WHERE group_id=?";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getGroup_name());
            pstmt.setInt(2, dto.getGroup_id());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    // DELETE
    public int delete(int group_id) {
        String sql = "DELETE FROM music_group WHERE group_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, group_id);

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    // SELECT ONE
    public MusicGroupDTO findById(int group_id) {
        String sql = "SELECT * FROM music_group WHERE group_id=?";
        MusicGroupDTO dto = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, group_id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new MusicGroupDTO();
                dto.setGroup_id(rs.getInt("group_id"));
                dto.setMember_no(rs.getInt("member_no"));
                dto.setGroup_name(rs.getString("group_name"));
                dto.setCreated_at(rs.getTimestamp("created_at"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return dto;
    }

    // 특정 회원의 그룹 목록
    public ArrayList<MusicGroupDTO> findByMember(int member_no) {
        String sql = "SELECT * FROM music_group WHERE member_no=?";
        ArrayList<MusicGroupDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, member_no);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                MusicGroupDTO dto = new MusicGroupDTO();
                dto.setGroup_id(rs.getInt("group_id"));
                dto.setMember_no(rs.getInt("member_no"));
                dto.setGroup_name(rs.getString("group_name"));
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

    // 전체 조회
    public ArrayList<MusicGroupDTO> findAll() {
        String sql = "SELECT * FROM music_group";
        ArrayList<MusicGroupDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MusicGroupDTO dto = new MusicGroupDTO();
                dto.setGroup_id(rs.getInt("group_id"));
                dto.setMember_no(rs.getInt("member_no"));
                dto.setGroup_name(rs.getString("group_name"));
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
