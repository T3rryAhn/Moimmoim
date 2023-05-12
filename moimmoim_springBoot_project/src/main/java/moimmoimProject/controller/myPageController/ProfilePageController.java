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
        List<MoimDo> moimDoList = moimService.getMoimByUserIdNum(userIdNum);
        List<LocationDo> locationDoList = null;
        List<String> categoryList = null;
        String categoryName = moimService.getCatName(userIdNum.intValue());
        String hostLevelName = profileService.getHostLevelName(userIdNum.intValue());

        for(int i = 0; i < moimDoList.size(); i++) {
            locationDoList.add(moimService.findLocName(moimDoList.get(i)));
            categoryList.add(moimService.getCatName(moimDoList.get(i).getMoimCategoryNum()));
        }

        if(profileDo == null) {
            profileMapper.insertProfileDefault(userIdNum);
        }
        ProfilePageDto profilePageDto = profilePageAssembler.getProfilePage(userIdNum);
        model.addAttribute("profilePageDto", profilePageDto);
        model.addAttribute("category", categoryList);
        model.addAttribute("locationDo", locationDoList);
        model.addAttribute("categoryName", categoryName);
        model.addAttribute("hostLevelName", hostLevelName);

        /*return "/myPageService/profilePage";*/
        return "/myPageService/Profile_Detail";
    }
}
