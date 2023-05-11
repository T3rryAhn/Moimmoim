package moimmoimProject.mapper;

import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.moimDomain.ImageDTO;
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

    void createMoim(MoimDo moimDo);                     // 모임 작성

    void deleteMoim(Long moimNum);                     // 모임 삭제

    void countView(Long moimNum);                      // 조회수 카운트

    List<Map<String, Object>> moimList(Long moimCategoryNum, String keyword, Criteria cri);   // 페이징한 모임 리스트 조회
    int moimListCnt(Long moimCategoryNum, String keyword);                                 // 모임 총 갯수

    LocationDo findLocationName(MoimDo moimDo);         // 지역번호로 지역 이름 반환

    void plusMemberCount(Long moimNum);

    void imageEnroll(ImageDTO imageDTO);

    List<ImageDTO> imageList(Long moimNum);

    void insertImage(String path, Long moimNum);

    List<LocationDo> locList1 ();

    List<Map<String, Object>> findAll(Criteria cri);

    List<MoimDo> findAllex(String keyword, Long moimCategoryNum);



}
