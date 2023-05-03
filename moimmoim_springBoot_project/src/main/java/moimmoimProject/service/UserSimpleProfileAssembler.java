/*
package moimmoimProject.service;


import moimmoimProject.domain.ProfileDo;
import moimmoimProject.domain.UserDo;
import moimmoimProject.domain.UserSimpleProfileDto;
import moimmoimProject.mapper.ProfileMapper;
import moimmoimProject.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserSimpleProfileAssembler {
    private final UserMapper userMapper;
    private final ProfileMapper profileMapper;

//생성자 // user, profile 매퍼 넣어주기
    public UserSimpleProfileAssembler(UserMapper userMapper, ProfileMapper profileMapper){
        this.userMapper = userMapper;
        this.profileMapper = profileMapper;
    }

//Dto 생성메서드
    public UserSimpleProfileDto getUserSimpleProfile(Long userIdNum) {
        UserDo userDo = userMapper.findByUserIdNum(userIdNum);
        ProfileDo profileDo = profileMapper.findByUserIdNum(userIdNum);


        // Do 객체에서 필요한 정보를 가져와서 Dto 객체에 값을 넣어줍니다.
        UserSimpleProfileDto userSimpleProfileDto = new UserSimpleProfileDto(
                userDo.getUserIdNum(),
                userDo.getUserName(),
                userDo.getUserNickname(),
                profileDo.getUserProfileImage()
        );

        return userSimpleProfileDto;
    }
}
*/
