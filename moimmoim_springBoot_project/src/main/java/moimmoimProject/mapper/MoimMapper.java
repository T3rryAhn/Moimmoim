package moimmoimProject.mapper;

import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.moimDomain.MoimDo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MoimMapper {

    // MoimDo findByMoimNum(Long userIdNum);

    List<MoimDo> findAllByUserIdNum(Long userIdNum);    // 유저의 모임들 찾기
    MoimDo findAllByMoimNum(Long MoimNum);              // 모임 찾기
    List<MoimDo> findList(Long moimCategoryNum);        // 모든 모임 리스트
    void createMoim(MoimDo moimDo);                     // 모임 작성
    void updateMoim(MoimDo moimDo, MoimDo updateDo);    // 모임 수정
    void deleteMoim(Long moimNum);                     // 모임 삭제
    void countView(Long moimNum);                      // 조회수 카운트

    public List<MoimDo> moimList(Criteria cri, Long moimCategoryNum);

    public int moimListCnt();

    MoimDo findByMoimNum(Long moimNum);
}
