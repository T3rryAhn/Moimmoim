package moimmoimProject.service.moimService;


import moimmoimProject.Repository.MoimRepository;
import moimmoimProject.domain.moim.Moim;

import java.sql.SQLException;
import java.util.List;


public class MoimService {

    private final MoimRepository moimRepository;
    public MoimService(MoimRepository moimRepository) {
        this.moimRepository = moimRepository;
    }

    public void join(Moim moim) throws SQLException {
        moimRepository.newMoim(moim);
    }

    public List<Moim> findMembers() throws SQLException {
        return moimRepository.findAll();
    }
}