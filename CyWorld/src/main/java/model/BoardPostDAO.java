package model;

import java.sql.*;
import java.util.ArrayList;

import common.JDBConnect;

public class BoardPostDAO extends JDBConnect {

    // INSERT
    public int insert(BoardPostDTO dto) {
        String sql = "INSERT INTO board_post (owner_no, writer_no, title, content, is_private) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, dto.getOwner_no());
            pstmt.setInt(2, dto.getWriter_no());
            pstmt.setString(3, dto.getTitle());
            pstmt.setString(4, dto.getContent());
            pstmt.setBoolean(5, dto.isIs_private());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // UPDATE
    public int update(BoardPostDTO dto) {
        String sql = "UPDATE board_post "
                   + "SET title=?, content=?, is_private=? "
                   + "WHERE post_id=?";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setBoolean(3, dto.isIs_private());
            pstmt.setInt(4, dto.getPost_id());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return 0;
    }

    // DELETE
    public int delete(int post_id) {
        String sql = "DELETE FROM board_post WHERE post_id=?";

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

    // SELECT ONE
    public BoardPostDTO findById(int post_id) {
        String sql = "SELECT * FROM board_post WHERE post_id=?";
        BoardPostDTO dto = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, post_id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new BoardPostDTO();

                dto.setPost_id(rs.getInt("post_id"));
                dto.setOwner_no(rs.getInt("owner_no"));
                dto.setWriter_no(rs.getInt("writer_no"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setIs_private(rs.getBoolean("is_private"));
                dto.setLikes_count(rs.getInt("likes_count"));
                dto.setCreated_at(rs.getTimestamp("created_at"));
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return dto;
    }

    // 특정 회원 홈에 작성된 모든 게시물(owner_no로 조회)
    public ArrayList<BoardPostDTO> findByOwner(int owner_no) {
        String sql = "SELECT * FROM board_post WHERE owner_no=?";
        ArrayList<BoardPostDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, owner_no);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardPostDTO dto = new BoardPostDTO();

                dto.setPost_id(rs.getInt("post_id"));
                dto.setOwner_no(rs.getInt("owner_no"));
                dto.setWriter_no(rs.getInt("writer_no"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setIs_private(rs.getBoolean("is_private"));
                dto.setLikes_count(rs.getInt("likes_count"));
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

    // 전체 게시물 조회
    public ArrayList<BoardPostDTO> findAll() {
        String sql = "SELECT * FROM board_post";
        ArrayList<BoardPostDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                BoardPostDTO dto = new BoardPostDTO();

                dto.setPost_id(rs.getInt("post_id"));
                dto.setOwner_no(rs.getInt("owner_no"));
                dto.setWriter_no(rs.getInt("writer_no"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setIs_private(rs.getBoolean("is_private"));
                dto.setLikes_count(rs.getInt("likes_count"));
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
