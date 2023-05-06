package moimmoimProject.controller.ticketController;

import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.mapper.OrderMapper;
import moimmoimProject.service.ticketService.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping
public class BuyPageController {

    private final OrderService orderService;
    private final MoimMapper moimMapper;


    public BuyPageController(OrderService orderService, MoimMapper moimMapper) {
        this.orderService = orderService;
        this.moimMapper = moimMapper;
    }
    @GetMapping("/buyPage/{moimNum}")
    public String showBuyPage(@PathVariable Long moimNum, Model model, Principal principal){
        String userIdNum = principal.getName(); // 세션에 저장된 Principal 정보에서  가져옵니다.
        int moimPrice = moimMapper.findByMoimNum(moimNum).getMoimPrice();
        model.addAttribute("userIdNum", userIdNum);
        model.addAttribute("moimPrice", moimPrice);
        return "buyPage";
    }
}
