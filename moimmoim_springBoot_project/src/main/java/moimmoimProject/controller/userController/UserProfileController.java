package moimmoimProject.controller.userController;

import moimmoimProject.domain.user.*;
import lombok.RequiredArgsConstructor;
import moimmoimProject.mapper.userMapper.UserProfileMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/userService/profile")
@RequiredArgsConstructor
public class UserProfileController {
    private final UserProfileMapper userProfileMapper;

    @GetMapping
    public String showProfilePage(Model model, HttpSession session) {
        UserDo authenticatedUser = (UserDo) session.getAttribute("authenticatedUser");
        UserProfileDto userProfileDto = userProfileMapper.getUserProfileDto(authenticatedUser.getUserIdNum());
        model.addAttribute("userProfileDto", userProfileDto);
        return "profilePage";
    }
}
