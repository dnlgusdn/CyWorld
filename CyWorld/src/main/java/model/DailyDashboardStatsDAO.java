package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class DailyDashboardStatsDAO {

    // INSERT (하루 기록 추가)
    public int insert(DailyDashboardStatsDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "INSERT INTO daily_dashboard_stats "
                   + "(stat_date, visitors_today, new_users_today, posts_today, pending_reports, completed_perm_bans, completed_reports) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            db.pstmt = db.conn.prepareStatement(sql);

            db.pstmt.setString(1, dto.stat_date);
            db.pstmt.setInt(2, dto.visitors_today);
            db.pstmt.setInt(3, dto.new_users_today);
            db.pstmt.setInt(4, dto.posts_today);
            db.pstmt.setInt(5, dto.pending_reports);
            db.pstmt.setInt(6, dto.completed_perm_bans);
            db.pstmt.setInt(7, dto.completed_reports);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // SELECT ONE (해당 날짜의 통계 가져오기)
    public DailyDashboardStatsDTO selectOne(String stat_date) {
        DailyDashboardStatsDTO dto = null;
        JDBConnect db = new JDBConnect();

        String sql = "SELECT * FROM daily_dashboard_stats WHERE stat_date = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setString(1, stat_date);
            db.rs = db.pstmt.executeQuery();

            if (db.rs.next()) {
                dto = new DailyDashboardStatsDTO();

                dto.stat_date = db.rs.getString("stat_date");
                dto.visitors_today = db.rs.getInt("visitors_today");
                dto.new_users_today = db.rs.getInt("new_users_today");
                dto.posts_today = db.rs.getInt("posts_today");
                dto.pending_reports = db.rs.getInt("pending_reports");
                dto.completed_perm_bans = db.rs.getInt("completed_perm_bans");
                dto.completed_reports = db.rs.getInt("completed_reports");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return dto;
    }

    // SELECT ALL (전체 날짜 통계)
    public List<DailyDashboardStatsDTO> selectAll() {
        List<DailyDashboardStatsDTO> list = new ArrayList<>();
        JDBConnect db = new JDBConnect();

        String sql = "SELECT * FROM daily_dashboard_stats ORDER BY stat_date DESC";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.rs = db.pstmt.executeQuery();

            while (db.rs.next()) {
                DailyDashboardStatsDTO dto = new DailyDashboardStatsDTO();

                dto.stat_date = db.rs.getString("stat_date");
                dto.visitors_today = db.rs.getInt("visitors_today");
                dto.new_users_today = db.rs.getInt("new_users_today");
                dto.posts_today = db.rs.getInt("posts_today");
                dto.pending_reports = db.rs.getInt("pending_reports");
                dto.completed_perm_bans = db.rs.getInt("completed_perm_bans");
                dto.completed_reports = db.rs.getInt("completed_reports");

                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return list;
    }

    // UPDATE (날짜 기준 업데이트)
    public int update(DailyDashboardStatsDTO dto) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "UPDATE daily_dashboard_stats SET "
                   + "visitors_today=?, new_users_today=?, posts_today=?, pending_reports=?, "
                   + "completed_perm_bans=?, completed_reports=? "
                   + "WHERE stat_date=?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);

            db.pstmt.setInt(1, dto.visitors_today);
            db.pstmt.setInt(2, dto.new_users_today);
            db.pstmt.setInt(3, dto.posts_today);
            db.pstmt.setInt(4, dto.pending_reports);
            db.pstmt.setInt(5, dto.completed_perm_bans);
            db.pstmt.setInt(6, dto.completed_reports);
            db.pstmt.setString(7, dto.stat_date);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // DELETE
    public int delete(String stat_date) {
        int result = 0;
        JDBConnect db = new JDBConnect();

        String sql = "DELETE FROM daily_dashboard_stats WHERE stat_date = ?";

        try {
            db.pstmt = db.conn.prepareStatement(sql);
            db.pstmt.setString(1, stat_date);

            result = db.pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBConnect.close(db.conn, db.pstmt, db.rs);
        }

        return result;
    }

    // Get today's stats
    public DailyDashboardStatsDTO getTodayStats() {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        String today = sdf.format(new java.util.Date());
        return selectOne(today);
    }
}
