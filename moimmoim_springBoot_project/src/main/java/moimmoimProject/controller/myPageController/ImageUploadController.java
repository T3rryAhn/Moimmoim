package moimmoimProject.controller.myPageController;

import moimmoimProject.domain.userDomain.ProfileDo;
import moimmoimProject.mapper.ProfileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class ImageUploadController {

    @Autowired
    private ProfileMapper profileMapper;

    @GetMapping("/profileImg")
    public String index() {
        return "/myPageService/imageUpload";
    }

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
    @ResponseBody
    public Map<String, Object> uploadPost(MultipartFile[] uploadFile,
                                                        @RequestParam("userid_num") String userId) {
        Long userIdNum;
        if(userId == null || userId.equals("undefined")) {
            userIdNum = null;
        } else {
            userIdNum = Long.parseLong(userId);
        }
        String uploadFolder = "C:\\upload\\profile_img";
        File uploadPath = new File(uploadFolder);
        if(uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }
        Map<String, Object> response = new HashMap<>();
        for(MultipartFile multipartFile : uploadFile) {
            String uploadFileName = multipartFile.getOriginalFilename();

            UUID uuid = UUID.randomUUID();

            uploadFileName = uuid.toString() + "_" + uploadFileName;

            File saveFile = new File(uploadPath, uploadFileName);
            if(checkImageType(saveFile)) {
                try {
                    multipartFile.transferTo(saveFile);
                    ProfileDo profileDo = new ProfileDo();
                    profileDo.setUserProfileImage(uploadFolder.substring(10)+"\\"+uploadFileName);
                    profileDo.setUserIdNum(userIdNum);
                    profileMapper.updateProfileImage(profileDo);
                    response.put("imagePath", uploadFolder.substring(10)+"\\"+uploadFileName);
                    System.out.println(uploadFolder.substring(10)+"\\"+uploadFileName);

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }
        return response;
    }
}