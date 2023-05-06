package moimmoimProject.mapper;

import moimmoimProject.domain.ticketDomain.OrderDo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface OrderMapper {

    OrderDo findByUserIdNum(@Param("userIdNum") Long userIdNum);

    OrderDo findByMoimNum(@Param("moimNum") Long moimNum);

    String getMaxOrderNum(Long moimNum);
}
