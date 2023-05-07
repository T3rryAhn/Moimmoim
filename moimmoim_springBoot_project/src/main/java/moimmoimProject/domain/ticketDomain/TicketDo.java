package moimmoimProject.domain.ticketDomain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketDo {
    private Long orderNum;
    private Long ticketNum;
    private String imp_uid;
    private Long moimNum;
    private Long userIdNum;

}
