package moimmoimProject.controller.userController;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.service.userService.FindIdPwService;
import moimmoimProject.service.userService.LoginService;
import org.apache.catalina.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class FindIdPwController {

    private final FindIdPwService findIdPwService;
    // findId 페이지 반환
    @GetMapping("findId")
    public String findId(){
        return "userService/findId";
    }

    //서버에 이름과 이메일 select 후
    @PostMapping("findId/checkUser")
    public ResponseEntity<String> checkUser(@RequestBody UserDo user) throws Exception {

          try{
           UserDo findUser = findIdPwService.checkUser(user);
              if(findUser ==null){
                  return ResponseEntity.ok(null);
              }
             else{
                 findIdPwService.sendIdToEmail(findUser);
                  return ResponseEntity.ok("success");
              }
          }catch (Exception e){
              e.printStackTrace();
              return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
          }
    }
}
