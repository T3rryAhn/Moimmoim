package moimmoimProject.mapper;

import moimmoimProject.domain.userDomain.UserDo;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FindIdPwMapper {
    public UserDo checkUser(@Param("user") UserDo user);
}
