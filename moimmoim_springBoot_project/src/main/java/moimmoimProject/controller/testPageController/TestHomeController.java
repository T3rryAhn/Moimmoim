package moimmoimProject.controller.testPageController;

import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.mapper.UserMapper;
import moimmoimProject.service.MoimService;
import moimmoimProject.service.userService.UserService;
import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestHomeController {
    private final MoimMapper moimMapper;
    private final UserMapper userMapper;

    TestHomeController(MoimMapper moimMapper, UserMapper userMapper) {

        this.moimMapper = moimMapper;
        this.userMapper = userMapper;
    }

    @GetMapping("/")
    public String testHome() {
        return "/testHome";
    }
    @GetMapping("/main")
    public String mainPage() {
        return "/main";
    }

    @GetMapping("/test/ticket/{moimNum}/{userIdNum}")
    public ModelAndView testTicket(@PathVariable Long moimNum, @PathVariable Long userIdNum) {

        MoimService moimService = new MoimService(moimMapper);
        MoimDo moimDo = moimService.getMoimByMoimNum(moimNum);

        UserDo userDo = userMapper.findByUserIdNum(userIdNum);
        ModelAndView mav = new ModelAndView();
        mav.addObject("moimDo", moimDo);
        mav.addObject("userDo", userDo);
        mav.setViewName("/ticketService/moimPageTicket");

        return mav;
    }


}
