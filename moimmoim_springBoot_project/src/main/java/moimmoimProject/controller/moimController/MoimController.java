package moimmoimProject.controller.moimController;

import lombok.AllArgsConstructor;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.service.moimService.MoimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.sql.SQLException;

@Controller
@AllArgsConstructor
public class MoimController {

    private final MoimService moimService;

    @GetMapping("/moim")
    public String hello() {
        return "moimService/index";
    }

    @GetMapping("/moim/new")
    public String moimForm() {
        return "moimService/moimForm";
    }

    @GetMapping("/moim/list")
    public String moimList(Model model) {
        //테스트용
        Long test = 1L;
        MoimDo moimDo = moimService.getMoim(test);
        model.addAttribute("testmoim", moimDo);
        return "moimService/list";
    }

    @PostMapping("/moim/new")
    public String createNewMoim(@ModelAttribute MoimDo moimDo) throws SQLException {
        moimService.join(moimDo);
        return "moimService/index";
    }
}
