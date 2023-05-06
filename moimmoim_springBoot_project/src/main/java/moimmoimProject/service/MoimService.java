package moimmoimProject.service;


import lombok.AllArgsConstructor;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.repository.MoimRepository;
import moimmoimProject.domain.moimDomain.MoimDo;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@AllArgsConstructor
@Service
public class MoimService {

    private final MoimMapper moimMapper;

    public MoimDo getMoimByMoimNum(Long moimNum){
        return moimMapper.findAllByMoimNum(moimNum);
    }

    public List<MoimDo> getMoimByUserIdNum(Long userNum){
        return moimMapper.findAllByUserIdNum(userNum);
    }

    public void createMoim(MoimDo moimDo) {
        moimMapper.createMoim(moimDo);
    }

    public void CountView(Long moimNum){
        moimMapper.countView(moimNum);
    }

    public List<MoimDo> getMoimList(Long moimCategoryNum){
        return moimMapper.findList(moimCategoryNum);
    }


}
