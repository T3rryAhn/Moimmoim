package moimmoimProject.service;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import moimmoimProject.domain.moimDomain.Criteria;
import moimmoimProject.domain.moimDomain.ImageDTO;
import moimmoimProject.domain.moimDomain.LocationDo;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.domain.moimDomain.MoimDo;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

@AllArgsConstructor
@Service
@Log4j2
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

    public void imageEnroll(List<ImageDTO> list){


        if(list == null || list.size() <= 0) {
            return;
        }

        list.forEach(attach ->{
            moimMapper.imageEnroll(attach);
        });
    }

    public List<ImageDTO> imageList(Long moimNum){
        return moimMapper.imageList(moimNum);
    }

    public void imageInsert(String path) {
        moimMapper.insertImage(path,1L);    // 모임 넘버 세션에서 받아야함
    }

    public ImageDTO makePath(MultipartFile multipartFile, File uploadPath, Long moimNum){

        ImageDTO imageDTO = new ImageDTO();

        imageDTO.setMoimNum(moimNum);

        String uploadFileName = multipartFile.getOriginalFilename();
        uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
        imageDTO.setFileName(uploadFileName);   // 객체에 삽입

        UUID uuid = UUID.randomUUID();                              //UUID 생성
        imageDTO.setUuid(uuid.toString());// 객체에 삽입

        log.info(imageDTO.getUuid());

        uploadFileName = uuid.toString() + "-" + uploadFileName;
        imageDTO.setUploadPath(uploadPath.toString().substring(9)+"\\");  // 객체에 삽입
        log.info(uploadPath);
        File saveFile = new File(uploadPath,uploadFileName);                              // 폴더 안에 하위 폴더를 만든 후 저장
        // File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());     // 그냥 폴더에 저장

        try{
            multipartFile.transferTo(saveFile);
        }catch (Exception e){
            e.printStackTrace();
        }
        return imageDTO;
    }       // 사진들 ImageDTO 삽입 및 파일 생성

    public String makePathSig(MultipartFile sigFile, File uploadPath){
        String uploadFileName2 = sigFile.getOriginalFilename();
        uploadFileName2 = uploadFileName2.substring(uploadFileName2.lastIndexOf("\\")+1);
        UUID uuid2 = UUID.randomUUID();                              //UUID 생성

        uploadFileName2 = uuid2.toString() + "-" + sigFile.getOriginalFilename();

        String path = uploadPath.toString().substring(9)+"\\" + uploadFileName2;
        imageInsert(path);

        uploadFileName2 = uuid2.toString() + "-" + sigFile.getOriginalFilename();
        File saveFile2 = new File(uploadPath,uploadFileName2);
        try {
            sigFile.transferTo(saveFile2);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return path;
    }                           // 대표 사진 설정 및 파일 생성

    private String getFolder(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        return str.replace("-",File.separator);
    }                                                                  // 폴더 경로 생성

    public File makeFolder() {
        String uploadFolder="C:\\upload\\";
        // 폴더 생성
        File uploadPath =  new File(uploadFolder, getFolder());
        log.info("upload path : " + uploadPath);

        if(uploadPath.exists() == false){
            uploadPath.mkdirs();
        }
        return uploadPath;
    }                                                                   // 저장 경로

    public List<LocationDo> locList1(){
        return moimMapper.locList1();
    }
}
