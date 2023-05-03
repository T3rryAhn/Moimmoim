package moimmoimProject.domain.user;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * USERS 테이블 정보 / 필수정보들
 * */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDo {
    private Long userIdNum; // USERID_NUM
    private String userId; // USER_ID
    private String userEmail; // USER_EMAIL
    private String userPassword; // PASSWORD
    private String userName; // USER_NAME
    private String userNickname; // USER_NICKNAME
    private String phoneNum; // PHONE_NUM
    private String birth; // BIRTH
    private int categoryNum; // CATEGORY_NUM
    private int hostLevelNum; // HOST_LEVEL_NUM
    private String location; // LOCATION_NUM
    private Date createDate; // CREATE_DATE
}
