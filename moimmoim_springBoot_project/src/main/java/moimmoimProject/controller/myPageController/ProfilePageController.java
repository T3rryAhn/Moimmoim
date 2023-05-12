package moimmoimProject.controller.myPageController;


import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.pageDomain.ProfilePageDto;
import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.mapper.ProfileMapper;
import moimmoimProject.service.ProfilePageAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profilePage")
@RequiredArgsConstructor
public class ProfilePageController {

    private final ProfileMapper profileMapper;
    private final ProfilePageAssembler profilePageAssembler;

    @GetMapping("/{userIdNum}")
    public String getProfilePage(@PathVariable Long userIdNum, Model model) {
        ProfileDo profileDo = profileMapper.findByUserIdNum(userIdNum);
        if(profileDo == null) {
            profileMapper.insertProfileDefault(userIdNum);
        }
        ProfilePageDto profilePageDto = profilePageAssembler.getProfilePage(userIdNum);
        model.addAttribute("profilePageDto", profilePageDto);

        return "/myPageService/profilePage";
    }
}
