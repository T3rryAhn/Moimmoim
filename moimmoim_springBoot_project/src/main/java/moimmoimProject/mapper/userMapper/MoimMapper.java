package moimmoimProject.mapper.userMapper;

import moimmoimProject.domain.user.MoimDo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MoimMapper {

    MoimDo findByMoimNum(Long userIdNum);

    List<MoimDo> findAllByUserIdNum(Long userIdNum);

}
