package moimmoimProject.controller.userController;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.user.*;
import moimmoimProject.mapper.userMapper.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/userService")
public class UsersController {

    private final UserMapper userMapper;
    private final UserProfileMapper userProfileMapper;

/*

    @GetMapping("")
    public String home(){
        return "userService/login";
    }

    @GetMapping("signup")
    public String signupPage1(){
        return"userService/signupPage1";
    }
*/

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        return "login";
    }
/*
    @PostMapping("login")
    public String processLoginForm(@ModelAttribute("user") UserDo user, Model model) {
        UserDo authenticatedUser = userMapper.getUserByCredentials(user.getUserId(), user.getUserPassword());
        if (authenticatedUser == null) {
            model.addAttribute("errorMessage", "Invalid credentials");
            return "loginForm";
        } else {
            model.addAttribute("user", authenticatedUser);
            return "userPage";
        }
    }
    */

    @PostMapping("/login")
    public String login(@RequestParam("userId") String userId,
                        @RequestParam("userPassword") String userPassword,
                        Model model, RedirectAttributes redirectAttributes,
                        HttpServletRequest request) {

        UserDo authenticatedUser = userMapper.getUserByCredentials(userId, userPassword);

        if (authenticatedUser == null) {
            model.addAttribute("errorMessage", "Invalid credentials");
            return "login";
        } else {
            // Add the authenticated user to the session
            HttpSession session = request.getSession();
            session.setAttribute("authenticatedUser", authenticatedUser);

            // Redirect to the profile page
            redirectAttributes.addAttribute("userId", authenticatedUser.getUserId());
            return "redirect:/userService/profile";
        }
    }
}
