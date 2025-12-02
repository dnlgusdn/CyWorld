package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {

    // 회원 추가 (birth_date 필드 처리)
    public int insertMember(MemberDTO dto) {
        int result = 0;
        // ⭐ SQL 수정: birth_date 필드 추가
        String sql = "INSERT INTO member(login_id, nickname, pw, email, phone, birth_date, type) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getLogin_id());
            pstmt.setString(2, dto.getNickname());
            pstmt.setString(3, dto.getPw());
            pstmt.setString(4, dto.getEmail());
            pstmt.setString(5, dto.getPhone());
            pstmt.setString(6, dto.getBirth_date()); // ⭐ birth_date 바인딩
            pstmt.setString(7, dto.getType());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("회원가입 오류: " + e.getMessage());
            e.printStackTrace();
            if (e.getMessage().contains("Duplicate entry")) {
                System.err.println("중복된 아이디 또는 닉네임입니다.");
            }
        } finally {
            // PreparedStatement 자원 정리
            try {
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    // ⭐ 추가: 아이디 중복 확인 메서드
    public boolean checkIdDuplication(String login_id) {
        boolean isDuplicate = false;
        String sql = "SELECT COUNT(*) FROM member WHERE login_id = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, login_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1); 
                if (count > 0) {
                    isDuplicate = true; // 중복됨
                }
            }
        } catch (SQLException e) {
            System.err.println("아이디 중복 확인 중 DB 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // rs, pstmt 자원 해제
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isDuplicate;
    }

    // 로그인 처리 (birth_date 필드 포함)
    public MemberDTO login(String login_id, String pw) {
        MemberDTO dto = null;
        String sql = "SELECT * FROM member WHERE login_id = ? AND pw = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, login_id);
            pstmt.setString(2, pw);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new MemberDTO();
                dto.setMember_no(rs.getInt("member_no"));
                dto.setLogin_id(rs.getString("login_id"));
                dto.setNickname(rs.getString("nickname"));
                dto.setPw(rs.getString("pw"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                dto.setBirth_date(rs.getString("birth_date")); // ⭐ birth_date 추가
                dto.setType(rs.getString("type"));
                dto.setJoin_date(rs.getString("join_date"));
            }
        } catch (SQLException e) {
            System.err.println("로그인 처리 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return dto;
    }
    
    // 기타 DAO 메서드는 생략...
}