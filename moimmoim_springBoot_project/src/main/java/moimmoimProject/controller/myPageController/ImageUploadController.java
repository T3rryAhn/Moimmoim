package moimmoimProject.controller.myPageController;

import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.mapper.ProfileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.*;

@Controller
public class ImageUploadController {
    private final String UPLOAD_DIR = "src/main/resources/static/imgs/profile_img";
    @Autowired
    private ProfileMapper profileMapper;
    @GetMapping("/profileImg")
    public String index() {
        return "/myPageService/imageUpload";
    }
    @PostMapping("/profileImg/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file,
                             @RequestParam("userid_num") Long userIdNum) throws IOException {
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
        Path uploadPath = Paths.get(UPLOAD_DIR);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        String filePathStr = "imgs/profile_img/" + fileName;
        Path filePath = uploadPath.resolve(fileName);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        ProfileDo profileDo = new ProfileDo();
        profileDo.setUserProfileImage(filePathStr);
        profileDo.setUserIdNum(userIdNum);
        profileMapper.updateProfileImage(profileDo);
        return "redirect:/";
    }
}