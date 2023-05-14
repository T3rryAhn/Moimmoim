<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta chatset="UTF-8">
    <title>사용자 상세 페이지</title>
    <meta name="viewport" content="width=device-width , initial-scale=1.0" />
    <link rel="stylesheet" href="/css/Profile_Detail.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <header>
            <div id="header_container">
                <div id="header_logo"><a href="/"><img src="/imgs/moimmoimUi/logo.png" alt="logo" width="180px"></a></div>
                <div class="header_font">USER PROFILE</div>
                <c:if test="${sessionScope.userIdNum==null}">
                    <div id="login_icon"><a href="/login"><img src="/imgs/moimmoimUi/login.png" alt="login" width="40px"></a></div>
                </c:if>
                <c:if test="${sessionScope.userIdNum!=null}">
                    <div id="login_icon"><a href=/profilePage/${sessionScope.userIdNum}><img src="/imgs/moimmoimUi/mypage.png" alt="login" width="40px"></a></div>
                </c:if>
            </div>
        </header>
    </header>
    <main>
        <div class="section_profile">
            <div class="profile_list">
                <div class="prolist one">
                    <img src="img/profilepic.jpg" alt="프사"; class="picture">
                    <div class="profile_info">
                        <div class="profile_text level">주니어 호스트</div>
                        <div class="profile_text nick">DORICK</div>
                        <div class="profile_text name">김도균</div>
                        <div class="profile_text avgstar">4.2점</div>
                        <div class="profile_text moimcount">17회</div>
                    </div>
                </div>
                <div class="prolist two">
                    <div class="profile_info">
                        <div class="profile_text birthyear">출생: 1996년</div>
                        <div class="profile_text phonenumber">휴대폰: 010-1234-5678</div>
                        <div class="profile_text email">이메일: email@gmail.com</div>
                        <div class="profile_text createdate">가입일: 2022/01/01</div>
                    </div>
                </div>
                <div class="prolist three">
                    <div class="profile_info">
                        <div class="profile_text interestedcat">관심있는 카테고리</div>
                        <div class="profile_text category">먹기</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="rightpart">
            <div class="section_introduce">
                <div class="section_header">
                    <div class="section_title">
                        <img src="img/bar.png"; class="green_bar"> INTRODUCE</div>
                </div>
                <div class="itroduce_content">안녕하세요 원빈닮은 도릭입니다.</div>
            </div>
            <div class="section_open">
                <div class="section_header">
                    <div class="section_title">
                        <img src="img/bar.png"; class="green_bar"> MOIMLIST</div>
                </div>
                <div class="oc_state">OPEN</div>
                <div class="open_moim">
                    <div>
                        <ol class="slider-container list">
                            <li class="slide">
                                <a href="#"><figure>
                                    <img src="img/image1.jpg" alt="사진1"; class="photo">
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
            </div>
            <div class="section_closed">
            <div class="oc_state">CLOSED</div>
            <div class="closed_moim">

                <div>
                    <ol class="slider-container2 list">
                        <li class="slide2">
                            <a href="#"><figure>
                                <img src="img/image2.jpg" alt="사진1"; class="photo">
                                <div class="info">
                                    <div class="moim_location">서울시 종로구 평창동</div>
                                    <div class="title">1</div>
                                    <div class="moim_time">2023년 6월 18일 11시</div>
                                    <div class="moim_price">30,000원</div>
                                    <div class="num_of_people">3명 참여완료</div>
                                </div>
                            </figure></a>
                        </li>
                    </ol>
                </div>
                <a href="#" id="prev2"></a>
                <a href="#" id="next2"></a>
    </div>
            </div>

                    </div>



    </main>
    <footer>
        <div id="footer_container">
            <div id="logo" ><a href="/"><img src="/imgs/userService/whiteLogo.png" alt="logo" width="200px"></a></div>
            <a href="/" class="footer_font">개인정보 처리방침</a>
            <a href="/" class="footer_font">기타 필요메뉴</a>
            <a href="/" class="footer_font">메뉴구성</a>
            <c:if test="${sessionScope.userIdNum!=null}">
                <a href="/logout" class="footer_font">로그아웃</a>
            </c:if>
            <a href="/" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
        </div>
    </footer>
    <script src="/js/Profile_Detail.js"></script>

</body>
</html>