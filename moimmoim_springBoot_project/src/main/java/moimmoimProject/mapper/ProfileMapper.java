package moimmoimProject.mapper;

import moimmoimProject.domain.userDomain.ProfileDo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ProfileMapper {

    ProfileDo findByUserIdNum(@Param("userIdNum") Long userIdNum);
    void updateProfileImage(ProfileDo profileDo);
}
