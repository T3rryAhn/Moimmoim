package moimmoimProject.domain.pageDomain;

import lombok.AllArgsConstructor;
import lombok.Data;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.domain.reviewDomain.ReviewDo;
import moimmoimProject.domain.userDomain.UserProfileDto;

import java.util.List;

/**
 * 회원번호, 이름, 프로필 사진, 자기소개, 모임 횟수, 년생, 가입일, 리뷰, 모임, 관심있는
 * */
@Data
@AllArgsConstructor
public class ProfilePageDto {
    private final UserProfileDto userProfileDto;
    private final String userIntroduction;
    private final List<MoimDo> userMoimList;
    private final List<ReviewDo> userReviewList;
}
