package moimmoimProject.service;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import lombok.AllArgsConstructor;
import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.moimDomain.LocationDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.domain.moimDomain.MoimDo;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@AllArgsConstructor
@Service
public class MoimService {

    private final MoimMapper moimMapper;

    public MoimDo getMoimByMoimNum(Long moimNum){
        return moimMapper.findAllByMoimNum(moimNum);
    }

    public List<MoimDo> getMoimByUserIdNum(Long userNum){
        return moimMapper.findAllByUserIdNum(userNum);
    }

    public void createMoim(MoimDo moimDo) {
        moimDo.setMoimCreateDate(LocalDateTime.now());
        moimMapper.createMoim(moimDo);
    }

    public void CountView(Long moimNum){
        moimMapper.countView(moimNum);
    }
    public void deleteMoim(Long moimNum){
        moimMapper.deleteMoim(moimNum);
    }

    public int moimListCnt(Long moimCategoryNum){
        return moimMapper.moimListCnt(moimCategoryNum);
    }

    public List<Map<String, Object>> moimList(Criteria cri,Long moimCategoryNum){
        return moimMapper.moimList(cri,moimCategoryNum);
    }

    public LocationDo findLocName(MoimDo moimDo){
        return moimMapper.findLocationName(moimDo);
    }

    public List<LocationDo> getLocList(List<Map<String, Object>> moimList){
        List<LocationDo> list = new ArrayList<>();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        int i = 0;
        while (true) {
            MoimDo convertedMoimDo = objectMapper.convertValue(moimList.get(i), MoimDo.class);
            LocationDo locName = moimMapper.findLocationName(convertedMoimDo);
            list.add(locName);
            if(moimList.size()-1 > i){
                i++;
            }else{
                break;
            }
        }
        return list;
    }

    public String getCatName(int moimCategoryNum){
        String catName="";
        switch (moimCategoryNum){
            case 1 : catName = "먹기";
                break;
            case 2 : catName = "보기";
                break;
            case 3 : catName = "배우기";
                break;
            case 4 : catName = "힐링하기";
                break;
            case 5 : catName = "체험하기";
                break;
        }
        return catName;
    }

    @WebServlet("/UploadService")
    public class UploadService {
        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String fileName = request.getParameter("file");
            System.out.println(fileName);

        }
    }

}
