package moimmoimProject.domain.moimDomain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ImageDTO {
    private String fileName;
    private String uploadPath;
    private String uuid;
    private Long moimNum;

    public ImageDTO() {

    }
}
