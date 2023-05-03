package moimmoimProject.mapper;

import moimmoimProject.domain.userDomain.UserDo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    UserDo getUserByCredentials(@Param("userId") String userId, @Param("userPassword") String userPassword);


    UserDo findByUserIdNum(@Param("userIdNum") Long userIdNum);
}
