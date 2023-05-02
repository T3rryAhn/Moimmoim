package moimmoimProject.repository;

import moimmoimProject.domain.user.ProfileDo;

public interface ProfileRepository {

    ProfileDo save(ProfileDo profileDo);
    ProfileDo findByUserIdNum(Long userIdNum);
}
