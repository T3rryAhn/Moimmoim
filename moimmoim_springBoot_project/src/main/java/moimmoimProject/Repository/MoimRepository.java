package moimmoimProject.Repository;

import moimmoimProject.domain.moim.Moim;

import java.sql.SQLException;
import java.util.List;

public interface MoimRepository {


    void newMoim(Moim moim);

    Moim findById(long moim_num);

    List<Moim> findByCat(int category_num);

    Moim update(Moim moim);

    Long delete(Long moim_num) throws SQLException;

    List<Moim> findAll() throws SQLException;



}
