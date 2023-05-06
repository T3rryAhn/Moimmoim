package moimmoimProject.controller.moimController;

import lombok.AllArgsConstructor;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.service.MoimService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    }

    @GetMapping("/moim/new")
    public String moimForm() {
        return "moimService/moimForm";
    }

    @GetMapping("/moim/getMoim/Alllist")
    public String moimList(@Param("moimDo") MoimDo moimDo) {
        moimService.createMoim(moimDo);
        return "";  // 페이지 삽입해야함
    }
    @PostMapping("moim/getMoim/userId")    // 모임 넘버로 모임을 찾음
    public String findMoimByUserId(@Param("moimHostUserIdNum") Long userNum, Model model){
        List<MoimDo> MoimList= moimService.getMoimByUserIdNum(userNum);
        model.addAttribute("moimDo", MoimList);
        return "";  // 페이지 삽입해야함
    }
    @PostMapping("moim/getMoim/moimNum")    // 유저 넘버로 모임 리스트를 찾음
    public String findMoimByMoimNum(@Param("moimNum") Long moimNum, Model model){
        MoimDo moimDo = moimService.getMoimByMoimNum(moimNum);
        model.addAttribute("moimDo", moimDo);
        return "";  // 페이지 삽입해야함
    }

    @PostMapping("/moim/new")               // 새로운 모임 생성
    public String createNewMoim(@ModelAttribute MoimDo moimDo){
        moimService.createMoim(moimDo);
        return "moimService/index";
    }
}
