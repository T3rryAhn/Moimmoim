package moimmoimProject.repository;

import moimmoimProject.domain.reviewDomain.ReviewDo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewRepository {
    // ReviewDo save(ReviewDo review);
    List<ReviewDo> findByUserIdNum(Long userIdNum);

//    Optional<ReviewDo> findByName(String name);
//    List<ReviewDo> findAll();
//    List<ReviewDo> findByHostId(Long userIdNum);
}
