package moimmoimProject.mapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import moimmoimProject.domain.userDomain.UserDo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Slf4j
@RequiredArgsConstructor
class LoginMapperTest {

    @Autowired
    private  LoginMapper loginMapper;
    @Autowired
    private UserDo user;

    @Test
    void checkUser() {
        UserDo returnUser =new UserDo();

        user.setUserId("test1");
        user.setUserPassword("test");

       returnUser =  loginMapper.checkUser(user);
       Assertions.assertEquals(returnUser.getUserId(), user.getUserId());
    }
}