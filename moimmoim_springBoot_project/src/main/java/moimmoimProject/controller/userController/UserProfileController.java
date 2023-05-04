package moimmoimProject.controller.userController;

import moimmoimProject.domain.userDomain.UserProfileDto;
import moimmoimProject.service.UserProfileAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")
public class UserProfileController {

        private final UserProfileAssembler userProfileAssembler;

        @Autowired
        public UserProfileController(UserProfileAssembler userProfileAssembler) {
            this.userProfileAssembler = userProfileAssembler;
        }

        @GetMapping("/{userIdNum}/userProfile")
        public String getUserProfile(@PathVariable Long userIdNum, Model model) {
            UserProfileDto userProfileDto = userProfileAssembler.getUserProfile(userIdNum);
            model.addAttribute("userProfileDto", userProfileDto);

            return "/userService/userProfile";
        }
}

