package moimmoimProject.controller.userController;

import lombok.RequiredArgsConstructor;
import moimmoimProject.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class UsersController {

 private final UserMapper userMapper;

    //    @GetMapping
//    public String test(Model model){
//        User findUser = userMapper.findByName();
//        model.addAttribute("user", findUser);
//        return "test";
//    }

    @GetMapping("")
    public String home(){
        return "userService/login";
    }

    @GetMapping("signup")
    public String signupPage1(){
        return"userService/signupPage1";
    }
}
