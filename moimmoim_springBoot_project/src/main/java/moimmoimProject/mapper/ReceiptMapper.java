package moimmoimProject.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReceiptMapper {

    public void createReceipt(Long userIdNum);

    public void updateReceipt(Long userIdNum, int amount);

    public void checkReceipt(Long userIdNum);
}
