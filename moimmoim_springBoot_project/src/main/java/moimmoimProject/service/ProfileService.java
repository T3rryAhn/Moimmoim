package moimmoimProject.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.moimDomain.LocationDo;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.domain.userDomain.UserProfileDto;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.mapper.ProfileMapper;
import moimmoimProject.service.Assembler.UserProfileAssembler;
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
    private final UserProfileAssembler userProfileAssembler;

    public List<String> getHostLevelList(List<Map<String, Object>> proList){
        List<String> list = new ArrayList<>();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        int i = 0;
        while (true) {
            ProfileDo convertedProfileDo = objectMapper.convertValue(proList.get(i), ProfileDo.class);
            String level = getHostLevelName(Math.toIntExact(convertedProfileDo.getUserIdNum()));
            list.add(level);
            if(proList.size()-1 > i){
                i++;
            }else{
                break;
            }
        }
        return list;
    }

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

    public List<String> getHostProfile(){                 // 레벨 값 리스트로 받아오기
        List<ProfileDo> proList = new ArrayList<>();
        List<Long> numList = moimMapper.findHost();
        List<Integer> list = new ArrayList<>();
        List<String> nameList = new ArrayList<>();
        int i = 0;
        while(true){
            ProfileDo profileDo = profileMapper.findByUserIdNum(numList.get(i));
            list.add(profileMapper.getUserLevel(profileDo.getUserIdNum()));

            if(numList.size()-1 > i){
                i++;
            }else{
                break;
            }
        }
        while(true){
            nameList.add(getHostLevelName(list.get(i)));
            if(numList.size()-1 > i){
                i++;
            }else{
                break;
            }
        }
        return nameList;
    }

    public List<Map<String, Object>> findAllProfileDo(@Param("moimCategoryNum")Long moimCategoryNum, @Param("keyword")String keyword, @Param("cri")Criteria cri,@Param("sorting") Long sorting){
        return profileMapper.findAllProfileDo(moimCategoryNum, keyword, cri, sorting);
    }

    public int profileListCnt(@Param("moimCategoryNum")Long moimCategoryNum,@Param("keyword")String keyword){
        return profileMapper.profileListCnt(moimCategoryNum,keyword);
    }

    public List<String> getUser(List<Map<String, Object>> proList){
        List<String> list = new ArrayList<>();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        int i = 0;
        while (true) {
            ProfileDo convertedProfileDo = objectMapper.convertValue(proList.get(i), ProfileDo.class);
            profileMapper.getName(convertedProfileDo.getUserIdNum());
            list.add(profileMapper.getName(convertedProfileDo.getUserIdNum()));
            if(proList.size()-1 > i){
                i++;
            }else{
                break;
            }
        }
        return list;
    }

}
