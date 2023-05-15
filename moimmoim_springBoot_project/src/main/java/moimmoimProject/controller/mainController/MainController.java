package moimmoimProject.controller.mainController;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.moimDomain.LocationDo;
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

    @GetMapping("/")
    public String mainPage(Model model) {
        List<MoimDo> moimListEat = moimMapper.findByCategory(1L);
        List<LocationDo> moimListEatLocation = new ArrayList<>();
        for (MoimDo moimDo : moimListEat) moimListEatLocation.add(moimService.findLocName(moimDo));
        List<MoimDo> moimListLook = moimMapper.findByCategory(2L);
        List<LocationDo> moimListLookLocation = new ArrayList<>();
        for (MoimDo moimDo : moimListLook) moimListLookLocation.add(moimService.findLocName(moimDo));
        List<MoimDo> moimListLearn = moimMapper.findByCategory(3L);
        List<LocationDo> moimListLearnLocation = new ArrayList<>();
        for (MoimDo moimDo : moimListLearn) moimListLearnLocation.add(moimService.findLocName(moimDo));
        List<MoimDo> moimListHeal = moimMapper.findByCategory(4L);
        List<LocationDo> moimListHealLocation = new ArrayList<>();
        for (MoimDo moimDo : moimListHeal) moimListHealLocation.add(moimService.findLocName(moimDo));
        List<MoimDo> moimListActive = moimMapper.findByCategory(5L);
        List<LocationDo> moimListActiveLocation = new ArrayList<>();
        for (MoimDo moimDo : moimListActive) moimListActiveLocation.add(moimService.findLocName(moimDo));
        List<MoimDo> moimListPopular = moimMapper.findAllbyPopular();
        moimService.checkDeadLine();

        model.addAttribute("moimListPopular", moimListPopular);
        model.addAttribute("moimListEat", moimListEat); // 4개 먹기 리스트
        model.addAttribute("moimListLook", moimListLook);// 4개 보기 리스트
        model.addAttribute("moimListLearn", moimListLearn);// 4개 배우기 리스트
        model.addAttribute("moimListHeal", moimListHeal);// 4개 힐링하기 리스트
        model.addAttribute("moimListActive", moimListActive);// 4개 체험하기 리스트
        model.addAttribute("moimListEatLocation", moimListEatLocation); // 4개 먹기 리스트
        model.addAttribute("moimListLookLocation", moimListLookLocation);// 4개 보기 리스트
        model.addAttribute("moimListLearnLocation", moimListLearnLocation);// 4개 배우기 리스트
        model.addAttribute("moimListHealLocation", moimListHealLocation);// 4개 힐링하기 리스트
        model.addAttribute("moimListActiveLocation", moimListActiveLocation);// 4개 체험하기 리스트

        return "/";
    }

}
