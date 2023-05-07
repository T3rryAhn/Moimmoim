package moimmoimProject.service;


import lombok.AllArgsConstructor;
import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.repository.MoimRepository;
import moimmoimProject.domain.moimDomain.MoimDo;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
    public void deleteMoim(Long moimNum){
        moimMapper.deleteMoim(moimNum);
    }

    public int moimListCnt(){
        return moimMapper.moimListCnt();
    }

    public List<Map<String, Object>> moimList(Criteria cri,int moimCategoryNum){
        return moimMapper.moimList(cri,moimCategoryNum);
    }

}
