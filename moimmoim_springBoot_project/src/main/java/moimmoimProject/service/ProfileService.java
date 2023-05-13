package moimmoimProject.service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.mapper.ProfileMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@AllArgsConstructor
@Service
@Log4j2
public class ProfileService {


    private final MoimMapper moimMapper;
    private final ProfileMapper profileMapper;

    public String getHostLevelName(int userCategoryNum){
        String hostLevelName="";
        switch (userCategoryNum){
            case 1 : hostLevelName = "뉴비 호스트";
                break;
            case 2 : hostLevelName = "주니어 호스트";
                break;
            case 3 : hostLevelName = "시니어 호스트";
                break;
            case 4 : hostLevelName = "슈퍼 호스트";
                break;
        }
        return hostLevelName;
    }

    public List<ProfileDo> getHostProfile(){
        List<ProfileDo> list = new ArrayList<>();
        List<Long> numList = moimMapper.findHost();
        int i = 0;
        while(true){
            ProfileDo profileDo = profileMapper.findByUserIdNum(numList.get(i));
            list.add(profileDo);
            if(numList.size()-1 > i){
                i++;
            }else{
                break;
            }
        }
        return list;
    }

    public List<Map<String, Object>> findAllProfileDo(@Param("moimCategoryNum")Long moimCategoryNum, @Param("keyword")String keyword, @Param("cri")Criteria cri,@Param("sorting") Long sorting){
        return profileMapper.findAllProfileDo(moimCategoryNum, keyword, cri, sorting);
    }

    public int profileListCnt(@Param("moimCategoryNum")Long moimCategoryNum,@Param("keyword")String keyword){
        return profileMapper.profileListCnt(moimCategoryNum,keyword);
    }


}
