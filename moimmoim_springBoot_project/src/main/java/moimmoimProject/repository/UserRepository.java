package moimmoimProject.repository;

import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.domain.userDomain.UserDo;

import java.util.List;

public interface UserRepository {
    UserDo save(UserDo user);
    UserDo findByUserIdNum(Long userIdNum);
    List<UserDo> findAll();
    //
//    UserDo findByUserId(Long userId);
//
    ProfileDo findProfileByUserIdNum(Long userIdNum);
}
