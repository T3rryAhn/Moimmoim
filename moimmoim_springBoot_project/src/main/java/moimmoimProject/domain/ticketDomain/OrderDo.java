package moimmoimProject.domain.ticketDomain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDo {
    private Long orderNum;
    private Long userIdNum;
    private Long moimNum;
    @DateTimeFormat(pattern = "YY/MM/DD/HH/MM/SS")
    private Date orderDate;
    private String orderStatus;
    private int orderPrice;
    private String orderReceiptCheck;
}
