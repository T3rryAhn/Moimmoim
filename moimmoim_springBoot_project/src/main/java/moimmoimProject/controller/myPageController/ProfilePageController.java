package moimmoimProject.controller.myPageController;


import moimmoimProject.domain.pageDomain.ProfilePageDto;
import moimmoimProject.service.ProfilePageAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profilePage")
public class ProfilePageController {

    private final ProfilePageAssembler profilePageAssembler;

    @Autowired
    public ProfilePageController(ProfilePageAssembler profilePageAssembler) {
        this.profilePageAssembler = profilePageAssembler;
    }

    @GetMapping("/{userIdNum}")
    public String getProfilePage(@PathVariable Long userIdNum, Model model) {
        ProfilePageDto profilePageDto = profilePageAssembler.getProfilePage(userIdNum);
        model.addAttribute("profilePageDto", profilePageDto);

        return "/myPageService/profilePage";
    }
}
