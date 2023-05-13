package moimmoimProject.service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
@Log4j2
public class ProfileService {

    public String getHostLevelName(int userCategoryNum){
        String hostLevelName="";
        switch (userCategoryNum){
            case 1 : hostLevelName = "뉴비 호스트";
                break;
            case 2 : hostLevelName = "주니어 호스트";
                break;
            case 3 : hostLevelName = "시니어 호스트";
                break;
            case 4 : hostLevelName = "슈퍼 호스트";
                break;
        }
        return hostLevelName;
    }
}
