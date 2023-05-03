package moimmoimProject.service.moimService;


import lombok.RequiredArgsConstructor;
import moimmoimProject.Repository.MoimRepository;
import moimmoimProject.domain.moim.Moim;

import java.sql.SQLException;
import java.util.List;

@RequiredArgsConstructor
public class MoimServiceImpl implements MoimService {

    private final MoimRepository moimRepository;

    @Override
    public void create(Moim moim) {
        moimRepository.newMoim(moim);
    }

    @Override
    public Moim findMoim(Long moim_num) {
        return moimRepository.findById(moim_num);
    }

    @Override
    public List<Moim> moims() {
        try {
            return moimRepository.findAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Moim findMoimByCat(int category_num) {
        return null;
    }
}
