package moimmoimProject.controller.mainController;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.mapper.UserMapper;
import moimmoimProject.service.MoimService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final MoimMapper moimMapper;
    private final MoimService moimService;

    @GetMapping("/main")
    public String mainPage(Model model) {
        List<MoimDo> moimListEat = moimMapper.findByCategory(1L);
        List<MoimDo> moimListLook = moimMapper.findByCategory(2L);
        List<MoimDo> moimListLearn = moimMapper.findByCategory(3L);
        List<MoimDo> moimListHeal = moimMapper.findByCategory(4L);
        List<MoimDo> moimListActive = moimMapper.findByCategory(5L);
        List<MoimDo> moimListPopular = moimMapper.findAllbyPopular();

        model.addAttribute("moimListPopular", moimListPopular);
        model.addAttribute("moimListEat", moimListEat); // 4개 먹기 리스트
        model.addAttribute("moimListLook", moimListLook);// 4개 보기 리스트
        model.addAttribute("moimListLearn", moimListLearn);// 4개 배우기 리스트
        model.addAttribute("moimListHeal", moimListHeal);// 4개 힐링하기 리스트
        model.addAttribute("moimListActive", moimListActive);// 4개 체험하기 리스트

        return "/main";
    }

/*    @GetMapping("/moimService/getMoimByCategory")
    public List<MoimDo> getMoimByCategory(@RequestParam("categoryNum") Long categoryNum) {
        List<MoimDo> moimList = new ArrayList<>();
        try {
            // Retrieve MoimDo objects from database based on categoryNum using your moimMapper
            moimList = moimMapper.findByCategory(categoryNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return moimList;
    }*/

}
