package moimmoimProject.controller.userController;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.service.userService.FindIdPwService;
import moimmoimProject.service.userService.LoginService;
import org.apache.catalina.User;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
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

    //findPw 페이지1 반환
    @GetMapping("findPw1")
    public String findPw1(){
        return "userService/findPwpage1";
    }
    //findPw 페이지2 반환
    @GetMapping("findPw2")
    public String findPw2(){
        return "userService/findPwpage2";
    }

    @GetMapping("resetPw")
        public String resetPwPage(){return "userService/resetPw";}

    //아이디 찾기
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

    //비밀번호 찾기: 코드 전송
    @PostMapping("findPw/checkUser")
    public ResponseEntity<String> findPw(@RequestBody UserDo user) throws Exception {

        try{
            UserDo findUser = findIdPwService.findPw(user);
            if(findUser ==null){
                return ResponseEntity.ok(null);
            }
            else{
                return ResponseEntity.ok(findIdPwService.sendCodeToEmail(findUser));
            }
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    //비밀번호 찾기: 코드 확인
    @PostMapping(value = "findPw/checkCode" ,consumes = "text/plain")
    public ResponseEntity<String> findPwCheckCode(@RequestBody String code,HttpServletRequest request) {
        HttpSession session = request.getSession();
        String afterCode = code;
        String beforeCode= (String) session.getAttribute("code");

        if(afterCode.equals(beforeCode)){
        return ResponseEntity.ok(beforeCode);}
        else{
            return ResponseEntity.ok(null);
        }
    }

    //비밀번호 찾기 : 비밀번호 갱신
    @PostMapping(value="findPw/resetPw" , consumes = "text/plain")
    public ResponseEntity<String> resetPw(@RequestBody String password,HttpServletRequest request){

       try {
           HttpSession session = request.getSession();
           findIdPwService.resetPw(password, session);
           session.invalidate();
           return ResponseEntity.ok("success");
       }catch (Exception e){
           return ResponseEntity.ok("error");
       }

    }


}
