package moimmoimProject.domain.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDo {
    private Long reviewNum; // REVIEW_NUM
    private Long reviewWriterIdNum; // USERID_NUM
    private Long reviewMoimNum; // MOIM_NUM
    private int reviewScore; //별점 // STAR
    private String reviewContent; // CONTENT
    private String reviewTitle; // TITLE
    private LocalDate reviewDate; // CREATED_DATE
}


