package moimmoimProject.domain.user;

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

    private Long userIdNum; // USERID_NUM
    private String userProfileImage = "default url"; // USER_PROFILE_IMAGE
    private String userIntroduction; // USER_INTRODUCE
    private Double userMoimReviewScoreAvg; // HOST_MOIM_REVIEW_SCORE_AVG
    private int userHostingCount; // HOSTING_COUNT
    // SELECT COUNT(MOIM_NUM) FROM USERS U, MOIM_POST M WHERE U.USERID_NUM = M.USERID_NUM
    private String userBirth; // YEAR_OF_BIRTH
}
