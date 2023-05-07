package moimmoimProject.controller.testPageController;

import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.service.MoimService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestHomeController {
    private final MoimMapper moimMapper;

    TestHomeController(MoimMapper moimMapper) {
        this.moimMapper = moimMapper;
    }

    @GetMapping("/")
    public String testHome() {
        return "/testHome";
    }

    @GetMapping("/test/ticket/{moimNum}/{userIdNum}")
    public ModelAndView testTicket(@PathVariable Long moimNum) {

        MoimService moimService = new MoimService(moimMapper);
        MoimDo moimDo = moimService.getMoimByMoimNum(moimNum);

        ModelAndView mav = new ModelAndView();
        mav.addObject("moimDo", moimDo);
        mav.setViewName("/ticketService/moimPageTicket");

        return mav;
    }


}
