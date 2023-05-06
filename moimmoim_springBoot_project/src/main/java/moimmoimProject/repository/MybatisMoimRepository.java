package moimmoimProject.repository;

import lombok.AllArgsConstructor;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.mapper.MoimMapper;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
@AllArgsConstructor
@Repository
public class MybatisMoimRepository implements MoimRepository {

    private final MoimMapper moimMapper;

    @Override
    public MoimDo newMoim(MoimDo MoimDo) throws SQLException {
        return null;
    }

    @Override
    public MoimDo getMoim(long moim_num) throws SQLException {
        return moimMapper.findAllByMoimId(moim_num);
    }

    @Override
    public MoimDo update(MoimDo MoimDo) {
        return null;
    }

    @Override
    public Long delete(Long moim_num) throws SQLException {
        return null;
    }

    @Override
    public List<MoimDo> findAll() throws SQLException {
        return null;
    }
}
