<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>MOIMMOIM HOST LIST</title>
    <link rel="stylesheet" href="/css/moimCss/moimlist.css">
    <link rel="stylesheet" href="/css/moimCss/headerfooter_moimlist.css">

    <script>
        function openTab(evt, tabName) {
        // 모든 탭 버튼에서 active 클래스 제거
        var tablinks = document.getElementsByClassName("tablinks");
        for (var i = 0; i < tablinks.length; i++) {
            tablinks[i].classList.remove("active");
        }
        // 선택된 탭 버튼에 active 클래스 추가
        evt.currentTarget.classList.add("active");
        }
    </script>
</head>

<body>
<!--헤더 시작-->
<header>
    <!--로그인 전 헤더-->
    <div id="header_container">
        <div id="header_logo"><a href="/"><img src="\imgs\moimmoimUi\logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="/moim/getMoim/list" class="header_menu here">MOIM LIST</a>
            <a href="#" class="header_menu">HOST LIST</a>
            <a href="#" class="header_login login">LOG IN</a>
        </div>
    </div>
    <!-- 로그인 버튼 색상 수정 필요 :: class="header_login login" -->


    <!--로그인 후 헤더-->
    <!-- <div id="header_container">
        <div id="header_logo"><a href="/"><img src="\imgs\moimmoimUi\logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="#" class="header_menu here">MOIM LIST</a>
            <a href="#" class="header_menu">HOST LIST</a>
            <div id="mypage_icon"><a href="/"><img src="\imgs\moimmoimUi\mypage.png" alt="mypage" width="40px"></a></div>
        </div>
    </div> -->
    <!-- 로그인 버튼 간격 조정 필요 -->

    <div id="search">
        <div class="search_bar">
            <div class="search_box">
                <form action="/moim/getMoim/list" method="get">
                    <div class="search_form">
                        <input type="search" placeholder="모임을 검색해 보세요" id= "keyword" name="keyword">
                        <input type="hidden" id="cat" name="moimCategoryNum" value=7>
                        <button class="search_button">
                            <img src="\imgs\moimmoimUi\search2.png" class="search_icon"alt="search" width="30px" height="30px">
                        </button>
                        <!-- <input type="submit"/>  이거.. 어떻게 적용시켜야 할지 모르겠어요ㅠ_ㅠ -->
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>
<!--헤더 끝-->

<main>
<!-- HOST LIST 시작-->
    <div class="main_container">
        <!--카테고리 이동-->
        <div class="tab">
            <form action="/moim/getMoim/list" method="get">
                <input type="hidden" id="cat" name="moimCategoryNum" value=1>
                <button class="tablinks active" onclick="openTab(event, 'tab1')">🍴 먹기</button>
            </form>
            <form action="/moim/getMoim/list" method="get">
                <input type="hidden" id="cat" name="moimCategoryNum" value=1>
                <button class="tablinks" onclick="openTab(event, 'tab2')">🎞 보기</button>
            </form>
            <form action="/moim/getMoim/list" method="get">
                <input type="hidden" id="cat" name="moimCategoryNum" value=1>
                <button class="tablinks" onclick="openTab(event, 'tab3')">🎨 배우기</button>
            </form>
            <form action="/moim/getMoim/list" method="get">
                <input type="hidden" id="cat" name="moimCategoryNum" value=1>
                <button class="tablinks" onclick="openTab(event, 'tab4')">🎈 힐링하기</button>
            </form>
            <form action="/moim/getMoim/list" method="get">
                <input type="hidden" id="cat" name="moimCategoryNum" value=1>
                <button class="tablinks" onclick="openTab(event, 'tab5')">🎠 체험하기</button>
            </form>
        </div>
        <!--정렬 버튼-->
        <div class="dropdown">
            <button class="dropbtn">
                <img src="\imgs\moimmoimUi\sort.png" alt="사진1"; class="sort_image" width="30px" height="25px;">
            </button>
            <div class="dropdown-sort">
                <a>정렬기준 1</a>
                <a>정렬기준 2</a>
                <a>정렬기준 3</a>
                <a>정렬기준 4</a>
            </div>
        </div>

        <!--모임 리스트 -->
        <ol class="list">
            <c:forEach items="${list}" var="list" varStatus="status">
            <li>
                <a href="getMoim?moimNum=${list.moimNum}">
                <figure>
                    <img src="/imgs/moim_img/image1.jpg" alt="사진1"; class="photo">
                    <div class="info">
                        <div class="moim_location">${locList[status.index].locationName}</div>
                        <div class="title">${list.moimTitle}</div>
                        <div class="moim_time"><tf:formatDateTime value="${list.moimCreateDate}" pattern="yyyy-MM-dd" /></div>
                        <div class="moim_price">${list.moimPrice}원<!-- JSTL 수정 필요 --> </div>
                        <div class="num_of_people">${list.moimMemberCount}명 참여중</div>
                    </div>
                </figure></a>
            </li>
            </c:forEach>
        </ol>
        <!--모임 작성 버튼-->
        <div class="create_moim">
            <button class="create_moim"><a href="#">
                <img src="\imgs\moimmoimUi\createMoim.png" alt="create moim" width="55px" height="53px">
            </a></button>
        </div>

        <!--페이징 -->
        <div>
            <ul class="paging">
                <c:if test="${paging.prev}">
                    <button><a href='<c:url value="/moim/getMoim/list?moimCategoryNum=${moimCategoryNum}&page=${paging.startPage-1}"/>'><img src="res/img/prevPage.png" class="paging_icon" alt="prev"></a></button>
                </c:if>
                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                    <button class="paging_num"><a href='<c:url value="/moim/getMoim/list?moimCategoryNum=${moimCategoryNum}&page=${num}"/>'>${num}</a></button>
                </c:forEach>
                <c:if test="${paging.next && paging.endPage>0}">
                    <button><a href='<c:url value="/moim/getMoim/list?moimCategoryNum=${moimCategoryNum}&page=${paging.endPage+1}"/>'><img src="res/img/nextPage.png" class="paging_icon" alt="next"></a></button>
                </c:if>
            </ul>
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
            </div>
            <div>
                <a href="#" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
            </div>
        </div>
    </footer>
<!-- 푸터 끝-->
    <script src="hostlist.js"></script>
</body>
</html>