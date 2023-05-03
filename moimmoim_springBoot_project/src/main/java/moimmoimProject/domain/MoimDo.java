package moimmoimProject.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MoimDo {
    private Long moimNum;
    private Long moimHostUserIdNum;
    private String moimTitle;
    private String moimMainContent;
    private String moimImage;
    private LocalDate moimCreateDate;
    private int moimViewCount;
    private int moimCategoryNum;
    private LocalDate moimStartDate;
    private LocalDate moimEndDate;
    private LocalDate moimDeadLine;
    private int moimMemberCount;
    private int moimMemberMax;
    private int moimPrice;
    // private LocalDate moimJoinDate;
    private int moimDeadCheck;
    private int moimLocationNum;
}
