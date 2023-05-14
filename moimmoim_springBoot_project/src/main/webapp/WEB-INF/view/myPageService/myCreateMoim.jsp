<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>마이페이지 > 내가 만든 모임</title>
    <link rel="stylesheet" href="mycreate_moim.css">
    <link rel="stylesheet" href="headerfooter_basic.css">
</head>


<body>
<!--헤더 시작-->
<header>
    <div id="header_container">
        <div id="header_logo"><a href="/"><img src="\imgs\moimmoimUi\logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="/moim/getMoim/list" class="header_menu">MOIM LIST</a>
            <a href="#" class="header_menu">HOST LIST</a>
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
    <div class="container">
    <div class="form-group">
<!--페이지 제목-->
        <div class="box box1">
            <h1 class="moim_title">마이페이지 > 내가 만든 모임</h1>
        </div>


<!--opened moims-->
        <div class="box box2">
            <h1 class="status">
                <img src="/imgs/moimmoimUi/bar.png"; class="green_bar">
                OPEN </h1>
            <div>
                <ol class="slider-container list">
                    <li class="slide">
                        <a href="#"><figure>
                            <img src="res/img/image1.jpg" alt="사진1"; class="photo">
                            <div class="info">
                                <div class="moim_location">서울시 종로구 평창동</div>
                                <div class="title">1</div>
                                <div class="moim_time">2023년 6월 18일 11시</div>
                                <div class="moim_price">30,000원</div>
                                <div class="num_of_people">3명 참여중</div>
                            </div>
                        </figure></a>
                    </li>
                </ol>
            </div>
            <a href="#" id="prev"></a>
            <a href="#" id="next"></a>
        </div>

<!--closed moims-->
        <div class="box box3">
            <h1 class="status">
                <img src="/imgs/moimmoimUi/bar.png"; class="green_bar">
                CLOSE </h1>
            <div>
                <ol class="slider-container2 list">
                    <li class="slide2">
                        <a href="#"><figure>
                            <img src="res/img/image1.jpg" alt="사진1"; class="photo">
                            <div class="info">
                                <div class="moim_location">서울시 종로구 평창동</div>
                                <div class="title">1</div>
                                <div class="moim_time">2023년 6월 18일 11시</div>
                                <div class="moim_price">30,000원</div>
                                <div class="num_of_people">3명 참여중</div>
                            </div>
                        </figure></a>
                    </li>
                </ol>
            </div>
            <a href="#" id="prev2"></a>
            <a href="#" id="next2"></a>
</div>
</main>

<!-- 푸터 시작-->
    <footer>
        <div id="footer_container">
            <div class="footer_logo_menu">
                <a href="#"><img src="\imgs\moimmoimUi\whiteLogo.png" alt="logo" width="200px"></a>
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
    <script src="/js/myPage/Service/mycreate_moim.js"></script>

</body>
</html>