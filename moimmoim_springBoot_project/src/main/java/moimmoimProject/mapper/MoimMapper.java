package moimmoimProject.mapper;

import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.moimDomain.LocationDo;
import moimmoimProject.domain.moimDomain.MoimDo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MoimMapper {

    // MoimDo findByMoimNum(Long userIdNum);

    List<MoimDo> findAllByUserIdNum(Long userIdNum);    // 유저의 생성 모임들 찾기

    MoimDo findAllByMoimNum(Long moimNum);              // 모임 찾기

    List<MoimDo> findList(int moimCategoryNum);        // 모든 모임 리스트

    void createMoim(MoimDo moimDo);                     // 모임 작성

    void updateMoim(MoimDo moimDo, MoimDo updateDo);    // 모임 수정

    void deleteMoim(Long moimNum);                     // 모임 삭제

    void countView(Long moimNum);                      // 조회수 카운트

    List<Map<String, Object>> moimList(Criteria cri, int moimCategoryNum);   // 페이징한 모임 리스트 조회
    int moimListCnt();                           // 모임 총 갯수

    LocationDo findLocationName(MoimDo moimDo);

}
