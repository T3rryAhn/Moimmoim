package moimmoimProject.repository;


import moimmoimProject.domain.moimDomain.MoimDo;

import java.sql.SQLException;
import java.util.List;

public interface MoimRepository {
    MoimDo newMoim(MoimDo MoimDo) throws SQLException;
    MoimDo getMoim(long moim_num) throws SQLException;
    MoimDo update(MoimDo MoimDo);
    Long delete(Long moim_num) throws SQLException;
    List<MoimDo> findAll() throws SQLException;
}