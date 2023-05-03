package moimmoimProject.domain.userDomain;


import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 사용자 요약 정보 ( 프사, 이름, 닉네임 등 다목적으로 쓰이는 간단한 프로필 Dto 객체
 * 비즈니스 로직 <-> UI 간의 데이터 전송
 * */

@Data
@AllArgsConstructor
public class UserSimpleProfileDto {
    private final Long userId_num;
    private final String name;
    private final String nickName;
    private final String profileImage;

}


