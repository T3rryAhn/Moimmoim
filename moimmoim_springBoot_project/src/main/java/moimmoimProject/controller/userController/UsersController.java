package moimmoimProject.controller.userController;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.service.userService.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class UsersController {

 private final UserService userService;

    //로그인 페이지 반환
    @GetMapping("login")
    public String home(){
        return "userService/login";
    }

    //회원가입 페이지1 반환
    @GetMapping("signup")
    public String signupPage1(){
        return"userService/signupPage1";
    }
    //회원가입 페이지2 반환
    @GetMapping("signupPage2")
    public String signupPage2(@RequestParam("userId") String userId , HttpSession session){
        session.setAttribute("userId", userId);
        return "userService/signupPage2";
    }


    //아이디 중복 검사
    @GetMapping("signup/idCheck")
    @ResponseBody
    public String idCheck(@Param("userId") String userId) {
        String result = userService.idCheck(userId);
        if (result == null) {
            return null;
        }
        if (result.equals(userId)) {
            return userId;
        }
        return null;
    }

    // 이메일 중복검사
    @GetMapping("signup/EmailCheck")
    @ResponseBody
    public String emailCheck(@Param("userEmail") String userEmail) {
        String result = userService.emailCheck(userEmail);
        if (result == null) {
            return null;
        }
        if (result.equals(userEmail)) {
            return userEmail;
        }
        return null;
    }

    //핸드폰 번호 중복 검사
    @GetMapping("signup/phoneCheck")
    @ResponseBody
    public String phoneCheck(@Param("phoneNum") String phoneNum){

         Integer result =  userService.phoneCheck(phoneNum);
         if(result != null){
             return phoneNum;
         }
         else{
             return null;
         }
    }


    //회원 가입 시 이메일로 코드 보내기
    @GetMapping("signup/sendCodeToEmail")
    @ResponseBody
    public String sendCodeToEmail(@Param("userEmail") String userEmail) throws Exception{

        try {
            return userService.sendcodeToEmail(userEmail);

        }catch(Exception e){
            return"error";
        }
    }


    //회원 가입 시 signupPage1에서 입력받은 값 db에 저장 후 signupPage2 이동
    @PostMapping(value = "signup/addUserStep1", consumes = "application/json")
    public ResponseEntity<String> addUserStep1(@RequestBody UserDo user, HttpSession session) {
        // 데이터베이스에 유저 정보를 등록하는 코드
        String userId = (String) session.getAttribute("userId");
        userService.addUserStep1(user);
        return ResponseEntity.ok().body("success: "+userId);
    }

    //회원 가입 시 signupPage2에서 입력받은 값 db에 저장 후 login 페이지 이동
    @PostMapping(value = "signup/addUserStep2", consumes = "application/json")
    public ResponseEntity<String> addUserStep2(@RequestBody UserDo user ,HttpSession session) {
        String userId = (String) session.getAttribute("userId");
//        // 데이터베이스에 유저 정보를 등록하는 코드
        user.setUserId(userId);
        userService.addUserStep2(user);

        return ResponseEntity.ok().body("success");
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/main";
    }
}

