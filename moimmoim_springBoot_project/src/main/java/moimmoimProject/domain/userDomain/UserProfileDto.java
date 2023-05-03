package moimmoimProject.domain.userDomain;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class UserProfileDto {
    private final Long userIdNum;
    private final String userName;
    private final String userNickName;
    private final String userProfileImage;
    private final Double userMoimReviewScoreAvg;
    private final Integer userHostingCount;
    private final String userBirth;
    private final String userEmail;
    private final Date userCreateDate;
    private final String phoneNum;
//    private final int userFavoriteCategoryNum;

}
