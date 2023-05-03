package moimmoimProject.domain.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MoimDo {
    private Long moimNum; // MOIM_NUM
    private Long moimHostUserIdNum; // USERID_NUM
    private String moimTitle; // MOIM_TITLE
    private String moimMainContent; // MOIM_MAIN
    private String moimImage; // MOIM_PICTURES
    private LocalDate moimCreateDate; // MOIM_CREATE_DATE
    private int moimViewCount; // MOIM_VIEWS
    private int moimCategoryNum; // CATEGORY_NUM
    private LocalDate moimStartDate; // MOIM_START_TIME
    private LocalDate moimEndDate; // MOIM_END_TIME
    private LocalDate moimDeadLine; // MOIM_DEADLINE
    private int moimMemberCount; // MOIM_MEMBER_COUNT
    private int moimMemberMax; // MOIM_MEMBER_MAX
    private int moimPrice; // MOIM_PRICE
    // private LocalDate moimJoinDate; // MOIM_DATE_JOIN
    private int moimDeadCheck; // MOIM_DEAD_CHECK
    private int moimLocationNum; // LOCATION_NUM
}
