package model;

import java.sql.*;
import java.util.ArrayList;

import common.JDBConnect;

public class BoardTagDAO extends JDBConnect {

    // INSERT
    public int insert(BoardTagDTO dto) {
        String sql = "INSERT INTO board_tag (tag_name) VALUES (?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getTag_name());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    // UPDATE
    public int update(BoardTagDTO dto) {
        String sql = "UPDATE board_tag SET tag_name=? WHERE tag_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getTag_name());
            pstmt.setInt(2, dto.getTag_id());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    // DELETE
    public int delete(int tag_id) {
        String sql = "DELETE FROM board_tag WHERE tag_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, tag_id);

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }
        return 0;
    }

    // FIND ONE
    public BoardTagDTO findById(int tag_id) {
        String sql = "SELECT * FROM board_tag WHERE tag_id=?";
        BoardTagDTO dto = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, tag_id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new BoardTagDTO();
                dto.setTag_id(rs.getInt("tag_id"));
                dto.setTag_name(rs.getString("tag_name"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(conn, pstmt, rs);
        }

        return dto;
    }

    // FIND ALL
    public ArrayList<BoardTagDTO> findAll() {
        String sql = "SELECT * FROM board_tag";
        ArrayList<BoardTagDTO> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardTagDTO dto = new BoardTagDTO();
                dto.setTag_id(rs.getInt("tag_id"));
                dto.setTag_name(rs.getString("tag_name"));

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
