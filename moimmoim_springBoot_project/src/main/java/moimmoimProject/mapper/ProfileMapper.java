package moimmoimProject.mapper;

import moimmoimProject.domain.ProfileDo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ProfileMapper {

    ProfileDo findByUserIdNum(@Param("userIdNum") Long userIdNum);
}
