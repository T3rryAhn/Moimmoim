package moimmoimProject.mapper;

import moimmoimProject.domain.userDomain.ReceiptDo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ReceiptMapper {

    public void createReceipt(Long userIdNum);

    public void updateReceipt(Long userIdNum, int receiptMoney);

    public int checkReceipt(Long userIdNum);

    public ReceiptDo getReceipt(Long userIdNum);
}
