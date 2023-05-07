package moimmoimProject.service.userService;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.LoginMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final LoginMapper loginMapper;

    //로그인 시 등록된 회원인지 검사
    public UserDo checkUser(UserDo user){
    UserDo returnUser =loginMapper.checkUser(user);
    if(returnUser != null){
        return returnUser;
    }
    else{
        return null;
    }
    }
}
