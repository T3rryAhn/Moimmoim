package moimmoimProject.mapper;

import moimmoimProject.domain.userDomain.UserDo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    //회원가입 시 id중복 체크하는 메소드
    public String idCheck(@Param("userId") String userId);

    //회원가입 시 email중복 체크하는 메소드
    public String emailCheck(@Param("userEmail") String userEmail);

    //회원가입 시 전화번호 중복 검사하는 메소드
    public Integer phoneCheck(@Param("phoneNum") String phoneNum);

    //회원 가입 시 유저정보 1차 등록 하는 메소드
    public void addUserStep1(@Param("user") UserDo user);

    //회원 가입 시 유저정보 2차 등록하는 메소드
    public void addUserStep2(@Param("user") UserDo user);
    UserDo getUserByCredentials(@Param("userId") String userId, @Param("userPassword") String userPassword);


    UserDo findByUserIdNum(@Param("userIdNum") Long userIdNum);

    void userProfileEdit(String userNickname, String phoneNum, int categoryNum, Long userIdNum);
}
