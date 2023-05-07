package moimmoimProject.domain.userDomain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * USERS 테이블 정보 / 필수정보들
 * */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class UserDo {
    private Long userIdNum;
    private String userId;
    private String userEmail;
    private String userPassword;
    private String userName;
    private String userNickname;
    private String phoneNum;
    private String birth;
    private int categoryNum;
    private int hostLevelNum;
    private String location;
    private Date createDate;

}
