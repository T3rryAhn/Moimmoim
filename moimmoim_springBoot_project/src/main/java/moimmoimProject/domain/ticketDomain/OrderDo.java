package moimmoimProject.domain.ticketDomain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDo {
    private String orderNum;
    private Long userIdNum;
    private Long moimNum;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime orderDate;
    private String orderStatus;
    private int orderPrice;
    private String orderReceiptCheck;
}
