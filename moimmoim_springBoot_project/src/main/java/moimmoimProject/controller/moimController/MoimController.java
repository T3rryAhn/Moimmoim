package moimmoimProject.controller.moimController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import moimmoimProject.domain.moimDomain.*;
import moimmoimProject.service.MoimService;
import org.apache.ibatis.annotations.Param;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;
import java.sql.*;
import java.util.Date;

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
    public String moimForm() {
        return "moimService/moimWrite";
    }   // 모임 생성 페이지로 이동

    @GetMapping("/moim/getMoim/list")    // 모임 리스트
    public String moimList(@Param("moimCategoryNum") Long moimCategoryNum, Model model, Criteria cri) {
        if(moimCategoryNum==null) moimCategoryNum = 1L;     // 카테고리 default 값

        // 이게 int 이여야 함
        int moimListCnt = moimService.moimListCnt(moimCategoryNum);
        Paging paging = new Paging();
        paging.setCri(cri);
        paging.setTotalCount(moimListCnt);

        List<Map<String, Object>> list = moimService.moimList(cri,moimCategoryNum);
        List<LocationDo> locList = moimService.getLocList(list);

        model.addAttribute("moimCategoryNum",moimCategoryNum);      // 페이징 용
        model.addAttribute("locList",locList);                      // 지역 리스트
        model.addAttribute("list", list);                           // 모임 리스트
        model.addAttribute("paging", paging);                       // 페이징 정보
        return "moimService/list";
    }
    @PostMapping("moim/getMoim/{moimHostUserIdNum}")    // 모임 넘버로 모임을 찾음
    public String findMoimByUserId(@PathVariable("moimHostUserIdNum") Long userNum, Model model){
        List<MoimDo> MoimList= moimService.getMoimByUserIdNum(userNum);
        model.addAttribute("moimList", MoimList);
        return "";  // 페이지 삽입해야함
    }
    @GetMapping("moim/getMoim/getMoim")    // 유저 넘버로 모임 리스트를 찾음
    public String findMoimByMoimNum(@Param("moimNum") Long moimNum, Model model){
        MoimDo moimDo = moimService.getMoimByMoimNum(moimNum);                          // 해당 모임 반환
        LocationDo locationDo = moimService.findLocName(moimDo);                        // 해당 모임 location 반환
        String category = moimService.getCatName(moimDo.getMoimCategoryNum());          // 카테고리 이름 반환
        moimService.CountView(moimNum);                                                 // 조회수 증가
        List<ImageDTO> imageList = moimService.imageList(moimNum);

        model.addAttribute("imageList", imageList);
        model.addAttribute("category", category);
        model.addAttribute("locationDo", locationDo);
        model.addAttribute("moimDo", moimDo);
        return "moimService/detailMoim";  // 페이지 삽입해야함
    }

    @PostMapping("/moim/new")               // 새로운 모임 생성
    public String createNewMoim(@Param("MoimDo") MoimDo moimDo){
        moimService.createMoim(moimDo);
        return "moimService/index";
    }

    @GetMapping("/moim/count/{moimNum}")          // 조회수 카운트
    public void countView(@PathVariable("moimNum") Long moimNum){
        moimService.CountView(moimNum);
    }

    @PostMapping("uploadFormAction")
    public String uploadFormPost(MultipartFile[] uploadFile, Model model) {

        String uploadFolder="C:\\upload\\";
        // 폴더 생성
        File uploadPath =  new File(uploadFolder, getFolder());
        log.info("upload path : " + uploadPath);

        if(uploadPath.exists() == false){
            uploadPath.mkdirs();
        }
        List<ImageDTO> list = new ArrayList<>();

        for (MultipartFile multipartFile : uploadFile) {
            ImageDTO imageDTO = new ImageDTO();

            String uploadFileName = multipartFile.getOriginalFilename();
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
            imageDTO.setFileName(uploadFileName);   // 객체에 삽입

            UUID uuid = UUID.randomUUID();                              //UUID 생성
            imageDTO.setUuid(uuid.toString());      // 객체에 삽입

            uploadFileName = uuid.toString() + "-" + uploadFileName;
            imageDTO.setUploadPath(uploadPath.toString().substring(9)+"\\");  // 객체에 삽입
            log.info(uploadPath);
            File saveFile = new File(uploadPath,uploadFileName);                              // 폴더 안에 하위 폴더를 만든 후 저장
            // File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());     // 그냥 폴더에 저장

            try{
                multipartFile.transferTo(saveFile);
            }catch (Exception e){
                e.printStackTrace();
            }
            list.add(imageDTO);
        }   // end for

        moimService.imageEnroll(list);
        return "moimService/index";
    }

    private String getFolder(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        return str.replace("-",File.separator);
    }

}
