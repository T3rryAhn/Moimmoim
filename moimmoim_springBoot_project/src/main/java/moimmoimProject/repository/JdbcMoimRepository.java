package moimmoimProject.repository;


import lombok.extern.slf4j.Slf4j;
import moimmoimProject.domain.moimDomain.MoimDo;
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
    public MoimDo newMoim(MoimDo moimDo){
        String sql = "insert into moim_post values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setLong(1, moimDo.getMoimNum());
            pstmt.setLong(2, moimDo.getMoimHostUserIdNum()  );
            pstmt.setString(3, moimDo.getMoimTitle());
            pstmt.setString(4, moimDo.getMoimMainContent());
            pstmt.setString(5, moimDo.getMoimImage());
            pstmt.setDate(6, moimDo.getMoimCreateDate());
            pstmt.setInt(7, moimDo.getMoimViewCount());
            pstmt.setInt(8, moimDo.getMoimCategoryNum());
            pstmt.setDate(9, moimDo.getMoimStartDate());
            pstmt.setDate(10, moimDo.getMoimEndDate());
            pstmt.setInt(11, moimDo.getMoimMemberCount());
            pstmt.setInt(12, moimDo.getMoimMemberMax());
            pstmt.setInt(13, moimDo.getMoimPrice());
            pstmt.setDate(14, moimDo.getMoimDeadLine());
            pstmt.setInt(15, moimDo.getMoimDeadCheck());
            pstmt.setInt(16, moimDo.getMoimLocationNum());

            pstmt.executeUpdate();
            return moimDo;

        } catch (Exception e) {
            throw new IllegalStateException(e);
        } finally {
            try {;
                pstmt.close();
                close(conn);
            } catch(Exception e){
                e.printStackTrace();
            }
        }
    }


    @Override
    public MoimDo getMoim(long moimNum){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MoimDo moimDo = new MoimDo();
        try {
            String sql = "SELECT * FROM moim_post where moimNum = ?";
            conn = getConnection();

            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, moimNum);

            while (rs.next()) {
                moimDo.setMoimNum(rs.getLong(1));
                moimDo.setMoimHostUserIdNum(rs.getLong(2));
                moimDo.setMoimTitle(rs.getString(3));
                moimDo.setMoimMainContent(rs.getString(4));
                moimDo.setMoimImage(rs.getString(5));
                moimDo.setMoimCreateDate(rs.getDate(6));
                moimDo.setMoimViewCount(rs.getInt(7));
                moimDo.setMoimCategoryNum(rs.getInt(8));
                moimDo.setMoimStartDate(rs.getDate(9));
                moimDo.setMoimEndDate(rs.getDate(10));
                moimDo.setMoimMemberCount(rs.getInt(11));
                moimDo.setMoimMemberMax(rs.getInt(12));
                moimDo.setMoimPrice(rs.getInt(13));
                moimDo.setMoimDeadLine(rs.getDate(14));
                moimDo.setMoimDeadCheck(rs.getInt(15));
                moimDo.setMoimLocationNum(rs.getInt(16));

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
        return moimDo;
    }


    @Override
    public MoimDo update(MoimDo moimDo) {
        String sql = "UPDATE moim_post SET ? WHERE moim_num = ?";
        return null;
    }

    @Override
    public Long delete(Long moimNum) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "DELETE FROM moim_post WHERE moimNum = ?";
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, moimNum);

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
        return moimNum;
    }

    public List<MoimDo> findAll(){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        List<MoimDo> moimList = new ArrayList<>();
        try {
            conn = getConnection();
            stmt = conn.createStatement();

            rs = stmt.executeQuery("SELECT * FROM moim_post");

            while (rs.next()) {
                MoimDo moimDo = new MoimDo();
                moimDo.setMoimNum(rs.getLong(1));
                moimDo.setMoimHostUserIdNum(rs.getLong(2));
                moimDo.setMoimTitle(rs.getString(3));
                moimDo.setMoimMainContent(rs.getString(4));
                moimDo.setMoimImage(rs.getString(5));
                moimDo.setMoimCreateDate(rs.getDate(6));
                moimDo.setMoimViewCount(rs.getInt(7));
                moimDo.setMoimCategoryNum(rs.getInt(8));
                moimDo.setMoimStartDate(rs.getDate(9));
                moimDo.setMoimEndDate(rs.getDate(10));
                moimDo.setMoimMemberCount(rs.getInt(11));
                moimDo.setMoimMemberMax(rs.getInt(12));
                moimDo.setMoimPrice(rs.getInt(13));
                moimDo.setMoimDeadLine(rs.getDate(14));
                moimDo.setMoimDeadCheck(rs.getInt(15));
                moimDo.setMoimLocationNum(rs.getInt(16));

                moimList.add(moimDo);
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

