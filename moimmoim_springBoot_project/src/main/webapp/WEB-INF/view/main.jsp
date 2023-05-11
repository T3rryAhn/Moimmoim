<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-09
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>MoimMoim 메인 페이지</title>
    <link rel="stylesheet" href="/css/main/mainpage.css">
    <link rel="stylesheet" href="/css/main/body.css">
    <link rel="stylesheet" href="/css/moimCss/headerfooter_basic.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="js/main/main.js"></script>
</head>
<body>
<!--헤더 시작-->
<header>
    <div id="header_container">
        <div id="header_logo"><a href="/"><img src="/imgs/moimmoimUi/logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="#" class="header_menu">MOIM LIST</a>
            <a href="#" class="header_menu here">HOST LIST</a>
            <a href="#" class="header_menu">고객센터</a>
            <c:if test="${sessionScope.userIdNum==null}">
            <div id="login_icon"><a href="/login"><img src="/imgs/moimmoimUi/login.png" alt="login" width="40px"></a></div>
            </c:if>
            <c:if test="${sessionScope.userIdNum!=null}">
                <div id="login_icon"><a href=/profilePage/${sessionScope.userIdNum}><img src="/imgs/moimmoimUi/mypage.png" alt="login" width="40px"></a></div>
            </c:if>
        </div>
    </div>
</header>
<!--헤더 끝-->

<main>
    <!--POPULAR MOIM 시작-->
    <div class="moims_container">
        <div class="section_header">
            <div class="section_title">
                <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> POPULAR MOIM</div>
            <a href="/" class="more_button">MORE ></a>
        </div>
        <ol class="list">
            <c:forEach items="${moimListPopular}" var="list" varStatus="status">
                <li class="popular"><a href="moim/getMoim/getMoim?moimNum=${list.moimNum}">
                    <figure>
                        <img src="/files/${i.moimImage}" alt="사진1"; class="popular_photo">
                        <div class="moim_info">
                            <div class="moim_title">${list.moimTitle}</div>
                        </div>
                    </figure>
                </a>
                </li>
            </c:forEach>
<%--            <li class="popular"><a href="#">
                <figure>
                    <img src="/imgs/moim_img/image1.jpg" alt="사진1"; class="popular_photo">
                    <div class="moim_info">
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                    </div>
                </figure>
            </a>
            </li>
            <li class="popular"><a href="#">
                <figure>
                    <img src="/imgs/moim_img/image2.jpg" alt="사진1"; class="popular_photo">
                    <div class="moim_info">
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                    </div>
                </figure>
            </a>
            </li>
            <li class="popular"><a href="#">
                <figure>
                    <img src="/imgs/moim_img/image3.jpg" alt="사진1"; class="popular_photo">
                    <div class="moim_info">
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                    </div>
                </figure>
            </a>
            </li>--%>
        </ol>
    </div>
    <!--POPULAR MOIM 끝-->

    <!--MOIM LIST 시작-->
    <div class="moims_container">
        <!-- MOIM LIST 섹션 헤더-->
        <div class="section_header">
            <div class="section_title"> <!-- 연두색 바와 POPULAR MOIM 수평이 안 맞아서 매우 보기 불편. 개선 예정-->
                <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> MOIM LIST</div>
            <a href="/" class="more_button">MORE ></a>
        </div>
        <!--카테고리 바 (탭)-->
        <div class="tab">
            <button class="tablinks active" onclick="openTab(event, 'tab1')">🍴 먹기</button>
            <button class="tablinks" onclick="openTab(event, 'tab2')">🎞 보기</button>
            <button class="tablinks" onclick="openTab(event, 'tab3')">🎨 배우기</button>
            <button class="tablinks" onclick="openTab(event, 'tab4')">🎈 힐링하기</button>
            <button class="tablinks" onclick="openTab(event, 'tab5')">🎠 체험하기</button>
        </div>
        <!--카테고리별 컨텐츠-->
        <div id="tab1" class="tabcontent active">
            <ol class="moim_list">
            <c:forEach items="${moimListEat}" var="list" varStatus="status">
                    <li class="cat_moim"><a href="moim/getMoim/getMoim?moimNum=${list.moimNum}">
                        <figure>
                            <img src="/files/${list.moimImage}" alt="사진1" class="photo">
                            <div class="moim_info">
                                <div class="moim_location">${locList[status.index].locationName}</div>
                                <div class="moim_title">${list.moimTitle}</div>
                                <div class="moim_price">${list.moimPrice}원/1명</div>
                            </div>
                        </figure>
                    </a></li>
             </c:forEach>
            </ol>
        </div>
        <div id="tab2" class="tabcontent">
            <ol class="moim_list">
                <c:forEach items="${moimListLook}" var="list" varStatus="status">
                    <li class="cat_moim"><a href="moim/getMoim/getMoim?moimNum=${list.moimNum}">
                        <figure>
                            <img src="/files/${list.moimImage}" alt="사진1" class="photo">
                            <div class="moim_info">
                                <div class="moim_location">${locList[status.index].locationName}</div>
                                <div class="moim_title">${list.moimTitle}</div>
                                <div class="moim_price">${list.moimPrice}원/1명</div>
                            </div>
                        </figure>
                    </a></li>
                </c:forEach>
            </ol>
        </div>
        <div id="tab3" class="tabcontent">
            <ol class="moim_list">
                <c:forEach items="${moimListLearn}" var="list" varStatus="status">
                    <li class="cat_moim"><a href="moim/getMoim/getMoim?moimNum=${list.moimNum}">
                        <figure>
                            <img src="/files/${list.moimImage}" alt="사진1" class="photo">
                            <div class="moim_info">
                                <div class="moim_location">${locList[status.index].locationName}</div>
                                <div class="moim_title">${list.moimTitle}</div>
                                <div class="moim_price">${list.moimPrice}원/1명</div>
                            </div>
                        </figure>
                    </a></li>
                </c:forEach>
            </ol>
        </div>
        <div id="tab4" class="tabcontent">
            <ol class="moim_list">
                <c:forEach items="${moimListHeal}" var="list" varStatus="status">
                    <li class="cat_moim"><a href="moim/getMoim/getMoim?moimNum=${list.moimNum}">
                        <figure>
                            <img src="/files/${list.moimImage}" alt="사진1" class="photo">
                            <div class="moim_info">
                                <div class="moim_location">${locList[status.index].locationName}</div>
                                <div class="moim_title">${list.moimTitle}</div>
                                <div class="moim_price">${list.moimPrice}원/1명</div>
                            </div>
                        </figure>
                    </a></li>
                </c:forEach>
            </ol>
        </div>
        <div id="tab5" class="tabcontent">
            <ol class="moim_list">
                <c:forEach items="${moimListActive}" var="list" varStatus="status">
                    <li class="cat_moim"><a href="moim/getMoim/getMoim?moimNum=${list.moimNum}">
                        <figure>
                            <img src="/files/${i.moimImage}" alt="사진1" class="photo">
                            <div class="moim_info">
                                <div class="moim_location">${locList[status.index].locationName}</div>
                                <div class="moim_title">${list.moimTitle}</div>
                                <div class="moim_price">${list.moimPrice}원/1명</div>
                            </div>
                        </figure>
                    </a></li>
                </c:forEach>
            </ol>
        </div>

    </div>
</main>

<!-- 푸터 시작-->
<footer>
    <div id="footer_container">
        <div class="fotter_logo_menu">
            <a href="#"><img src="/imgs/userService/whiteLogo.png" alt="logo" width="200px"></a>
            <a href="#" class="footer_font">개인정보 처리방침</a>
            <a href="#" class="footer_font">기타 필요메뉴</a>
            <a href="#" class="footer_font">메뉴구성</a>
            <c:if test="${sessionScope.userIdNum!=null}">
                <a href="/logout" class="footer_font">로그아웃</a>
            </c:if>
        </div>
        <div>
            <a href="#" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
        </div>
    </div>
</footer>
<!-- 푸터 끝-->
</body>
</html>
