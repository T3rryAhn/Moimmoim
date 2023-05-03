package moimmoimProject.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Profile 테이블 정보 가져옴
 * */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProfileDo {

    private Long userIdNum;
    private String userProfileImage = "default url";
    private String userIntroduction;
    private Double userMoimReviewScoreAvg;
    private int userHostingCount;
    private String userBirth;
}
