package moimmoimProject.controller.myPageController;


import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.domain.pageDomain.ProfilePageDto;
import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.mapper.ProfileMapper;
import moimmoimProject.mapper.UserMapper;
import moimmoimProject.service.MoimService;
import moimmoimProject.service.ProfilePageAssembler;
import moimmoimProject.service.ProfileService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/myPage")
public class MyPageController {

    private final UserMapper userMapper;
    private final MoimService moimService;
    private final ProfileMapper profileMapper;
    private final ProfilePageAssembler profilePageAssembler;
    private final ProfileService profileService;

    @GetMapping("{userIdNum}")
    public String findByUserIdNum(@PathVariable Long userIdNum, Model model){
        profileEditor(userIdNum, model, profileMapper, profilePageAssembler, moimService, profileService);

        return "/myPageService/myPage";
    }


    @GetMapping("/myJoinMoim")
    public String myJoinMoim(HttpSession session, String keyword, Criteria cri, Model model){
        Long userIdNum = (Long)session.getAttribute("userIdNum");   //세션에서 넘버 받기
        moimService.checkDeadLine();

        List<Long> numList = moimService.findMoimed(userIdNum);     // 유저의 참가한 모임 넘 리스트를 얻음
        List<MoimDo> openList = new ArrayList<>();
        List<MoimDo> closeList = new ArrayList<>();
        int i=0;
        while(true){
            MoimDo moimDo = moimService.getMoimByMoimNum(numList.get(i));
            if(moimDo.getMoimDeadCheck()==0){
                openList.add(moimDo);
            }else{
                closeList.add(moimDo);
            }

            if(numList.size()-1 > i){
                i++;
            }else{
                break;
            }
        }

        model.addAttribute("make","2");
        model.addAttribute("openList", openList);
        model.addAttribute("closeList", closeList);

        return "myPageService/myCreateMoim";
    }

    @GetMapping("/myMadeMoim")
    public String myMadeMoim(HttpSession session, String keyword, Criteria cri, Model model) {
        Long userIdNum = (Long) session.getAttribute("userIdNum");   //세션에서 넘버 받기
        List<MoimDo> list = moimService.getMoimByUserIdNum(userIdNum);
        List<MoimDo> openList = new ArrayList<>();
        List<MoimDo> closeList = new ArrayList<>();
        moimService.checkDeadLine();

        int i = 0;
        while (true) {
            MoimDo moimDo = list.get(i);
            if (moimDo.getMoimDeadCheck() == 0) {
                openList.add(moimDo);
            } else {
                closeList.add(moimDo);
            }
            if (list.size() - 1 > i) {
                i++;
            } else {
                break;
            }
        }
            model.addAttribute("make","1");
            model.addAttribute("openList", openList);
            model.addAttribute("closeList", closeList);
            System.out.println("closeList : " + closeList);
            System.out.println("openList : " + openList);

        return "myPageService/myCreateMoim";
    }

    @GetMapping("/profileEdit/{userIdNum}")
    public String profileEdit(@PathVariable Long userIdNum, Model model) {
        profileEditor(userIdNum, model, profileMapper, profilePageAssembler, moimService, profileService);
        return "/myPageService/profileEdit";
    }

    @PostMapping("/profileEdit/{userIdNum}")
    public String updateProfile(@Param("UserDO") UserDo userDo, @Param("ProfileDo") ProfileDo profileDo,
                                HttpSession session) {
        Long userIdNum = (Long)session.getAttribute("userIdNum");
        profileMapper.updateIntroduce(profileDo.getUserIntroduction(), profileDo.getUserBirth(), userIdNum);
        userMapper.userProfileEdit(userDo.getUserNickname(), userDo.getPhoneNum(), userDo.getCategoryNum(), userIdNum);
        return "redirect:/myPage/profileEdit/{userIdNum}";
    }

    static void profileEditor(@PathVariable Long userIdNum, Model model, ProfileMapper profileMapper,
                              ProfilePageAssembler profilePageAssembler, MoimService moimService,
                              ProfileService profileService) {
        ProfileDo profileDo = profileMapper.findByUserIdNum(userIdNum);
        if(profileDo == null) {
            profileMapper.insertProfileDefault(userIdNum); // 회원가입 직후에 프로필 객체가 없을 경우, 설정한 임의의 디폴트 값 insert
        }
        ProfilePageDto profilePageDto = profilePageAssembler.getProfilePage(userIdNum);
        List<MoimDo> moimDoList = profilePageDto.getUserMoimList();
        List<MoimDo> openMoimDoList = new ArrayList<>();    // open에 표시할 모임 List
        List<MoimDo> closedMoimDoList = new ArrayList<>();  // closed에 표시할 모임 List
        List<String> locationList = new ArrayList<>();
        List<String> categoryList = new ArrayList<>();
        String categoryName = moimService.getCatName(profilePageDto.getUserProfileDto().getUserCategoryNum());
        String hostLevelName = profileService.getHostLevelName(profilePageDto.getUserProfileDto().getUserHostLevelNum());
        for (int i = 0; i < moimDoList.size(); i++) {
            locationList.add(moimService.findLocName(moimDoList.get(i)).getLocationName());
            categoryList.add(moimService.getCatName(moimDoList.get(i).getMoimCategoryNum()));
            if(moimDoList.get(i).getMoimDeadCheck() == 0) {
                openMoimDoList.add(moimDoList.get(i));
            } else {
                closedMoimDoList.add(moimDoList.get(i));
            }
        }


        model.addAttribute("profilePageDto", profilePageDto);
        model.addAttribute("moimDoList", moimDoList);
        model.addAttribute("openMoimDoList", openMoimDoList);
        model.addAttribute("closedMoimDoList", closedMoimDoList);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("locationList", locationList);
        model.addAttribute("categoryName", categoryName);
        model.addAttribute("hostLevelName", hostLevelName);
    }

}
