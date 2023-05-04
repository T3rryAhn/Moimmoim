package moimmoimProject.controller.userController;


import moimmoimProject.domain.userDomain.UserSimpleProfileDto;
import moimmoimProject.service.UserSimpleProfileAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller("/users")
public class UserSimpleProfileController {

    private final UserSimpleProfileAssembler userSimpleProfileAssembler;

    @Autowired
    public UserSimpleProfileController(UserSimpleProfileAssembler userSimpleProfileAssembler) {
        this.userSimpleProfileAssembler = userSimpleProfileAssembler;
    }

    @GetMapping("/{userIdNum}/userSimpleProfile")
    public UserSimpleProfileDto getUserSimpleProfile(@PathVariable Long userIdNum) {
        return userSimpleProfileAssembler.getUserSimpleProfile(userIdNum);
    }
}
