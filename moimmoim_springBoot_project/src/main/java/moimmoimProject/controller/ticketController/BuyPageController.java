package moimmoimProject.controller.ticketController;

import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.mapper.OrderMapper;
import moimmoimProject.mapper.UserMapper;
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
    private final UserMapper userMapper;
    private final OrderMapper orderMapper;


    public BuyPageController(OrderService orderService, MoimMapper moimMapper, UserMapper userMapper, OrderMapper orderMapper) {
        this.orderService = orderService;
        this.moimMapper = moimMapper;
        this.userMapper = userMapper;
        this.orderMapper = orderMapper;
    }
    @GetMapping("/buyPage/{moimNum}")
    public String showBuyPage(@PathVariable Long moimNum, Model model, Principal principal){
        String userIdNum = principal.getName(); // 세션에 저장된 Principal 정보에서  가져옵니다.
        UserDo userDo = userMapper.findByUserIdNum(Long.parseLong(userIdNum));
        MoimDo moimDo = moimMapper.findAllByMoimNum(moimNum);

        int maximumCapacity = moimDo.getMoimMemberMax() - moimDo.getMoimMemberCount();

        //정원이 다찼는지 비교
        if(moimDo.getMoimMemberMax() == moimDo.getMoimMemberCount()){
           // 정원이 다찼으면 구매 불가능
            String redirectUrl = "redirect:/moim/" + moimNum;
            model.addAttribute("errorMsg", "해당 모임은 정원이 가득 찼습니다.");
            return redirectUrl;
        }

        // 결제 진행중인 주문 목록의 수를 가져옵니다.
        int countOfOrderInProgress = orderMapper.countByMoimNumAndOrderStatus(moimNum, "결제 진행중");

        // 결제 진행중인 주문 목록의 수와 최대 정원 수를 비교합니다.
        if (countOfOrderInProgress >= maximumCapacity) {
            // 결제 진행중인 주문 목록의 수가 남는 티켓 수보다 크면 구매가 불가능합니다.
            String redirectUrl = "redirect:/moim/" + moimNum;
            model.addAttribute("errorMsg", "다른 회원이 결제중입니다. 나중에 다시 시도해주세요.");
            return redirectUrl;
        }

        model.addAttribute("userDo", userDo);
        model.addAttribute("moimDo", moimDo);
        return "buyPage";
    }
}
