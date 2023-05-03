package moimmoimProject.repository;

import moimmoimProject.domain.ProfileDo;
import moimmoimProject.domain.UserDo;

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
