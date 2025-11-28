package common;

import java.sql.*;

public class JDBConnect {

    public Connection conn;
    public PreparedStatement pstmt;
    public ResultSet rs;

    public JDBConnect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/jspdb",
                "root",
                "dongyang"
            );
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
        try {
            con.close();
            pstmt.close();
            rs.close();
        } catch (SQLException e) {
            // TODO: handle exception
        }
    }
}
