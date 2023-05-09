package moimmoimProject.mapper;

import moimmoimProject.domain.userDomain.UserDo;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FindIdPwMapper {
    // 아이디 찾기:이름,이메일 입력받아 select
    public UserDo checkUser(@Param("user") UserDo user);

    // 비밀번호 찾기: 아이디,이메일 입력받아 select
    public UserDo findPw(@Param("user") UserDo user);

    //비밀번호 찾기 : 비밀번호 갱신
    public void resetPw(@Param("userIdNum")Long userIdNum, @Param("newPassword") String password);
}
