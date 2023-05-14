package moimmoimProject.domain.userDomain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReceiptDo {
    private Long userIdNum;
    private Long receiptMoney;
}
