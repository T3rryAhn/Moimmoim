package moimmoimProject.mapper;

import moimmoimProject.domain.reviewDomain.ReviewDo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {

    // List<ReviewDo> findByReviewNum(Long userIdNum);

    List<ReviewDo> findAllByUserIdNum(Long userIdNum);
}
