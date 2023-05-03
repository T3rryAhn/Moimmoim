package moimmoimProject.mapper.userMapper;

import moimmoimProject.domain.user.UserProfileDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserProfileMapper {
    UserProfileDto getUserProfileDto(Long userIdNum);
}
