package moimmoimProject.controller.userController;

import moimmoimProject.domain.userDomain.UserProfileDto;
import moimmoimProject.service.UserProfileAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class UserProfileController {


        private final UserProfileAssembler userProfileAssembler;

        @Autowired
        public UserProfileController(UserProfileAssembler userProfileAssembler) {
            this.userProfileAssembler = userProfileAssembler;
        }

        @GetMapping
        public UserProfileDto getUserProfile(@PathVariable Long userIdNum) {
            return userProfileAssembler.getUserProfile(userIdNum);
        }
}

