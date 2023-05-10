<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta name="viewport" content="width=device-width , initial-scale=1.0" />
        <meta charset="UTF-8" />
        <title>login-form</title>
    </head>

    <body>


           <p> 모임 넘버 : ${moimDo.moimNum}</p>
           <p> 모임 만든 유저 아이디 : ${moimDo.moimHostUserIdNum}</p>
           <p> 모임 제목 : ${moimDo.moimTitle}</p>
           <p> 모임 소개 글 : ${moimDo.moimMainContent}</p>
           <p> 모임 이미지 : ${moimDo.moimImage}</p>
           <p> 모임 만든시간 : ${moimDo.moimCreateDate}</p>
           <p> 모임 조회수 : ${moimDo.moimViewCount}</p>
           <p> 모임 카테고리 : ${moimDo.moimCategoryNum},${category}</p>
           <p> 모임 시작 시간 : ${moimDo.moimStartDate}</p>
           <p> 모임 종료 시간 : ${moimDo.moimEndDate}</p>
           <p> 모임 참가한 인원 수 : ${moimDo.moimMemberCount}</p>
           <p> 모임 최대 인원 수 : ${moimDo.moimMemberMax}</p>
           <p> 모임 가격 : ${moimDo.moimPrice}</p>
           <p> 모임 마감일 : ${moimDo.moimDeadLine}</p>
           <p> 모임 마감 여부 : ${moimDo.moimDeadCheck}</p>
           <p> 모임 지역 번호 : ${moimDo.moimLocationNum}, ${locationDo.location_name}</p>
           <c:forEach items="${imageList}" var="ImageDTO">
                <img src="\files\${ImageDTO.uploadPath}${ImageDTO.uuid}-${ImageDTO.fileName}" alt="My Image" >
           </c:forEach>
           <img src="\files\2023\05\10\801d6934-86a7-4671-af9e-15a5ecf4481b-2.jpg" alt="My Image" >
    <!-- 구매 실패 메시지 -->
    <c:if test="${not empty errorMsg}">
        <p style="color: red">${errorMsg}</p>
    </c:if>
    <!-- 구매 실패 메시지 끝 -->
    </body>

</html>