package moimmoimProject.domain.moimDomain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;


import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MoimDo {   // DB순서에 맞춘거
    private Long moimNum;
    private Long moimHostUserIdNum;
    private String moimTitle;
    private String moimMainContent;
    private String moimImage;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime moimCreateDate;
    private int moimViewCount;
    private int moimCategoryNum;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime moimStartDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime moimEndDate;
    private int moimMemberCount;
    private int moimMemberMax;
    private int moimPrice;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime moimDeadLine;
    private int moimDeadCheck;
    private Long moimLocationNum;

    public String DateToString(){
        return moimCreateDate.toString();
    }
}

