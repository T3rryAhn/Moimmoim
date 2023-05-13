package moimmoimProject.controller.myPageController;


import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.moimDomain.MoimDo;
import moimmoimProject.domain.userDomain.UserDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.mapper.UserMapper;
import moimmoimProject.service.MoimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

    private final UserMapper userMapper;
    private final MoimService moimService;

    @Autowired
    public MyPageController(UserMapper userMapper, MoimService moimService) {
        this.moimService=moimService;
        this.userMapper=userMapper;
    }

    @GetMapping("{userIdNum}")
    public String findByUserIdNum(HttpSession session, Model model){
        Long userIdNum = (Long)session.getAttribute("userIdNum");
        UserDo userDo = userMapper.findByUserIdNum(userIdNum);
        model.addAttribute("userDo", userDo);

        return "/myPageService/myPage";
    }


    @GetMapping("/myJoinMoim")
    public String myJoinMoim(HttpSession session, String keyword, Criteria cri, Model model){
        Long userIdNum = (Long)session.getAttribute("userIdNum");   //세션에서 넘버 받기
        // Long userIdNum = 1L;    // 테스트 용

        List<Long> numList = moimService.findMoimed(userIdNum);     // 유저의 참가한 모임 넘 리스트를 얻음
        List<MoimDo> list = new ArrayList<>();
        int i=0;
        while(true){
            MoimDo moimDo = moimService.getMoimByMoimNum(numList.get(i));
            list.add(moimDo);
            if(numList.size()-1 > i){
                i++;
            }else{
                break;
            }
        }
        model.addAttribute("list", list);

        return "moimService/list";
    }

    @GetMapping("/myMadeMoim")
    public String myMadeMoim(HttpSession session, String keyword, Criteria cri, Model model) {
        Long userIdNum = (Long)session.getAttribute("userIdNum");   //세션에서 넘버 받기
        //Long userIdNum = 1L;    // 테스트 용
        List<MoimDo> list = moimService.getMoimByUserIdNum(userIdNum);

        model.addAttribute("list", list);
        return "moimService/list";
    }

}
