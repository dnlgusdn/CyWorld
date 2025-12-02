package model;

import java.sql.*;
import common.JDBConnect; // 사용자의 DB 연결 클래스 경로라고 가정

public class HomeProfileDAO extends JDBConnect {
    
    // 한 명의 프로필 조회 (HomeProfileDTO에 member_no로 조회)
    public HomeProfileDTO selectOne(int member_no) { 
        HomeProfileDTO dto = null;
        String sql = "SELECT * FROM home_profile WHERE member_no=?";

        try {
            // JDBConnect의 conn, pstmt, rs를 사용한다고 가정
            pstmt = conn.prepareStatement(sql); 
            pstmt.setInt(1, member_no);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                dto = new HomeProfileDTO();
                // DB 필드 설정
                dto.setProfile_id(rs.getInt("profile_id"));
                dto.setMember_no(rs.getInt("member_no"));
                dto.setProfile_image(rs.getString("profile_image"));
                dto.setBackground_image(rs.getString("background_image"));
                dto.setToday_is(rs.getString("today_is")); 
                dto.setHistory(rs.getString("history"));
                dto.setMiniroom_image(rs.getString("miniroom_image"));
                
                // ⭐ DB에 없는 필드에 기본값 설정 (JSP 오류 방지)
                dto.setTodayCount(0); 
                dto.setTotalCount(1); 
            } else {
                // ⭐ 프로필 정보가 DB에 없는 경우 (새 회원), 기본값 DTO를 생성하여 반환
                dto = new HomeProfileDTO();
                dto.setMember_no(member_no);
                dto.setProfile_image("../img/default_profile.jpg"); 
                dto.setMiniroom_image("../img/default_miniroom_background.png");
                dto.setToday_is("아직 설정된 오늘의 한마디가 없습니다.");
                dto.setTodayCount(0);
                dto.setTotalCount(1);
            }
        } catch (Exception e) {
            System.out.println("프로필 조회 중 오류 발생 (selectOne): " + e.getMessage());
            e.printStackTrace();
            return null;
        } finally {
            // 리소스 정리 로직 추가 (conn, pstmt, rs.close)
            close();
        }

        return dto;
    }
    // ... (insert, update 등 다른 메서드 생략)
}