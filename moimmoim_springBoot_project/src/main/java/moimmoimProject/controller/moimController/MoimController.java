package moimmoimProject.controller.moimController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import moimmoimProject.domain.moimDomain.*;
import moimmoimProject.service.MoimService;
import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
@AllArgsConstructor
@Log4j2
public class MoimController {


    private final MoimService moimService;

    @GetMapping("/moim")
    public String hello() {
        return "moimService/index";
    }   // 테스트 용



    @GetMapping("/moim/new")
    public String moimForm(Model model) {
        List<LocationDo> locList1 = moimService.locList1();
        model.addAttribute("locList1",locList1);
        return "moimService/moimWrite";
    }   // 모임 생성 페이지로 이동

    @GetMapping("/moim/getMoim/list")    // 모임 리스트
    public String moimList(@Param("moimCategoryNum") Long moimCategoryNum, @Param("keyword") String keyword, Model model, Criteria cri) {
        if(moimCategoryNum==null) moimCategoryNum = 6L;     // 카테고리 default 값
        if(keyword==null) keyword = "";
        // 이게 int 이여야 함
        int moimListCnt = moimService.moimListCnt(moimCategoryNum, keyword);
        Paging paging = new Paging();
        paging.setCri(cri);
        paging.setTotalCount(moimListCnt);

        List<Map<String, Object>> list = moimService.moimList(moimCategoryNum, keyword, cri);
        List<LocationDo> locList = moimService.getLocList(list);

        model.addAttribute("moimCategoryNum",moimCategoryNum);      // 페이징 용
        moimCategoryNum = null;
        model.addAttribute("locList",locList);                      // 지역 리스트
        model.addAttribute("list", list);                           // 모임 리스트
        model.addAttribute("paging", paging);                       // 페이징 정보
        return "moimService/list";
    }


    @PostMapping("moim/getMoim/{moimHostUserIdNum}")    // 유저 넘버로 모임을 찾음
    public String findMoimByUserId(@PathVariable("moimHostUserIdNum") Long userNum, Model model){
        List<MoimDo> MoimList= moimService.getMoimByUserIdNum(userNum);
        model.addAttribute("moimList", MoimList);
        return "";  // 페이지 삽입해야함
    }
    @GetMapping("moim/getMoim/getMoim")    // 모임 넘버로 모임 리스트를 찾음
    public String findMoimByMoimNum(@Param("moimNum") Long moimNum, Model model, HttpSession session){
        MoimDo moimDo = moimService.getMoimByMoimNum(moimNum);                          // 해당 모임 반환
        LocationDo locationDo = moimService.findLocName(moimDo);                        // 해당 모임 location 반환
        String category = moimService.getCatName(moimDo.getMoimCategoryNum());          // 카테고리 이름 반환
        moimService.CountView(moimNum);// 조회수 증가
        List<ImageDTO> imageList = moimService.imageList(moimNum);


        // 세션에서 사용자 ID를 검색합니다.
        Long userIdNum = (Long) session.getAttribute("userIdNum");
        model.addAttribute("userIdNum", userIdNum);

        model.addAttribute("imageList", imageList);
        model.addAttribute("category", category);
        model.addAttribute("locationDo", locationDo);
        model.addAttribute("moimDo", moimDo);
//        model.addAttribute("userIdNum", 1);                     // 임시 유저 아이디 넘 1

        return "moimService/detailMoim";  // 페이지 삽입해야함
    }

    @PostMapping("/moim/new")               // 새로운 모임 생성
    public String createNewMoim(@Param("MoimDo") MoimDo moimDo,@Param("uploadFile") MultipartFile[] uploadFile,@Param("sigFile")MultipartFile sigFile){
        File uploadPath =  moimService.makeFolder();    // 폴더 생성
        List<ImageDTO> list = new ArrayList<>();        //  ImageDTO 리스트

        String path = moimService.makePathSig(sigFile,uploadPath);    // 대표 사진 파일 업로드
        moimDo.setMoimImage(path);
        moimService.createMoim(moimDo);
        for (MultipartFile multipartFile : uploadFile) {    // 사진들 파일 업로드
            ImageDTO imageDTO = moimService.makePath(multipartFile,uploadPath,moimDo.getMoimNum());
            list.add(imageDTO);
        }   // end for

        moimService.imageEnroll(list);
        return "moimService/index";
    }

    @GetMapping("/moim/count/{moimNum}")          // 조회수 카운트
    public void countView(@PathVariable("moimNum") Long moimNum){
        moimService.CountView(moimNum);
    }

}
