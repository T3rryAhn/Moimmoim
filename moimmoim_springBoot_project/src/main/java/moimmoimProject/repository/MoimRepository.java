package moimmoimProject.repository;

import moimmoimProject.domain.user.MoimDo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MoimRepository {

    MoimDo save(MoimDo moim);
    List<MoimDo> findByUserIdNum(Long userIdNum);

    //    Optional<MoimDo> findByName(String name);
    //    List<MoimDo> findAll();
    //    List<MoimDo> findByHostId(Long userId);
}
