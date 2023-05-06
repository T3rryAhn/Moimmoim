package moimmoimProject.service.moimService;


import lombok.AllArgsConstructor;
import moimmoimProject.repository.MoimRepository;
import moimmoimProject.domain.moimDomain.MoimDo;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@AllArgsConstructor
@Service
public class MoimService {

    private final MoimRepository moimRepository;

    public void join(MoimDo moimDo) throws SQLException {
        moimRepository.newMoim(moimDo);
    }

    public MoimDo getMoim(Long moimNum){
        try {
            return moimRepository.getMoim(moimNum);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<MoimDo> findMembers() throws SQLException {
        return moimRepository.findAll();
    }
}
