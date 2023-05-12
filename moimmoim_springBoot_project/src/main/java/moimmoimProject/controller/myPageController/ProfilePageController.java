package moimmoimProject.controller.myPageController;


import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.moimDomain.LocationDo;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.domain.pageDomain.ProfilePageDto;
import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.mapper.ProfileMapper;
import moimmoimProject.service.MoimService;
import moimmoimProject.service.ProfilePageAssembler;
import moimmoimProject.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/profilePage")
@RequiredArgsConstructor
public class ProfilePageController {

    private final ProfileMapper profileMapper;
    private final ProfilePageAssembler profilePageAssembler;
    private final MoimService moimService;
    private final ProfileService profileService;

    @GetMapping("/{userIdNum}")
    public String getProfilePage(@PathVariable Long userIdNum, Model model) {
        ProfileDo profileDo = profileMapper.findByUserIdNum(userIdNum);
        if(profileDo == null) {
            profileMapper.insertProfileDefault(userIdNum); // 회원가입 직후에 프로필 객체가 없을 경우, 설정한 임의의 디폴트 값 insert
        }
        ProfilePageDto profilePageDto = profilePageAssembler.getProfilePage(userIdNum);
        List<MoimDo> moimDoList = profilePageDto.getUserMoimList();
        List<String> locationList = new ArrayList<>();
        List<String> categoryList = new ArrayList<>();
        String categoryName = moimService.getCatName(profilePageDto.getUserProfileDto().getUserCategoryNum());
        String hostLevelName = profileService.getHostLevelName(profilePageDto.getUserProfileDto().getUserHostLevelNum());
        for (int i = 0; i < moimDoList.size(); i++) {
            locationList.add(moimService.findLocName(moimDoList.get(i)).getLocationName());
            categoryList.add(moimService.getCatName(moimDoList.get(i).getMoimCategoryNum()));
            System.out.println(moimDoList.get(i));
        }


        model.addAttribute("profilePageDto", profilePageDto);
        model.addAttribute("moimDoList", moimDoList);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("locationList", locationList);
        model.addAttribute("categoryName", categoryName);
        model.addAttribute("hostLevelName", hostLevelName);

        /*return "/myPageService/profilePage";*/
        return "/myPageService/Profile_Detail";
    }
}
