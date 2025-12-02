package model;

import java.sql.*;
import java.util.ArrayList;

import common.JDBConnect;

public class MyPlayListDAO extends JDBConnect {

    // INSERT
    public int insert(MyPlayListDTO dto) {
        String sql = "INSERT INTO my_playlist (music_id, member_no, title, artlist, music_url) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, dto.getMusic_id());
            pstmt.setInt(2, dto.getMember_no());
            pstmt.setString(3, dto.getTitle());
            pstmt.setString(4, dto.getArtlist());
            pstmt.setString(5, dto.getMusic_url());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    // UPDATE
    public int update(MyPlayListDTO dto) {
        String sql = "UPDATE my_playlist "
                   + "SET title=?, artlist=?, music_url=? "
                   + "WHERE music_id=? AND member_no=?";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getArtlist());
            pstmt.setString(3, dto.getMusic_url());
            pstmt.setInt(4, dto.getMusic_id());
            pstmt.setInt(5, dto.getMember_no());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // DELETE
    public int delete(int music_id, int member_no) {
        String sql = "DELETE FROM my_playlist WHERE music_id=? AND member_no=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, music_id);
            pstmt.setInt(2, member_no);

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // SELECT ONE
    public MyPlayListDTO findById(int music_id, int member_no) {
        String sql = "SELECT * FROM my_playlist WHERE music_id=? AND member_no=?";
        MyPlayListDTO dto = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, music_id);
            pstmt.setInt(2, member_no);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new MyPlayListDTO();
                dto.setMusic_id(rs.getInt("music_id"));
                dto.setMember_no(rs.getInt("member_no"));
                dto.setTitle(rs.getString("title"));
                dto.setArtlist(rs.getString("artlist"));
                dto.setMusic_url(rs.getString("music_url"));
                dto.setCreated_at(rs.getTimestamp("created_at"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return dto;
    }

    // SELECT ALL (특정 회원 플레이리스트)
    public ArrayList<MyPlayListDTO> findByMember(int member_no) {
        String sql = "SELECT * FROM my_playlist WHERE member_no=?";
        ArrayList<MyPlayListDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, member_no);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                MyPlayListDTO dto = new MyPlayListDTO();
                dto.setMusic_id(rs.getInt("music_id"));
                dto.setMember_no(rs.getInt("member_no"));
                dto.setTitle(rs.getString("title"));
                dto.setArtlist(rs.getString("artlist"));
                dto.setMusic_url(rs.getString("music_url"));
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

    // SELECT ALL (전체 플레이리스트)
    public ArrayList<MyPlayListDTO> findAll() {
        String sql = "SELECT * FROM my_playlist";
        ArrayList<MyPlayListDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MyPlayListDTO dto = new MyPlayListDTO();
                dto.setMusic_id(rs.getInt("music_id"));
                dto.setMember_no(rs.getInt("member_no"));
                dto.setTitle(rs.getString("title"));
                dto.setArtlist(rs.getString("artlist"));
                dto.setMusic_url(rs.getString("music_url"));
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
