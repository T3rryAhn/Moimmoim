package moimmoimProject.service.userService;


import moimmoimProject.domain.user.*;
import moimmoimProject.mapper.userMapper.MoimMapper;
import moimmoimProject.mapper.userMapper.ProfileMapper;
import moimmoimProject.mapper.userMapper.ReviewMapper;
import moimmoimProject.repository.MoimRepository;
import moimmoimProject.repository.ProfileRepository;
import moimmoimProject.repository.ReviewRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProfilePageAssembler {
    private final UserProfileAssembler userProfileAssembler;
    private final ProfileMapper profileMapper;
    private final MoimMapper moimMapper;
    private final ReviewMapper reviewMapper;

    // 생성자 주입
    public ProfilePageAssembler(UserProfileAssembler userProfileAssembler, ProfileMapper profileMapper, MoimMapper moimMapper, ReviewMapper reviewMapper) {
        this.userProfileAssembler = userProfileAssembler;
        this.profileMapper = profileMapper;
        this.moimMapper = moimMapper;
        this.reviewMapper = reviewMapper;
    }

    // 프로필 페이지 정보를 가져옵니다.
    public ProfilePageDto getProfilePage(Long userIdNum) {
        // 유저 정보를 가져옵니다.
        UserProfileDto userProfileDto = userProfileAssembler.getUserProfile(userIdNum);

        // 프로필 정보를 가져옵니다.
        ProfileDo profileDo = profileMapper.findByUserIdNum(userIdNum);

        // 모임 정보를 가져옵니다.
        List<MoimDo> userMoimList = moimMapper.findAllByUserIdNum(userIdNum);

        // 리뷰 정보를 가져옵니다.
        List<ReviewDo> userReviewList = reviewMapper.findAllByUserIdNum(userIdNum);

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
