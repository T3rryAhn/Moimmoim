package moimmoimProject.controller.hostController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.moimDomain.Paging;
import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.domain.userDomain.UserProfileDto;
import moimmoimProject.service.ProfileService;
import moimmoimProject.service.UserProfileAssembler;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class HostController {

    private final ProfileService profileService;
    private final UserProfileAssembler userProfileAssembler;

    /*@GetMapping("/hostList")
    public String hostList(@Param("keyword") String keyword, Model model, Criteria cri, Long sorting){
        List<ProfileDo> list = profileService.getHostProfile();
//        int moimCount = profileService.countMoim(userIdNum);

        model.addAttribute("list", list);
        model.addAttribute("userName");
        model.addAttribute("moimCount");
        return "profileService/hostlist";
    }*/


    @GetMapping("/hostList")    // 모임 리스트
    public String profileList(@Param("moimCategoryNum") Long moimCategoryNum, @Param("keyword") String keyword, Model model, Criteria cri, Long sorting) {
        if(moimCategoryNum==null) moimCategoryNum = 6L;     // 카테고리 default 값
        if(keyword==null) keyword = "";
        if(sorting==null) sorting = 0L;

        List<String> nameList = profileService.getHostProfile();              // 레벨 값 리스트로 받아오기


        // 이게 int 이여야 함
        int profileListCnt = profileService.profileListCnt(moimCategoryNum, keyword);
        Paging paging = new Paging();
        paging.setCri(cri);
        paging.setTotalCount(profileListCnt);

        List<Map<String, Object>> proList = profileService.findAllProfileDo(moimCategoryNum, keyword, cri, sorting);
        List<String> list = profileService.getUser(proList);
        List<String> levelList = profileService.getHostLevelList(proList);
        

        model.addAttribute("levelList", levelList);
        model.addAttribute("list", list);
        model.addAttribute("nameList", nameList);
        model.addAttribute("proList", proList);                           // 프로필 리스트
        model.addAttribute("paging", paging);                       // 페이징 정보
        return "profileService/hostlist";
    }
}
