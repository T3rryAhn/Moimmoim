package moimmoimProject.mapper.userMapper;

import moimmoimProject.domain.user.ProfileDo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProfileMapper {

    ProfileDo findByUserIdNum(Long userIdNum);
}
