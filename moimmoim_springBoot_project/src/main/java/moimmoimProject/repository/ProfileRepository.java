package moimmoimProject.repository;

import moimmoimProject.domain.userDomain.ProfileDo;

public interface ProfileRepository {

    ProfileDo save(ProfileDo profileDo);
    ProfileDo findByUserIdNum(Long userIdNum);

}
