package moimmoimProject.service.receiptService;

import lombok.AllArgsConstructor;
import moimmoimProject.domain.userDomain.ReceiptDo;
import moimmoimProject.mapper.ReceiptMapper;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ReceiptService {
    private final ReceiptMapper receiptMapper;

    //대금 업데이트
    public void updateReceipt(Long userIdNum, int amount) {
        int checkRecipt = receiptMapper.checkReceipt(userIdNum);

        if(checkRecipt == 0) {
            receiptMapper.createReceipt(userIdNum);
        }
        receiptMapper.updateReceipt(userIdNum, amount);
    }

    //대금 금액 불러오기
    public ReceiptDo getReceipt(Long userIdNum){
        return receiptMapper.getReceipt(userIdNum);
    }
}
