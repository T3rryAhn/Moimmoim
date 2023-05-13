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
        <div id="header_logo"><a href="#"><img src="res/img/logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="#" class="header_menu">MOIM LIST</a>
            <a href="#" class="header_menu here">HOST LIST</a>
            <a href="#" class="header_menu krfont">고객센터</a>
            <div id="login_icon"><a href="#"><img src="res/img/mypage.png" alt="login" width="50px"></a></div>
        </div>
    </div>

    <div id="search">
        <div class="search_bar">
            <div class="search_box">
                <div class="search_form">
                    <input type="search" placeholder="모임을 검색해 보세요">
                    <button class="search_button">
                        <img src="res/img/search2.png" class="search_icon"alt="search" width="30px" height="30px">
                    </button>
                </div>
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
                <img src="res/img/sort.png" alt="사진1"; class="sort_image" width="30px" height="25px;">
            </button>
            <div class="dropdown-sort">
                <a>정렬기준 1</a>
                <a>정렬기준 2</a>
                <a>정렬기준 3</a>
                <a>정렬기준 4</a>
            </div>
        </div>

        <!-- 호스트 목록 -->
        <ol class="list">
            <c:forEach items="${proList}" var="proList" varStatus="status">
            <li>
                <a href="">
                <figure>
                    <img src=/files/${proList.userProfileImage} alt="사진1"; class="photo">
                    <div class="host_info">
                        <div class="host_level">슈퍼 호스트 따로 넣어라</div>
                        <div class="host_reputation">
                            <span class="host_stars">${proList.userMoimReviewScoreAvg}</span>점 / <span class="number_of_times">${proList.userHostingCount}</span>회
                        </div>
                        <div class="host_name">이것도 따로 넣어라</div>
                        <div class="host_introduction">${proList.userIntroduction}</div>
                    </div>
                </figure></a>
            </li>
            </c:forEach>
        </ol>
        <!--
            <li>
                <figure>
                    <img src="res/img/image1.jpg" alt="사진1"; class="photo">
                    <div class="host_info">
                        <div class="host_level">슈퍼 호스트</div>
                        <div class="host_reputation">
                            <span class="host_stars">4</span>점 / <span class="number_of_times">37</span>회
                        </div>
                        <div class="host_name">손종석</div>
                        <div class="host_introduction">안녕하세요! 다양한 분들과의 만남을 즐기는 김모임입니다. 저와 함께 모임을...</div>
                    </div>
                </figure>
            </li>
        -->

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
        <!--
        <div> 
            <ul class="paging">
                <button><a href="#"><img src="res/img/prevPage.png" class="paging_icon" alt="prev"></a></button>
                <button class="paging_num"><a href="#">1</a></button>
                <button class="paging_num"><a href="#">2</a></button>
                <button class="paging_num"><a href="#">3</a></button>
                <button class="paging_num"><a href="#">4</a></button>
                <button><a href="#"><img src="res/img/nextPage.png" class="paging_icon" alt="next"></a></button>
            </ul>
        </div>
                -->
    </main>




<!-- 푸터 시작-->
    <footer>
        <div id="footer_container">
            <div class="fotter_logo_menu">
                <a href="#"><img src="res/img/logo_white.png" alt="logo" width="200px"></a>
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