package moimmoimProject.controller.myPageController;


import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

    private final UserMapper userMapper;

    @Autowired
    public MyPageController(UserMapper userMapper) {
        this.userMapper=userMapper;
    }

    @GetMapping("/{userIdNum}")
    public String findByUserIdNum(@PathVariable Long userIdNum, Model model){
        UserDo userDo = userMapper.findByUserIdNum(userIdNum);
        model.addAttribute("userDo", userDo);

        return "/myPageService/myPage";
    }

}
