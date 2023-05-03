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
public class MoimDo {
    private Long moimNum;
    private Long moimHostUserIdNum;
    private String moimTitle;
    private String moimMainContent;
    private String moimImage;

    @DateTimeFormat(pattern = "YY/MM/DD/HH/MM/SS")
    private Date moimCreateDate;

    private int moimViewCount;
    private int moimCategoryNum;

    @DateTimeFormat(pattern = "YY/MM/DD/HH/MM/SS")
    private Date moimStartDate;

    @DateTimeFormat(pattern = "YY/MM/DD/HH/MM/SS")
    private Date moimEndDate;

    @DateTimeFormat(pattern = "YY/MM/DD/HH/MM/SS")
    private Date moimDeadLine;

    private int moimMemberCount;
    private int moimMemberMax;
    private int moimPrice;
    private Date moimDeadline;
    // private LocalDate moimJoinDate;
    private int moimDeadCheck;
    private int moimLocationNum;
}
