package moimmoimProject.controller.userController;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Slf4j
class LoginControllerTest {

    @Autowired
   private HttpServletRequest request;
    @Test
    void checkUser() {
        HttpSession session = request.getSession();
        Long userIdNum = Long.valueOf(1);
        session.setAttribute("userIdNum", userIdNum);
        Long loginedUserIdNum = (Long) session.getAttribute("userIdNum");
        System.out.print(loginedUserIdNum);
    }
}