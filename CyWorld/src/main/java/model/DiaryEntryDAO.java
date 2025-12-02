package model;

import java.sql.*;
import java.util.ArrayList;

import common.JDBConnect;

public class DiaryEntryDAO extends JDBConnect {

    // INSERT
    public int insert(DiaryEntryDTO dto) {
        String sql = "INSERT INTO diary_entry (diary_id, entry_date, content, music_title, music_url, is_private) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, dto.getDiary_id());
            pstmt.setDate(2, dto.getEntry_date());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getMusic_title());
            pstmt.setString(5, dto.getMusic_url());
            pstmt.setBoolean(6, dto.isIs_private());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // UPDATE
    public int update(DiaryEntryDTO dto) {
        String sql = "UPDATE diary_entry SET entry_date=?, content=?, music_title=?, music_url=?, is_private=? "
                   + "WHERE entry_id=?";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setDate(1, dto.getEntry_date());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getMusic_title());
            pstmt.setString(4, dto.getMusic_url());
            pstmt.setBoolean(5, dto.isIs_private());
            pstmt.setInt(6, dto.getEntry_id());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // DELETE
    public int delete(int entry_id) {
        String sql = "DELETE FROM diary_entry WHERE entry_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, entry_id);

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // SELECT ONE
    public DiaryEntryDTO findById(int entry_id) {
        String sql = "SELECT * FROM diary_entry WHERE entry_id=?";
        DiaryEntryDTO dto = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, entry_id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new DiaryEntryDTO();

                dto.setEntry_id(rs.getInt("entry_id"));
                dto.setDiary_id(rs.getInt("diary_id"));
                dto.setEntry_date(rs.getDate("entry_date"));
                dto.setContent(rs.getString("content"));
                dto.setMusic_title(rs.getString("music_title"));
                dto.setMusic_url(rs.getString("music_url"));
                dto.setIs_private(rs.getBoolean("is_private"));
                dto.setCreated_at(rs.getTimestamp("created_at"));   // DTO에 맞게 수정됨
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return dto;
    }

    // SELECT ALL BY diary_id
    public ArrayList<DiaryEntryDTO> findByDiaryId(int diary_id) {
        String sql = "SELECT * FROM diary_entry WHERE diary_id=?";
        ArrayList<DiaryEntryDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, diary_id);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                DiaryEntryDTO dto = new DiaryEntryDTO();

                dto.setEntry_id(rs.getInt("entry_id"));
                dto.setDiary_id(rs.getInt("diary_id"));
                dto.setEntry_date(rs.getDate("entry_date"));
                dto.setContent(rs.getString("content"));
                dto.setMusic_title(rs.getString("music_title"));
                dto.setMusic_url(rs.getString("music_url"));
                dto.setIs_private(rs.getBoolean("is_private"));
                dto.setCreated_at(rs.getTimestamp("created_at"));   // DTO 기반 일치

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return list;
    }

    // SELECT ALL
    public ArrayList<DiaryEntryDTO> findAll() {
        String sql = "SELECT * FROM diary_entry ORDER BY entry_id DESC";
        ArrayList<DiaryEntryDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                DiaryEntryDTO dto = new DiaryEntryDTO();

                dto.setEntry_id(rs.getInt("entry_id"));
                dto.setDiary_id(rs.getInt("diary_id"));
                dto.setEntry_date(rs.getDate("entry_date"));
                dto.setContent(rs.getString("content"));
                dto.setMusic_title(rs.getString("music_title"));
                dto.setMusic_url(rs.getString("music_url"));
                dto.setIs_private(rs.getBoolean("is_private"));
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
