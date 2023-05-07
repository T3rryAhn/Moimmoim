package moimmoimProject.domain.moimDomain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MoimDo {   // DB순서에 맞춘거
    private Long moimNum;
    private Long moimHostUserIdNum;
    private String moimTitle;
    private String moimMainContent;
    private String moimImage;
    private Timestamp moimCreateDate;
    private int moimViewCount;
    private int moimCategoryNum;
    private Timestamp moimStartDate;
    private Timestamp moimEndDate;
    private int moimMemberCount;
    private int moimMemberMax;
    private int moimPrice;
    private Timestamp moimDeadLine;
    private int moimDeadCheck;
    private int moimLocationNum;


}
