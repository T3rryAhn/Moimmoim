package moimmoimProject.mapper;

import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.domain.userDomain.UserDo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProfileMapper {

    ProfileDo findByUserIdNum(@Param("userIdNum") Long userIdNum);
    void updateProfileImage(ProfileDo profileDo);
    void insertProfileDefault(Long userIdNum);

    List<Map<String, Object>> findAllProfileDo(@Param("moimCategoryNum")Long moimCategoryNum, String keyword, @Param("cri")Criteria cri, @Param("sorting")Long sorting);
    int profileListCnt(@Param("moimCategoryNum")Long moimCategoryNum,@Param("keyword")String keyword);                                 // 프로필 총 갯수

    String getName(Long userIdNum);

    int getUserLevel(Long UserIdNum);
}
