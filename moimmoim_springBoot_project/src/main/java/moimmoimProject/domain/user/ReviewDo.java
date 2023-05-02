package moimmoimProject.domain.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDo {
    private Long reviewNum;
    private Long reviewWriterIdNum;
    private Long reviewMoimNum;
    private int reviewScore; //별점
    private String reviewContent;
    private String reviewTitle;
    private LocalDate reviewDate;
}


