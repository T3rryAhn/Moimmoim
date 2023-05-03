package moimmoimProject;

import java.sql.*;

public class DBtest {

    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String dbUrl = "jdbc:oracle:thin:@118.67.133.136:1521:XE";
        DBtest db = new DBtest();
        db.input(dbUrl);
        db.list(dbUrl);
    }

    public void input(String dbUrl){
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DriverManager.getConnection(dbUrl, "scott", "tiger");
            pstmt = con.prepareStatement("INSERT INTO practice VALUES(?,?)");

            pstmt.setInt(1, 9);
            pstmt.setString(2, "완투");

            pstmt.executeUpdate();

        } catch (SQLException e) {

        } finally {

            try {
                pstmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void list(String dbUrl){
        ResultSet rs = null;
        Connection con = null;
        Statement stmt = null;

        try {
            con = DriverManager.getConnection(dbUrl, "scott", "tiger");
            stmt = con.createStatement();

            rs = stmt.executeQuery("SELECT * FROM practice");

            while(rs.next()) {
                System.out.println(rs.getInt(1));
                System.out.println(rs.getString(2));
            }
        } catch (SQLException e) {

        } finally {

            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}

