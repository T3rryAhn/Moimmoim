package moimmoimProject.domain.moimDomain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;


import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MoimDo {   // DB순서에 맞춘거
    private Long moimNum;
    private Long moimHostUserIdNum;
    private String moimTitle;
    private String moimMainContent;
    private String moimImage;

    private Date moimCreateDate;

    private int moimViewCount;
    private int moimCategoryNum;
    private Date moimStartDate;
    private Date moimEndDate;
    private int moimMemberCount;
    private int moimMemberMax;
    private int moimPrice;
    private Date moimDeadLine;
    private int moimDeadCheck;
    private int moimLocationNum;
}
