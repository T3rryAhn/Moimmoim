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
        MyPageController.profileEditor(userIdNum, model, profileMapper, profilePageAssembler, moimService, profileService);

        /*return "/myPageService/profilePage";*/
        return "/myPageService/Profile_Detail";
    }
}
