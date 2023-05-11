package moimmoimProject.domain.moimDomain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class FileDo {
    private int file_no;
    private String file_path;
    private String fileName;
    private String orig_fileName;
}