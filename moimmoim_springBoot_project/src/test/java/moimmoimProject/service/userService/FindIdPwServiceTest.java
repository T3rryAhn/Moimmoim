package moimmoimProject.service.userService;

import lombok.extern.slf4j.Slf4j;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.FindIdPwMapper;
import org.apache.catalina.User;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.internal.matchers.Find;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Slf4j

class FindIdPwServiceTest {
    @Autowired
    private FindIdPwService findIdPwService;
    @Autowired
    private FindIdPwMapper findIdPwMapper;
    @Test
    void checkUser(){
        UserDo user = new UserDo();
        user.setUserName("테스트");
        user.setUserEmail("test@test.com");
       UserDo returnUser =  findIdPwService.checkUser(user);
        Assertions.assertEquals(returnUser, user);

    }

    @Test
    void sendIdToEmail() throws Exception {
        UserDo user = new UserDo();
        user.setUserName("테스트");
        user.setUserEmail("test@test.com");
        UserDo findUser = findIdPwMapper.checkUser(user);
       Assertions.assertEquals("test1", findIdPwService.sendIdToEmail(findUser));

    }
}