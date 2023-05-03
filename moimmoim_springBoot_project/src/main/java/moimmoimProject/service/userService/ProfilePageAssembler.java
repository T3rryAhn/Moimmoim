/*
package moimmoimProject.service.userService;


import moimmoimProject.domain.user.*;
import moimmoimProject.repository.MoimRepository;
import moimmoimProject.repository.ProfileRepository;
import moimmoimProject.repository.ReviewRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProfilePageAssembler {
    private final UserProfileAssembler userProfileAssembler;
    private final ProfileRepository profileRepository;
    private final MoimRepository moimRepository;
    private final ReviewRepository reviewRepository;

    // 생성자 주입
    public ProfilePageAssembler(UserProfileAssembler userProfileAssembler, ProfileRepository profileRepository, MoimRepository moimRepository, ReviewRepository reviewRepository) {
        this.userProfileAssembler = userProfileAssembler;
        this.profileRepository = profileRepository;
        this.moimRepository = moimRepository;
        this.reviewRepository = reviewRepository;
    }

    // 프로필 페이지 정보를 가져옵니다.
    public ProfilePageDto getProfilePage(Long userIdNum) {
        // 유저 정보를 가져옵니다.
        UserProfileDto userProfileDto = userProfileAssembler.getUserProfile(userIdNum);

        // 프로필 정보를 가져옵니다.
        ProfileDo profileDo = profileRepository.findByUserIdNum(userIdNum);

        // 모임 정보를 가져옵니다.
        List<MoimDo> userMoimList = moimRepository.findByUserIdNum(userIdNum);

        // 리뷰 정보를 가져옵니다.
        List<ReviewDo> userReviewList = reviewRepository.findByUserIdNum(userIdNum);

        // 프로필 페이지 정보를 만듭니다.
        ProfilePageDto profilePageDto = new ProfilePageDto(
                userProfileDto,
                profileDo.getUserIntroduction(),
                userMoimList,
                userReviewList
        );

        return profilePageDto;
    }

}
*/
