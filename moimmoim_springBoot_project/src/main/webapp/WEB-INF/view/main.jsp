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
    <script>
        function openTab(evt, tabName) {
            // 모든 탭 컨텐츠를 숨김
            var tabcontent = document.getElementsByClassName("tabcontent");
            for (var i = 0; i < tabcontent.length; i++) {
                tabcontent[i].classList.remove("active");
            }

            // 모든 탭 버튼에서 active 클래스 제거
            var tablinks = document.getElementsByClassName("tablinks");
            for (var i = 0; i < tablinks.length; i++) {
                tablinks[i].classList.remove("active");
            }

            // 선택된 탭 버튼에 active 클래스 추가
            evt.currentTarget.classList.add("active");

            // 선택된 탭 컨텐츠에 active 클래스 추가
            var selectedTab = document.getElementById(tabName);
            selectedTab.classList.add("active");
        }
    </script>
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
        <div class="popular_list">
            <div class="popular left"><a href="/">
                <img src="/imgs/moim_img/image1.jpg" alt="사진1"; class="popular_photo">
                <%--MOIM_POST의 MOIM_PICTURES가 대표사진으로 뜨도록--%>
                <div class="moim_info">
                    <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                </div>
            </a></div>
            <div class="popular middle"><a href="/">
                <img src="/imgs/moim_img/image2.jpg" alt="사진1"; class="popular_photo">
                <div class="moim_info">
                    <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                </div>
            </a></div>
            <div class="popular right"><a href="/">
                <img src="/imgs/moim_img/image3.jpg" alt="사진1"; class="popular_photo">
                <div class="moim_info">
                    <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                </div>
            </a></div>
        </div>
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
            <div class="cat_moim_list">
                <div class="cat_moim left"><a href="/">
                    <img src="/imgs/moim_img/image1.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">먹기</div>
                        <div class="moim_title">먹기 탭입니다</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim middle"><a href="/">
                    <img src="/imgs/moim_img/image2.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim middle"><a href="/">
                    <img src="/imgs/moim_img/image3.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim right"><a href="/">
                    <img src="/imgs/moim_img/image4.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
            </div>
        </div>
        <div id="tab2" class="tabcontent">
            <div class="cat_moim_list">
                <div class="cat_moim left"><a href="/">
                    <img src="/imgs/moim_img/image1.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">보기</div>
                        <div class="moim_title">보기 탭입니다!</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim middle"><a href="/">
                    <img src="/imgs/moim_img/image2.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim middle"><a href="/">
                    <img src="/imgs/moim_img/image3.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim right"><a href="/">
                    <img src="/imgs/moim_img/image4.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
            </div>
        </div>
        <div id="tab3" class="tabcontent">
            <div class="cat_moim_list">
                <div class="cat_moim left"><a href="/">
                    <img src="/imgs/moim_img/image1.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">배우기</div>
                        <div class="moim_title">배우기 탭입니다!</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim middle"><a href="/">
                    <img src="/imgs/moim_img/image2.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim middle"><a href="/">
                    <img src="/imgs/moim_img/image3.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim right"><a href="/">
                    <img src="/imgs/moim_img/image4.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
            </div>
        </div>
        <div id="tab4" class="tabcontent">
            <div class="cat_moim_list">
                <div class="cat_moim left"><a href="/">
                    <img src="/imgs/moim_img/image1.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">힐링하기</div>
                        <div class="moim_title">힐링하기 탭입니다.</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim middle"><a href="/">
                    <img src="/imgs/moim_img/image2.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim middle"><a href="/">
                    <img src="/imgs/moim_img/image3.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim right"><a href="/">
                    <img src="/imgs/moim_img/image4.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
            </div>
        </div>
        <div id="tab5" class="tabcontent">
            <div class="cat_moim_list">
                <div class="cat_moim left"><a href="/">
                    <img src="/imgs/moim_img/image1.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">체험하기</div>
                        <div class="moim_title">체험하기 탭입니다.</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim middle"><a href="/">
                    <img src="/imgs/moim_img/image2.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim middle"><a href="/">
                    <img src="/imgs/moim_img/image3.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="cat_moim right"><a href="/">
                    <img src="/imgs/moim_img/image4.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
            </div>
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
        </div>
        <div>
            <a href="#" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
        </div>
    </div>
</footer>
<!-- 푸터 끝-->
</body>
</html>
