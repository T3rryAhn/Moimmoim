package moimmoimProject.service.userService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.UserMapper;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {
    private final UserMapper userMapper;
    private final JavaMailSender javaMailSender;

    //회원가입 시 id중복 검사
    public String idCheck(String userId)
    { String result =
        userMapper.idCheck(userId);
        return result;
    };

    //회원가입 시 email 중복 검사
    public String emailCheck(String userEmail){
        String result = userMapper.emailCheck(userEmail);
        return result;
    }

    //회원가입 시 이메일로 인증코드 보내기
    public String sendcodeToEmail(String userEmail){

        //코드 랜덤 생성 10자리:5개 문자 + 5개 숫자
        char[] codeCharArry = new char[5];
        int[]  codeIntArry = new int[5];
        String code ="";
        String charCodes ="";
        String intCodes ="";
        Random random = new Random();
        for(int i=0; i<5; i++){
            codeCharArry[i] = (char)(random.nextInt(58)+65);

        } charCodes =new String(codeCharArry);

        for(int i=0; i<5; i++){
            codeIntArry[i] = random.nextInt(10);
            String num =  String.valueOf(codeIntArry[i]);
            intCodes = intCodes.concat(num);
            //log.info(intCodes);
        }

        code = code.concat(charCodes).concat(intCodes);

        //회원가입 시도한 email에 코드 보내기
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("huiung011@naver.com");
        message.setTo(userEmail);
        message.setSubject("모임모임 회원가입 인증 코드");
        message.setText("code:"+code);
        javaMailSender.send(message);
        return code;
    }

    //회원가입 시 전화번호 등록 여부 확인
    public Integer phoneCheck(String phoneNum){
        int intPhoneNum = Integer.parseInt(phoneNum);
        return userMapper.phoneCheck(phoneNum);
    }

    //회원 등록 STEP1
    public void addUserStep1( UserDo user){
            userMapper.addUserStep1(user);
       }

    //회원 등록 STEP1
    public void addUserStep2( UserDo user){
        userMapper.addUserStep2(user);
    }
}

