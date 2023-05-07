package moimmoimProject.controller.userController;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.service.userService.LoginService;
import org.apache.catalina.User;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;
    //로그인 시 회원인지 검사
    @PostMapping(value = "login/checkUser", consumes = "application/json")
    public ResponseEntity<String> checkUser(@RequestBody UserDo user, HttpSession session){
        UserDo returnUser = loginService.checkUser(user);
        if(returnUser != null){
            session.setAttribute("userIdNum",returnUser.getUserIdNum());
          return  ResponseEntity.ok().body("[server]: 로그인 가능");
        }
        else{
            return ResponseEntity.ok().body(null);
        }
    }
}
