package moimmoimProject.mapper;

import moimmoimProject.domain.ticketDomain.TicketDo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TicketMapper {

    TicketDo findByUserIdNum(@Param("userIdNum") Long userIdNum);

    TicketDo findByMoimNum(@Param("moimNum") Long moimNum);
}
