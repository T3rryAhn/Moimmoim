package moimmoimProject.controller.ticketController;

import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.domain.moimDomain.MoimMemDo;
import moimmoimProject.domain.ticketDomain.OrderDo;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.*;
import moimmoimProject.service.receiptService.ReceiptService;
import moimmoimProject.service.ticketService.OrderService;
import moimmoimProject.service.ticketService.TicketService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.nio.file.Files;


@Controller
@RequestMapping
public class BuyPageController {

    private final OrderService orderService;
    private final MoimMapper moimMapper;
    private final UserMapper userMapper;
    private final OrderMapper orderMapper;
    private final TicketMapper ticketMapper;
    private final ReceiptMapper receiptMapper;


    public BuyPageController(OrderService orderService, MoimMapper moimMapper, UserMapper userMapper, OrderMapper orderMapper, TicketMapper ticketMapper, ReceiptMapper receiptMapper) {
        this.orderService = orderService;
        this.moimMapper = moimMapper;
        this.userMapper = userMapper;
        this.orderMapper = orderMapper;
        this.ticketMapper = ticketMapper;
        this.receiptMapper = receiptMapper;

    }
    @GetMapping("/buyPage/{moimNum}")
    public String showBuyPage(@PathVariable Long moimNum, HttpSession session, Model model) {

        Long userIdNum = (Long) session.getAttribute("userIdNum");

        if(userIdNum == null) {
            // 여기에 로그인하지 않은 사용자를 위한 처리를 작성합니다.
            model.addAttribute("errorMsg", "로그인 필요.");
            return "/login"; // 예: 로그인 페이지로 리다이렉트
        }

        UserDo userDo = userMapper.findByUserIdNum(userIdNum);
        MoimDo moimDo = moimMapper.findAllByMoimNum(moimNum);

        int maximumCapacity = moimDo.getMoimMemberMax() - moimDo.getMoimMemberCount();



        //정원이 다찼는지 비교
        if(moimDo.getMoimMemberMax() == moimDo.getMoimMemberCount()){
           // 정원이 다찼으면 구매 불가능
            model.addAttribute("errorMsg", "해당 모임은 정원이 가득 찼습니다.");
            return "/ticketService/ticketErrorPage";
        }
        else {
            // 결제 진행중인 주문 목록의 수를 가져옵니다.
            int countOfOrderInProgress = orderMapper.countByMoimNumAndOrderStatus(moimNum, "결제 진행중");

            // 결제 진행중인 주문 목록의 수와 최대 정원 수를 비교합니다.
            if (countOfOrderInProgress >= maximumCapacity) {
                // 결제 진행중인 주문 목록의 수가 남는 티켓 수보다 크면 구매가 불가능합니다.
                model.addAttribute("errorMsg", "다른 회원이 결제중입니다. 나중에 다시 시도해주세요.");
                return "/ticketService/ticketErrorPage";
            }
            else{
                // createOrderDo() 호출하여 OrderDo 객체 생성 후 orderNum 값을 가져와서 세션에 저장
                OrderDo orderDo = orderService.createOrderDo(moimDo.getMoimNum(), userDo.getUserIdNum(), moimDo.getMoimPrice());
                model.addAttribute("orderNum", orderDo.getOrderNum()); // 세션 대신 모델에 주문 번호 추가
            }
        }


        model.addAttribute("userDo", userDo);
        model.addAttribute("moimDo", moimDo);

        return "ticketService/buyPage";
    }


    @PostMapping("/cancelOrder")
    @ResponseBody
    public String cancelOrder(@RequestParam String orderNum) {
        if (orderNum != null) {
            orderService.cancelOrder(orderNum);
            return "주문이 취소되었습니다.";
        } else {
            return "주문이 존재하지 않습니다.";
        }
    }

    @PostMapping("/updateOrderStatus")
    public void updateOrder(@RequestParam String orderNum, String orderStatus) {
        orderMapper.updateOrderStatus(orderNum, orderStatus);

    }

    //결제 성공 로직
    @PostMapping("/buySuccess")
    public String showBuySuccessPage(@RequestParam String orderNum, HttpSession session) {
        //orderDo 호출
        OrderDo orderDo = orderMapper.findByOrderNum(orderNum);

        //moimDo 호출
        MoimDo moimDo = moimMapper.findAllByMoimNum(orderDo.getMoimNum());

        //주문 상태 변경
        updateOrder(orderNum, "결제 완료");

        //티켓 생성
        TicketService ticketService = new TicketService(ticketMapper, orderMapper);
        ticketService.createTicket(orderNum);

        //대금 테이블 등록
        ReceiptService receiptService = new ReceiptService(receiptMapper);
        receiptService.updateReceipt(moimDo.getMoimHostUserIdNum(), orderDo.getOrderPrice());

        Long userIdNum = (Long) session.getAttribute("userIdNum");      // 세션에서 받음
        String[] parts = orderNum.split("/");
        Long moimNum = Long.parseLong((parts[1]));
        moimMapper.plusMemberCount(moimNum);

        // moimDo = moimMapper.findAllByMoimNum(moimNum);
        moimMapper.joinMoim(userIdNum, moimDo);


        return "location.reaload();";
    }
}
