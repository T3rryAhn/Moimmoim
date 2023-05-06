package moimmoimProject.controller.moimController;

import lombok.AllArgsConstructor;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.service.MoimService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.sql.SQLException;
import java.util.List;

@Controller
@AllArgsConstructor
public class MoimController {

    private final MoimService moimService;

    @GetMapping("/moim")
    public String hello() {
        return "moimService/index";
    }   // 테스트 용

    @GetMapping("/moim/new")
    public String moimForm() {
        return "moimService/moimForm";
    }   // 모임 생성 페이지로 이동

    @GetMapping("/moim/getMoim/list")    // 모임 리스트
    public String moimList(@Param("moimCategoryNum") Long moimCategoryNum) {
        List<MoimDo> moimDoList = moimService.getMoimList(moimCategoryNum);
        return "";  // 페이지 삽입해야함
    }
    @PostMapping("moim/getMoim/{uesrId}")    // 모임 넘버로 모임을 찾음
    public String findMoimByUserId(@PathVariable("moimHostUserIdNum") Long userNum, Model model){
        List<MoimDo> MoimList= moimService.getMoimByUserIdNum(userNum);
        model.addAttribute("moimDo", MoimList);
        return "";  // 페이지 삽입해야함
    }
    @PostMapping("moim/getMoim/{moimNum}")    // 유저 넘버로 모임 리스트를 찾음
    public String findMoimByMoimNum(@PathVariable("moimNum") Long moimNum, Model model){
        MoimDo moimDo = moimService.getMoimByMoimNum(moimNum);
        model.addAttribute("moimDo", moimDo);
        return "";  // 페이지 삽입해야함
    }

    @PostMapping("/moim/new")               // 새로운 모임 생성
    public String createNewMoim(@Param("MoimDo") MoimDo moimDo){
        moimService.createMoim(moimDo);
        return "moimService/index";
    }

    @GetMapping("/moim/{moimNum}")
    public  void countView(@PathVariable("moimNum") Long moimNum){
        moimService.CountView(moimNum);
    }

}
