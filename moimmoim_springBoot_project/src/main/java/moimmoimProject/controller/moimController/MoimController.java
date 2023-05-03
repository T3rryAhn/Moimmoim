package moimmoimProject.controller.moimController;

import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.service.moimService.MoimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.sql.SQLException;

@Controller
public class MoimController {

    private final MoimService moimService;

    @Autowired
    public MoimController(MoimService moimService) {
        this.moimService = moimService;
    }

    @GetMapping("/")
    public String hello() {
        return "index";
    }

    @GetMapping("/moim/new")
    public String moimForm() {
        return "moimForm";
    }

    @PostMapping("/moim/new")
    public String createNewMoim(@ModelAttribute MoimDo moimDo) throws SQLException {
        moimService.join(moimDo);
        return "index";
    }
}
