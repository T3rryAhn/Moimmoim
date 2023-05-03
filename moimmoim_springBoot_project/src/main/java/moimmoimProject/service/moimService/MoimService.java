package moimmoimProject.service.moimService;


import moimmoimProject.repository.MoimRepository;
import moimmoimProject.domain.moimDomain.MoimDo;

import java.sql.SQLException;
import java.util.List;


public class MoimService {

    private final MoimRepository moimRepository;
    public MoimService(MoimRepository moimRepository) {
        this.moimRepository = moimRepository;
    }

    public void join(MoimDo moimDo) throws SQLException {
        moimRepository.newMoim(moimDo);
    }

    public List<MoimDo> findMembers() throws SQLException {
        return moimRepository.findAll();
    }
}
