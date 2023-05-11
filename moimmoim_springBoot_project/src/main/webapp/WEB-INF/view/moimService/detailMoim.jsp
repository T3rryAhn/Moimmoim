<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>MOIMMOIM :: 모임글 보기</title>
    <link rel="stylesheet" href="/css/moimCss/moim_detail.css">
    <link rel="stylesheet" href="/css/moimCss/headerfooter_basic.css">
</head>

<body>
<header>
    <!--로그인 전 헤더-->
    <div id="header_container">
        <div id="header_logo"><a href="/"><img src="\imgs\moimmoimUi\logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="/moim/getMoim/list" class="header_menu">MOIM LIST</a>
            <a href="#" class="header_menu">HOST LIST</a>
            <div id="mypage_icon"><a href="/"><img src="\imgs\moimmoimUi\mypage.png" alt="mypage" width="40px"></a></div>
        </div>
    </div>

    <!--로그인 후 헤더-->
    <!-- <div id="header_container">
        <div id="header_logo"><a href="/"><img src="\imgs\moimmoimUi\logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="#" class="header_menu">MOIM LIST</a>
            <a href="#" class="header_menu">HOST LIST</a>
            <div id="mypage_icon"><a href="/"><img src="\imgs\moimmoimUi\mypage.png" alt="mypage" width="40px"></a></div>
        </div>
    </div> -->
</header>
<main>

    <!--
    대표사진 src = /files/${moimDo.moimImage}
    사진들
       <c:forEach items="${imageList}" var="ImageDTO">
            <img src=/files/${ImageDTO.uploadPath}${ImageDTO.uuid}-${ImageDTO.fileName} alt="My Image"style="width:100px; height:100px;">
       </c:forEach>
    <img src="/files/2023/05/10/801d6934-86a7-4671-af9e-15a5ecf4481b-2.jpg" alt="My Image" >
    -->

    <div class="container">
    <div class="form-group">
        <div class="box box1">
            <h1 class="moim_title">
                <img src="\imgs\moimmoimUi\bar.png"; class="green_bar">
                ${moimDo.moimTitle}</h1>
        </div>
        <div class="box box2">
            <img src="/files/${moimDo.moimImage}" alt="moim_photo" class="moim_photo" >
        </div>
        <div class="box box3">
            <div >
                <div class="detail_box top">
                    <dl class="moim_creator">
                        <dt class="moim_creator_title">모임 만든이</dt>
                        <dd class="moim_creator_content">
                            <a href="#"> ${moimDo.moimHostUserIdNum}</a></dd>   <!-- 이름, 닉네임으로 표시해야함  -->
                    </dl>
                </div>
                <div class="detail_box middle">
                    <dl class="moim_info">
                        <dt class="moim_info_title"> 모임 카테고리</dt>
                        <a href="#"><dd class="moim_info_content category">🍴 ${moimDo.moimCategoryNum},${category}</dd></a>
                    </dl>
                    <div>
                        <dl class="moim_info">
                            <dt class="moim_info_title"> 모임 시작 시간</dt>
                            <dd class="moim_info_content">2023년 5월 16일 13:00  ${moimDo.moimStartDate}</dd>
                        </dl>
                        <dl class="moim_info">
                            <dt class="moim_info_title"> 모임 종료 시간</dt>
                            <dd class="moim_info_content">2023년 5월 16일 20:00  ${moimDo.moimEndDate}</dd>
                        </dl>

                        <dl class="moim_info">
                            <dt class="moim_info_title"> 현재 모임 참가 인원</dt>
                            <dd class="moim_info_content">${moimDo.moimMemberCount}명</dd>
                        </dl>
                        <dl class="moim_info">
                            <dt class="moim_info_title"> 모임 최대 참가 인원</dt>
                            <dd class="moim_info_content">${moimDo.moimMemberMax}명</dd>
                        </dl>
                    </div>
                </div>
                <div class="detail_box middle">
                    <dl class="moim_info">
                        <dt class="moim_info_title">모임 가격</dt>
                        <dd class="moim_info_content">20,000  ${moimDo.moimPrice}원/1인</dd>
                    </dl>
                    <dl class="moim_info">
                        <dt class="moim_info_title">모집 마감일</dt>
                        <dd class="moim_info_content">2023년 5월 14일  ${moimDo.moimDeadLine}</dd>
                    </dl>

                    <dl class="moim_info">
                        <dt class="moim_info_title">모집 마감 여부</dt>
                        <dd class="moim_info_content">모집중  ${moimDo.moimDeadCheck}</dd>
                    </dl>
                </div>
                <div class="detail_box bottom">
                    <dl class="moim_info">
                        <dt class="moim_info_title"> 모임 위치</dt>
                        <dd class="moim_info_content">서울특별시 종로구 평창동  ${moimDo.moimLocationNum}, ${locationDo.locationName}</dd>
                    </dl>
                    <p class="created_date">모임 생성 일시: 2023년 5월 9일  ${moimDo.moimCreateDate}</p>
                </div>

            </div>
        </div>
        <div class="box box4">
            <div class="moim_content">모임 소개 글 : ${moimDo.moimMainContent}
이 지역의 이름은 시대에 따라 바뀌어 왔으나, 지금의 평창동이라는 이름은 조선시대 때 있던 선혜청이라는 곳의 평창 세금으로 온 곡식들을 저장한 창고이다에서 유래하여 명명되었다. 조선 후기에는 세도 정치를 한 반남 박씨(潘南 朴氏), 장동 김씨(壯洞 金氏) 등의 명문 양반가들이 종로구 일대에 모여 살던 곳이다. 이후에 가회동으로 거쳐를 옮기며 무명 예술인들이 모여 살기 시작했다.

평창동은 전체의 65%가 개발제한구역이다. 즉, 평창동 전체에서 35%의 구역에만 주민들이 살고 있다는 뜻이다. 본래는 북한산 국립공원 인근 지역이다보니 개발제한구역의 비율이 더 높았으나, 1968년에 김신조 일당이 이 인근 지역을 침투한 이후로 청와대 궁전의 뒤편에 사람이 사는 마을이 있어야 침투로가 없어질 것이라고 생각하여 정부 차원에서 마을을 활성화시켰다. (424자)
            </div>
        </div>

        <div>
          <jsp:include page="/WEB-INF/view/ticketService/moimPageTicket.jsp" />
        </div>

        <div class="box box6">
            <p class="moim_nums"> 모임 넘버: ${moimDo.moimNum}</p>
        </div>
        <div class="box box7">
            <p class="moim_nums"> 모임 조회수: ${moimDo.moimViewCount}</p>
        </div>


    </div>
</div>
</main>


<!-- 구매 실패 메시지 -->
<c:if test="${not empty errorMsg}">
    <p style="color: red">${errorMsg}</p>
</c:if>
<!-- 구매 실패 메시지 끝 -->


    <footer>
        <div id="footer_container">
            <div class="footer_logo_menu">
                <a href="#"><img src="\imgs\moimmoimUi\whiteLogo.png" alt="logo" width="200px"></a>
                <a href="#" class="footer_font">개인정보 처리방침</a>
                <a href="#" class="footer_font">기타 필요메뉴</a>
                <a href="#" class="footer_font">메뉴구성</a>
            </div>
            <div>
                <a href="#" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
            </div>
        </div>
    </footer>
</body>
</html>