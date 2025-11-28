package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {

    // 회원 추가
    public int insertMember(MemberDTO dto) {
        int result = 0;
        String sql = "INSERT INTO member(login_id, nickname, pw, email, phone, type) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getLogin_id());
            pstmt.setString(2, dto.getNickname());
            pstmt.setString(3, dto.getPw());
            pstmt.setString(4, dto.getEmail());
            pstmt.setString(5, dto.getPhone());
            pstmt.setString(6, dto.getType());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    // 한 명 조회 (member_no)
    public MemberDTO getMember(int member_no) {
        MemberDTO dto = null;
        String sql = "SELECT * FROM member WHERE member_no = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, member_no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new MemberDTO();
                dto.setMember_no(rs.getInt("member_no"));
                dto.setLogin_id(rs.getString("login_id"));
                dto.setNickname(rs.getString("nickname"));
                dto.setPw(rs.getString("pw"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                dto.setType(rs.getString("type"));
                dto.setJoin_date(rs.getString("join_date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dto;
    }

    // 전체 회원 목록
    public List<MemberDTO> getAllMembers() {
        List<MemberDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM member ORDER BY member_no DESC";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MemberDTO dto = new MemberDTO();

                dto.setMember_no(rs.getInt("member_no"));
                dto.setLogin_id(rs.getString("login_id"));
                dto.setNickname(rs.getString("nickname"));
                dto.setPw(rs.getString("pw"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                dto.setType(rs.getString("type"));
                dto.setJoin_date(rs.getString("join_date"));

                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // 회원 수정
    public int updateMember(MemberDTO dto) {
        int result = 0;
        String sql = "UPDATE member SET nickname=?, pw=?, email=?, phone=?, type=? WHERE member_no=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getNickname());
            pstmt.setString(2, dto.getPw());
            pstmt.setString(3, dto.getEmail());
            pstmt.setString(4, dto.getPhone());
            pstmt.setString(5, dto.getType());
            pstmt.setInt(6, dto.getMember_no());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    // 회원 삭제
    public int deleteMember(int member_no) {
        int result = 0;
        String sql = "DELETE FROM member WHERE member_no=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, member_no);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
