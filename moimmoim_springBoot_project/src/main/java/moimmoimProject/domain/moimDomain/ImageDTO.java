package moimmoimProject.domain.moimDomain;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class ImageDTO {
    private String fileName;
    private String uploadPath;
    private String uuid;
    private Long MoimNum;
    public ImageDTO() {
    }
}
