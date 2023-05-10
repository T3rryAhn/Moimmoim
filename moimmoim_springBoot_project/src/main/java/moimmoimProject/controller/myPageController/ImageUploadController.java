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

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.util.UUID;

@Controller
public class ImageUploadController {
    private final String UPLOAD_DIR = "/imgs/profile_img";
    @Autowired
    private ProfileMapper profileMapper;
    @GetMapping("/profileImg")
    public String index() {
        return "/myPageService/imageUpload";
    }
    /*@PostMapping("/profileImg/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file,
                             @RequestParam("userid_num") Long userIdNum) throws IOException {
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
        Path uploadPath = Paths.get(UPLOAD_DIR);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        Path filePath = uploadPath.resolve(fileName);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        ProfileDo profileDo = new ProfileDo();
        profileDo.setUserProfileImage(filePath.toString().replace('\\', '/').substring(UPLOAD_DIR.indexOf("imgs")));
        profileDo.setUserIdNum(userIdNum);
        profileMapper.updateProfileImage(profileDo);
        return "redirect:/";
    }*/

    private boolean checkImageType(File file) {
        try {
            String contentType = Files.probeContentType(file.toPath());
            return contentType.startsWith("image");
        } catch(IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    @PostMapping("/uploadAction")
    public String uploadPost(MultipartFile[] uploadFile,
                             @RequestParam("userid_num") String userId) {
        Long userIdNum;
        if(userId == null || userId.equals("undefined")) {
            userIdNum = null;
        } else {
            userIdNum = Long.parseLong(userId);
        }
        String uploadFolder = "C:\\upload";
        File uploadPath = new File(uploadFolder);
        if(uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }
        for(MultipartFile multipartFile : uploadFile) {
            String uploadFileName = multipartFile.getOriginalFilename();

            UUID uuid = UUID.randomUUID();

            uploadFileName = uuid.toString() + "_" + uploadFileName;

            File saveFile = new File(uploadPath, uploadFileName);
            if(checkImageType(saveFile)) {
                try {
                    multipartFile.transferTo(saveFile);
                    ProfileDo profileDo = new ProfileDo();
                    profileDo.setUserProfileImage(uploadFolder+"\\"+uploadFileName);
                    profileDo.setUserIdNum(userIdNum);
                    profileMapper.updateProfileImage(profileDo);
                    System.out.println(uploadFolder+"\\"+uploadFileName);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }
        return "redirect:/";
    }
}