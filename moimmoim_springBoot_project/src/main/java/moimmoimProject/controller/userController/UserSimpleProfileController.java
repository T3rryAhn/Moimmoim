package moimmoimProject.controller.userController;


import moimmoimProject.domain.userDomain.UserSimpleProfileDto;
import moimmoimProject.service.UserSimpleProfileAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")
public class UserSimpleProfileController {

    private final UserSimpleProfileAssembler userSimpleProfileAssembler;

    @Autowired
    public UserSimpleProfileController(UserSimpleProfileAssembler userSimpleProfileAssembler) {
        this.userSimpleProfileAssembler = userSimpleProfileAssembler;
    }

    @GetMapping("/{userIdNum}/userSimpleProfile")
    public String getUserSimpleProfile(@PathVariable Long userIdNum, Model model) {
        UserSimpleProfileDto userSimpleProfileDto = userSimpleProfileAssembler.getUserSimpleProfile(userIdNum);
        model.addAttribute("userSimpleProfileDto", userSimpleProfileDto);

        return "/userService/userSimpleProfile";
    }
}
