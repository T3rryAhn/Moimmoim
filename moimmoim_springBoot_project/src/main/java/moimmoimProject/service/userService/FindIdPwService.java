package moimmoimProject.service.userService;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.FindIdPwMapper;
import org.apache.naming.java.javaURLContextFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class FindIdPwService {
    private final FindIdPwMapper findIdPwMapper;
    private final JavaMailSender javaMailSender;
    @Autowired
    private HttpServletRequest request;

    //아이디 찾기 :이름, 이메일 입력받고 회원 유뮤 판단
    public UserDo checkUser(UserDo user){
        if(user == null){
            return null;
        }
        else{
           return findIdPwMapper.checkUser(user);
        }
    }
    //비밀번호 찾기 :아이디 이메일 입력받아 회원 유무 판단
    public UserDo findPw(UserDo user){
        if(user == null){
            return null;
        }
        else{
            return findIdPwMapper.findPw(user);
        }
    }
    // 아이디 찾기 : 이메일에 아이디 전송
    public String sendIdToEmail(UserDo user) throws Exception{
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("javatree6@naver.com");
            message.setTo(user.getUserEmail());
            message.setSubject("모임모임 아이디찾기 서비스");
            message.setText("id:"+user.getUserId());
            javaMailSender.send(message);
            return user.getUserId();
        }catch (Exception e){
            throw e;
        }
    }

    //비밀번호 찾기 : 이메일에 코드 전송
    public String sendCodeToEmail(UserDo user){

        HttpSession session = request.getSession();
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
        session.setAttribute("code", code);
        session.setAttribute("userIdNum", user.getUserIdNum());
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("javatree6@naver.com");
            message.setTo(user.getUserEmail());
            message.setSubject("모임모임 비밀번호 찾기 서비스");
            message.setText("code: "+session.getAttribute("code") +"\n" +"userIdNum:"+session.getAttribute("userIdNum"));
            javaMailSender.send(message);
            return session.getId();
        }catch (Exception e){
            throw e;
        }
    }

    //비밀번호 찾기 : 비밀번호 갱신
    public void resetPw(String password,HttpSession session){
        Long userIdNum = (Long) session.getAttribute("userIdNum");
        findIdPwMapper.resetPw(userIdNum, password);
    }
}
