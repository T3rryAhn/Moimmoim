package moimmoimProject.service.userService;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.FindIdPwMapper;
import org.apache.naming.java.javaURLContextFactory;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FindIdPwService {
    private final FindIdPwMapper findIdPwMapper;
    private final JavaMailSender javaMailSender;

    //회원 존재 시 이메일과 아이디 반환
    public UserDo checkUser(UserDo user){
        if(user == null){
            return null;
        }
        else{
           return findIdPwMapper.checkUser(user);
        }
    }
    // 이메일에 아이디 전송
    public String sendIdToEmail(UserDo user) throws Exception{
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("huiung011@naver.com");
            message.setTo(user.getUserEmail());
            message.setSubject("모임모임 아이디찾기 서비스");
            message.setText("id:"+user.getUserId());
            javaMailSender.send(message);
            return user.getUserId();
        }catch (Exception e){
            throw e;
        }
    }
}
