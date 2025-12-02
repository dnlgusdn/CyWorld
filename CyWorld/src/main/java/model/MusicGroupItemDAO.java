package model;

import java.sql.*;
import java.util.ArrayList;

import common.JDBConnect;

public class MusicGroupItemDAO extends JDBConnect {

    // INSERT
    public int insert(MusicGroupItemDTO dto) {
        String sql = "INSERT INTO music_group_item (group_id, music_id) VALUES (?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, dto.getGroup_id());
            pstmt.setInt(2, dto.getMusic_id());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // DELETE
    public int delete(int group_item_id) {
        String sql = "DELETE FROM music_group_item WHERE group_item_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, group_item_id);

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // SELECT ONE
    public MusicGroupItemDTO findById(int group_item_id) {
        String sql = "SELECT * FROM music_group_item WHERE group_item_id=?";
        MusicGroupItemDTO dto = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, group_item_id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new MusicGroupItemDTO();
                dto.setGroup_item_id(rs.getInt("group_item_id"));
                dto.setGroup_id(rs.getInt("group_id"));
                dto.setMusic_id(rs.getInt("music_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return dto;
    }

    // 특정 그룹에 속한 음악 리스트
    public ArrayList<MusicGroupItemDTO> findByGroup(int group_id) {
        String sql = "SELECT * FROM music_group_item WHERE group_id=?";
        ArrayList<MusicGroupItemDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, group_id);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                MusicGroupItemDTO dto = new MusicGroupItemDTO();
                dto.setGroup_item_id(rs.getInt("group_item_id"));
                dto.setGroup_id(rs.getInt("group_id"));
                dto.setMusic_id(rs.getInt("music_id"));
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
    public ArrayList<MusicGroupItemDTO> findAll() {
        String sql = "SELECT * FROM music_group_item";
        ArrayList<MusicGroupItemDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                MusicGroupItemDTO dto = new MusicGroupItemDTO();
                dto.setGroup_item_id(rs.getInt("group_item_id"));
                dto.setGroup_id(rs.getInt("group_id"));
                dto.setMusic_id(rs.getInt("music_id"));
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
