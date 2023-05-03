package moimmoimProject.repository;


import lombok.extern.slf4j.Slf4j;
import moimmoimProject.domain.moimDomain.Moim;
import org.springframework.jdbc.datasource.DataSourceUtils;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class JdbcMoimRepository implements MoimRepository {

    private final DataSource dataSource;

    public JdbcMoimRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE";

    @Override
    public Moim newMoim(Moim moim){
        String sql = "insert into moim_post values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setLong(1, moim.getMoim_num());
            pstmt.setLong(2, moim.getUser_num()  );
            pstmt.setString(3, moim.getMoim_title());
            pstmt.setString(4, moim.getMoim_main());
            pstmt.setString(5, moim.getMoim_pictures());
            pstmt.setDate(6, (Date)moim.getMoim_create_date());
            pstmt.setInt(7, moim.getMoim_views());
            pstmt.setInt(8, moim.getCategory_num());
            pstmt.setDate(9, (Date)moim.getMoim_start_time());
            pstmt.setDate(10, (Date)moim.getMoim_end_time());
            pstmt.setInt(11, moim.getMoim_member_count());
            pstmt.setInt(12, moim.getMoim_member_max());
            pstmt.setInt(13, moim.getMoim_price());
            pstmt.setDate(14, (Date)moim.getMoim_date_join());
            pstmt.setDate(15, (Date)moim.getMoim_deadline());
            pstmt.setBoolean(16, moim.getMoim_dead_check());
            pstmt.setInt(17, moim.getLocation_num());

            pstmt.executeUpdate();
            return moim;

        } catch (Exception e) {
            throw new IllegalStateException(e);
        } finally {
            try {
                rs.close();
                pstmt.close();
                close(conn);
            } catch(Exception e){
                e.printStackTrace();
            }
        }
    }


    @Override
    public Moim getMoim(long moim_num){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Moim moim = new Moim();
        try {
            String sql = "SELECT * FROM moim_post where moim_num = ?";
            conn = getConnection();

            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, moim_num);

            while (rs.next()) {
                moim.setMoim_num(rs.getLong(1));
                moim.setUser_num(rs.getInt(2));
                moim.setMoim_title(rs.getString(3));
                moim.setMoim_main(rs.getString(4));
                moim.setMoim_pictures(rs.getString(5));
                moim.setMoim_create_date(rs.getDate(6));
                moim.setMoim_views(rs.getInt(7));
                moim.setCategory_num(rs.getInt(8));
                moim.setMoim_start_time(rs.getDate(9));
                moim.setMoim_end_time(rs.getDate(10));
                moim.setMoim_member_count(rs.getInt(11));
                moim.setMoim_member_max(rs.getInt(12));
                moim.setMoim_price(rs.getInt(13));
                moim.setMoim_date_join(rs.getDate(14));
                moim.setMoim_deadline(rs.getDate(15));
                moim.setMoim_dead_check(rs.getBoolean(16));
                moim.setLocation_num(rs.getInt(17));

            }
        } catch (SQLException e) {
            log.error("db error", e);
        } finally {
            try {
                rs.close();
                pstmt.close();
                close(conn);
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        return moim;
    }


    @Override
    public Moim update(Moim moim) {
        String sql = "UPDATE moim_post SET ? WHERE moim_num = ?";
        return null;
    }

    @Override
    public Long delete(Long moim_num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "DELETE FROM moim_post WHERE moim_num = ?";
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, moim_num);

            pstmt.executeUpdate();
            rs = pstmt.getGeneratedKeys();

        } catch (SQLException e) {
            log.error("db error", e);
        } finally {
            try {
                rs.close();
                pstmt.close();
                close(conn);
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        return moim_num;
    }

    public List<Moim> findAll(){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        List<Moim> moimList = new ArrayList<>();
        try {
            conn = getConnection();
            stmt = conn.createStatement();

            rs = stmt.executeQuery("SELECT * FROM moim_post");

            while (rs.next()) {
                Moim moim = new Moim();
                moim.setMoim_num(rs.getLong(1));
                moim.setUser_num(rs.getInt(2));
                moim.setMoim_title(rs.getString(3));
                moim.setMoim_main(rs.getString(4));
                moim.setMoim_pictures(rs.getString(5));
                moim.setMoim_create_date(rs.getDate(6));
                moim.setMoim_views(rs.getInt(7));
                moim.setCategory_num(rs.getInt(8));
                moim.setMoim_start_time(rs.getDate(9));
                moim.setMoim_end_time(rs.getDate(10));
                moim.setMoim_member_count(rs.getInt(11));
                moim.setMoim_member_max(rs.getInt(12));
                moim.setMoim_price(rs.getInt(13));
                moim.setMoim_date_join(rs.getDate(14));
                moim.setMoim_deadline(rs.getDate(15));
                moim.setMoim_dead_check(rs.getBoolean(16));
                moim.setLocation_num(rs.getInt(17));

                moimList.add(moim);
            }
        } catch (SQLException e) {
            log.error("db error", e);
        } finally {
            try {
                rs.close();
                stmt.close();
                close(conn);
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        return moimList;
    }

    private Connection getConnection(){
        return DataSourceUtils.getConnection(dataSource);
    }

    private void close(Connection conn) throws SQLException{
        DataSourceUtils.releaseConnection(conn,dataSource);
    }

}

