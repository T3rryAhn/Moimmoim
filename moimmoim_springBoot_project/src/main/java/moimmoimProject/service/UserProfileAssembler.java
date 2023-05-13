package moimmoimProject.service;



import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.domain.userDomain.UserProfileDto;
import moimmoimProject.mapper.ProfileMapper;
import moimmoimProject.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserProfileAssembler {
    private final UserMapper userMapper;
    private final ProfileMapper profileMapper;

    //생성자 주입
    public UserProfileAssembler(UserMapper userMapper, ProfileMapper profileMapper) {
        this.userMapper = userMapper;
        this.profileMapper = profileMapper;
    }

    public UserProfileDto getUserProfile(Long userIdNum) {
        UserDo userDo = userMapper.findByUserIdNum(userIdNum);
        ProfileDo profileDo = profileMapper.findByUserIdNum(userIdNum);

        // Do 객체에서 필요한 정보를 가져와서 Dto 객체에 값을 넣어줍니다.
        UserProfileDto userProfileDto = new UserProfileDto(
                userDo.getUserIdNum(),
                userDo.getUserName(),
                userDo.getUserNickname(),
                profileDo.getUserProfileImage(),
                profileDo.getUserMoimReviewScoreAvg(),
                profileDo.getUserHostingCount(),
                profileDo.getUserBirth(),
                userDo.getUserEmail(),
                userDo.getCreateDate(),
                userDo.getPhoneNum(),
                userDo.getCategoryNum(),
                userDo.getHostLevelNum()
        );

        return userProfileDto;
    }

}
