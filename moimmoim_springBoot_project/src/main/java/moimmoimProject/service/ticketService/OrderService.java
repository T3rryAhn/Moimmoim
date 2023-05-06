package moimmoimProject.service.ticketService;

import moimmoimProject.domain.ticketDomain.OrderDo;
import moimmoimProject.mapper.OrderMapper;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;

@Service
public class OrderService {
    private final OrderMapper orderMapper;

    public OrderService(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    //주문번호 생성기
    private Long createOrderNum(Date orderDate, Long moimNum, Long userIdNum) {
        // yymmdd/moimNum(8자리)/userIdNum(8자리) 형태로 생성합니다.
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
        String dateString = dateFormat.format(orderDate);
        String orderNumString = dateString + "/" + String.format("%08d", moimNum) + "/" + String.format("%08d", userIdNum);


        // orderNumString을 Long으로 변환해서 반환합니다.
        return Long.parseLong(orderNumString);
    }

    //중복 주문 방지

    //주문 생성 서비스
    public OrderDo createOrderDo(Long moimNum, Long userIdNum, int orderPrice) {
        // 주문 생성일시를 구합니다.
        Date orderDate = new Date(System.currentTimeMillis());

        // 주문번호를 생성합니다.
        Long orderNum = createOrderNum(orderDate, moimNum, userIdNum);

        // 주문상태를 "결제 진행중"으로 초기화합니다.
        String orderStatus = "결제 진행중";

        // 대금수령 상태를 "미수령" 으로 초기화
        String orderReceiptCheck = "미수령";


        // 주문 객체를 생성합니다.
        OrderDo orderDo = new OrderDo();
        orderDo.setOrderNum(orderNum);
        orderDo.setMoimNum(moimNum);
        orderDo.setUserIdNum(userIdNum);
        orderDo.setOrderDate(orderDate);
        orderDo.setOrderStatus(orderStatus);
        orderDo.setOrderPrice(orderPrice);
        orderDo.setOrderReceiptCheck(orderReceiptCheck);

        // 생성된 주문을 반환합니다.
        return orderDo;
    }

}