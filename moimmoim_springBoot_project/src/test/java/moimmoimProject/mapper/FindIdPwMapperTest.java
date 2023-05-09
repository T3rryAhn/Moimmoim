package moimmoimProject.mapper;

import lombok.extern.slf4j.Slf4j;
import moimmoimProject.domain.moimDomain.ImageDTO;
import moimmoimProject.domain.userDomain.UserDo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.internal.matchers.Find;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Slf4j
class FindIdPwMapperTest {

    @Autowired
    private FindIdPwMapper findIdPwMapper;
    @Test
    void checkUser() {
        UserDo user = new UserDo();
        user.setUserName("테스트");
        user.setUserEmail("test@test.com");
        UserDo findUser = findIdPwMapper.checkUser(user);
        Assertions.assertEquals("test1", findUser.getUserId());

    }

}