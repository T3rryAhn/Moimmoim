package moimmoimProject.repository;

import moimmoimProject.domain.moimDomain.Moim;

import java.sql.SQLException;
import java.util.List;

public interface MoimRepository {
    Moim newMoim(Moim moim) throws SQLException;
    Moim getMoim(long moim_num) throws SQLException;
    Moim update(Moim moim);
    Long delete(Long moim_num) throws SQLException;
    List<Moim> findAll() throws SQLException;
}