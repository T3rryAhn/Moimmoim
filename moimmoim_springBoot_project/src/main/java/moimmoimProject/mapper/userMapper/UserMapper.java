package moimmoimProject.mapper.userMapper;

import moimmoimProject.domain.user.User;
import moimmoimProject.domain.user.UserDo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    UserDo getUserByCredentials(@Param("userId") String userId, @Param("userPassword") String userPassword);


    UserDo findByUserIdNum(Long userIdNum);
}
