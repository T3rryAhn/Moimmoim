package moimmoimProject.service.ticketService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import moimmoimProject.domain.ticketDomain.OrderDo;
import moimmoimProject.domain.ticketDomain.TicketDo;
import moimmoimProject.mapper.OrderMapper;
import moimmoimProject.mapper.TicketMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketService {
    private final TicketMapper ticketMapper;
    private final OrderMapper orderMapper;

    @Autowired
    public TicketService(TicketMapper ticketMapper, OrderMapper orderMapper) {
        this.ticketMapper = ticketMapper;
        this.orderMapper = orderMapper;
    }

    //티켓 생성  테이블에 행 삽입
    public void createTicket(String orderNum){

        OrderDo orderDo = orderMapper.findByOrderNum(orderNum);
        TicketDo ticketDo = new TicketDo();
        ticketDo.setOrderNum(orderDo.getOrderNum());
        ticketDo.setTicketNum(orderDo.getOrderNum());
        ticketDo.setImp_uid("결제없음");        //실결제 기능 미구현.
        ticketDo.setMoimNum(orderDo.getMoimNum());
        ticketDo.setUserIdNum(orderDo.getUserIdNum());
        ticketMapper.insertTicket(ticketDo);

    }

    public TicketDo getTicketByUserIdNum(Long userIdNum) {
        TicketDo ticketDo = ticketMapper.findByUserIdNum(userIdNum);
        return ticketDo;
    }

    public TicketDo getTicketByMoimNum(Long moimNum) {
        TicketDo ticketDo = ticketMapper.findByMoimNum(moimNum);
        return ticketDo;
    }



}
