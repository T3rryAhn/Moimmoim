package moimmoimProject.mapper;

import moimmoimProject.domain.reviewDomain.ReviewDo;

import java.util.List;

//@Mapper
public interface ReviewMapper {

    List<ReviewDo> findByReviewNum(Long userIdNum);

    List<ReviewDo> findAllByUserIdNum(Long userIdNum);
}
