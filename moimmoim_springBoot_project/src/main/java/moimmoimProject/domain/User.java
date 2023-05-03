package moimmoimProject.domain;

import lombok.Data;

import java.util.Date;

@Data
public class User {
   private Long useridNum;
   private String userId;
   private String userEmail;
   private String userPassword;
   private String userName;
   private String userNickName;
   private int phoneNum;
   private String birth;
   private int categoryNum;
   private int hostLevelNum;
   private String location;
   private Date createDate;


    public User(){

    }
}
