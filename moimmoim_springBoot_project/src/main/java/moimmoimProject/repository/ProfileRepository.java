package moimmoimProject.repository;

import moimmoimProject.domain.ProfileDo;

public interface ProfileRepository {

    ProfileDo save(ProfileDo profileDo);
    ProfileDo findByUserIdNum(Long userIdNum);
}
