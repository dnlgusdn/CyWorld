package model;

import java.sql.*;
import java.util.ArrayList;

import common.JDBConnect;

public class BoardPostTagDAO extends JDBConnect {

    // INSERT
    public int insert(BoardPostTagDTO dto) {
        String sql = "INSERT INTO board_post_tag (post_id, tag_id) VALUES (?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, dto.getPost_id());
            pstmt.setInt(2, dto.getTag_id());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // DELETE BY ID
    public int delete(int id) {
        String sql = "DELETE FROM board_post_tag WHERE id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // DELETE ALL TAGS FOR A POST
    public int deleteByPost(int post_id) {
        String sql = "DELETE FROM board_post_tag WHERE post_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, post_id);

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // FIND ONE
    public BoardPostTagDTO findById(int id) {
        String sql = "SELECT * FROM board_post_tag WHERE id=?";
        BoardPostTagDTO dto = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new BoardPostTagDTO();
                dto.setId(rs.getInt("id"));
                dto.setPost_id(rs.getInt("post_id"));
                dto.setTag_id(rs.getInt("tag_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return dto;
    }

    // FIND TAGS FOR SPECIFIC POST
    public ArrayList<BoardPostTagDTO> findByPost(int post_id) {
        String sql = "SELECT * FROM board_post_tag WHERE post_id=?";
        ArrayList<BoardPostTagDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, post_id);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardPostTagDTO dto = new BoardPostTagDTO();

                dto.setId(rs.getInt("id"));
                dto.setPost_id(rs.getInt("post_id"));
                dto.setTag_id(rs.getInt("tag_id"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return list;
    }

    // FIND ALL
    public ArrayList<BoardPostTagDTO> findAll() {
        String sql = "SELECT * FROM board_post_tag";
        ArrayList<BoardPostTagDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                BoardPostTagDTO dto = new BoardPostTagDTO();

                dto.setId(rs.getInt("id"));
                dto.setPost_id(rs.getInt("post_id"));
                dto.setTag_id(rs.getInt("tag_id"));

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
