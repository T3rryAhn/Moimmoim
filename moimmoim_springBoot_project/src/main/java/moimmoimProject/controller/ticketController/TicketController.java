package moimmoimProject.controller.ticketController;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.mapper.TicketMapper;
import moimmoimProject.mapper.UserMapper;
import moimmoimProject.service.MoimService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/ticket")
public class TicketController {
    private final MoimMapper moimMapper;
    private final UserMapper userMapper;
    private final TicketMapper ticketMapper;

    @GetMapping("/forDetailMoim/{moimNum}")
    public ModelAndView showTicket(@PathVariable Long moimNum, HttpSession session) {

        ModelAndView mav = new ModelAndView();
        MoimService moimService = new MoimService(moimMapper);
        MoimDo moimDo = moimService.getMoimByMoimNum(moimNum);

        Long userIdNum = (Long) session.getAttribute("userIdNum");

        if(userIdNum == null) {
            // 여기에 로그인하지 않은 사용자를 위한 처리를 작성합니다.

            mav.addObject("moimDo", moimDo);
            mav.setViewName("/ticketService/notLoginMoimPageTicket");
            return mav;
        }
        if(ticketMapper.findByMoimNum(moimNum).getUserIdNum() == userIdNum){
            mav.addObject(ticketMapper.findByUserIdNum(userIdNum));
            UserDo userDo = userMapper.findByUserIdNum(userIdNum);
            mav.addObject("moimDo", moimDo);
            mav.addObject("userDo", userDo);
            mav.setViewName("/ticketService/ticket");
            return mav;
        }

        UserDo userDo = userMapper.findByUserIdNum(userIdNum);
        mav.addObject("moimDo", moimDo);
        mav.addObject("userDo", userDo);
        mav.setViewName("/ticketService/moimPageTicket");

        return mav;
    }
}
