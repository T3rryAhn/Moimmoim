package moimmoimProject.mapper;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.userDomain.UserDo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LoginMapper {
    public  UserDo checkUser(@Param("user") UserDo user);
}
