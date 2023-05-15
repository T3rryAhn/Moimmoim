package moimmoimProject.mapper;

import moimmoimProject.domain.ticketDomain.TicketDo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TicketMapper {

    TicketDo findByUserIdNum(@Param("userIdNum") Long userIdNum);

    TicketDo findByMoimNum(@Param("moimNum") Long moimNum);

    TicketDo findByMoimNumAndUserIdNum(@Param("moimNum") Long moimNum, Long userIdNum);

    void insertTicket(TicketDo ticketDo);
}
