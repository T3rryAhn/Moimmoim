package moimmoimProject.service.ticketService;

import moimmoimProject.domain.ticketDomain.OrderDo;
import moimmoimProject.mapper.OrderMapper;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
public class OrderService {
    private final OrderMapper orderMapper;

    public OrderService(OrderMapper orderMapper) {

        this.orderMapper = orderMapper;
    }

    //주문번호 생성기
    private Long createOrderNum(LocalDateTime orderDate, Long moimNum, Long userIdNum) {
        // yymmdd/moimNum(8자리)/userIdNum(8자리) 형태로 생성합니다.
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
        String dateString = orderDate.format(formatter);
        String orderNumString = dateString + "/" + String.format("%08d", moimNum) + "/" + String.format("%08d", userIdNum);


        // orderNumString을 Long으로 변환해서 반환합니다.
        return Long.parseLong(orderNumString);
    }

    //주문 생성 서비스
    public OrderDo createOrderDo(Long moimNum, Long userIdNum, int orderPrice) {
        // 주문 생성일시를 구합니다.
        LocalDateTime orderDate = LocalDateTime.now();

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

        // 중복된 주문이 있는지 검사합니다.
        boolean isDuplicate = orderMapper.findByOrderNum(orderNum) != null;

        if (isDuplicate) {
            // 중복된 주문이 있는 경우, 예외를 발생시킵니다.
            throw new RuntimeException("이미 해당 모임에 대한 주문이 존재합니다.");
        } else {
            // 중복된 주문이 없는 경우, 주문 정보를 DB에 저장합니다.
            orderMapper.insertOrder(orderDo);
        }
        // 생성된 주문을 반환합니다.
        return orderDo;
    }

    // 주문 취소 서비스
    public void cancelOrder(Long orderNum) {
        OrderDo order = orderMapper.findByOrderNum(orderNum);

        // 주문이 존재하는지 확인
        if (order == null) {
            // 주문이 존재하지 않으면 아무 작업도 수행하지 않습니다.
            return;
        }

        // 이미 주문이 취소되었는지 확인
        if ("결제 취소".equals(order.getOrderStatus())) {
            // 이미 취소된 주문이면 아무 작업도 수행하지 않습니다.
            return;
        }

        // 주문 상태를 '결제 취소'로 변경
        order.setOrderStatus("결제 취소");

        // DB에서 주문 삭제
        orderMapper.deleteByOrderNum(orderNum);
    }

}