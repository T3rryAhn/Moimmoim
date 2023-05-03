package moimmoimProject.controller.moimController;

import lombok.RequiredArgsConstructor;
import moimmoimProject.domain.moim.Moim;
import moimmoimProject.service.moimService.MoimServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.sql.SQLException;

@Controller
@RequiredArgsConstructor
public class MoimController {

    private final MoimServiceImpl moimService;

    @GetMapping("/")
    public String hello() {
        return "index";
    }

    @GetMapping("/moim/new")
    public String moimForm() {
        return "moimService/moimForm";
    }

    @PostMapping("/moim/new")
    public String createNewMoim(@ModelAttribute Moim moim) throws SQLException {
        moimService.join(moim);
        return "moimService/index";
    }

    @GetMapping("/moim/list")
    public String MoimList(){

        return"moimService/moimLIst";
    }


}
