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
    <link rel="stylesheet" href="/css/profileService/hostlist.css">
    <link rel="stylesheet" href="/css/profileService/headerfooter_moimlist.css">


    <script>
    </script>
</head>


<body>
<!--헤더 시작-->
<header>
    <div id="header_container">
        <div id="header_logo"><a href="#"><img src="/imgs/moimmoimUi/logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="/moim/getMoim/list" class="header_menu">MOIM LIST</a>
            <a href="/hostList" class="header_menu here">HOST LIST</a>
            <a href="#" class="header_menu krfont">고객센터</a>
            <div id="login_icon"><a href="#"><img src="/imgs/moimmoimUi/mypage.png" alt="login" width="50px"></a></div>
        </div>
    </div>

    <div id="search">
        <div class="search_bar">
            <div class="search_box">
            <form action="/hostList" method="get">
                <div class="search_form">
                    <input type="search" placeholder="프로필을 검색해 보세요" id= "keyword" name="keyword">
                    <input type="hidden" id="cat" name="moimCategoryNum" value=7>
                    <button class="search_button">
                        <img src="/imgs/moimmoimUi/search2.png" class="search_icon"alt="search" width="30px" height="30px">
                    </button>
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
        <!--정렬 버튼-->
        <div class="dropdown">
            <button class="dropbtn"> 
                <img src="/imgs/moimmoimUi/sort.png" alt="사진1"; class="sort_image" width="30px" height="25px;">
            </button>
            <form action="/hostList" method="get">
            <div class="dropdown-sort">
                <select id="sort" name="sorting">
                    <option value=0>모임 주최 순</option>
                    <option value=1>나이순</option>
                </select>
            </div>
                <input type="hidden" id="cat" name="moimCategoryNum" value=${moimCategoryNum}>
                <button class="tablinks" onclick="openTab(event, 'tab2')">정렬 적용</button>
            </form>
        </div>


        <!-- 호스트 목록 -->
        <ol class="list">
            <c:forEach items="${proList}" var="proList" varStatus="status">
            <li>
                <a href="">
                <figure>
                    <img src=/files/${proList.userProfileImage} alt="사진1"; class="photo">
                    <div class="host_info">
                        <div class="host_level">${levelList[status.index]}</div>
                        <div class="host_reputation">
                            <span class="host_stars">${proList.userMoimReviewScoreAvg}</span>점 / <span class="number_of_times">${proList.userHostingCount}</span>회
                        </div>
                        <div class="host_name">${list[status.index]}</div>
                        <div class="host_introduction">${proList.userIntroduction}</div>
                    </div>
                </figure></a>
            </li>
            </c:forEach>
        </ol>

        <div>
            <ul class="paging">
                <c:if test="${paging.prev}">
                    <button><a href='<c:url value="/hostList?moimCategoryNum=${moimCategoryNum}&page=${paging.startPage-1}"/>'><img src="/imgs/moimmoimUi/prevPage.png" class="paging_icon" alt="prev"></a></button>
                </c:if>
                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                    <button class="paging_num"><a href='<c:url value="/hostList?moimCategoryNum=${moimCategoryNum}&page=${num}"/>'>${num}</a></button>
                </c:forEach>
                <c:if test="${paging.next && paging.endPage>0}">
                    <button><a href='<c:url value="/hostList?moimCategoryNum=${moimCategoryNum}&page=${paging.endPage+1}"/>'><img src="/imgs/moimmoimUi/nextPage.png" class="paging_icon" alt="next"></a></button>
                </c:if>
            </ul>
        </div>

    </main>




<!-- 푸터 시작-->
    <footer>
        <div id="footer_container">
            <div class="fotter_logo_menu">
                <a href="#"><img src="/imgs/moimmoimUi/whiteLogo.png" alt="logo" width="200px"></a>
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