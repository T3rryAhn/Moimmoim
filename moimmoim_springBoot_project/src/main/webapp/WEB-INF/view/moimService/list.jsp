<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">


<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>MOIMMOIM MOIM LIST</title>
    <link rel="stylesheet" href="/css/moimCss/hostlist.css">
    <link rel="stylesheet" href="/css/moimCss/body_search.css">
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
            <a href="#" class="header_menu">고객센터</a>
            <div id="login_icon"><a href="#"><img src="res/img/login.png" alt="login" width="50px"></a></div>
        </div>
    </div>
    <div id="search">
        <div class="search_bar">
            <img src="res/img/search.png" width="37.33px">
            <input type="search" placeholder="호스트를 검색해 보세요">
        </div>
    </div>
</header>
<!--헤더 끝-->


<main>
<!-- HOST LIST 시작-->
    <div class="main_container">
    <!--툴바(필터 및 정렬 기능)-->
    <div class="toolbar">
        <!-- 호스트리스트 필터 -->
        <div class="filter">
            <div class="dropdown">
                <button class="dropbtn">
                    <span class="dropbtn_icon">호스트 레벨</span>
                </button>
                <div class="dropdown-hostlevel">
                    <a>뉴비 호스트</a>
                    <a>주니어 호스트</a>
                    <a>시니어 호스트</a>
                    <a>슈퍼 호스트</a>
                </div>
            </div>
            <!-- 별점리스트 필터 -->
            <div class="dropdown">
                <button class="dropbtn">
                    <span class="dropbtn_icon">별점</span>
                </button>
                <div class="dropdown-stars">
                    <a><span class="stars">3</span>점 이상</a>
                    <a><span class="stars">3.5</span>점 이상</a>
                    <a><span class="stars">4</span>점 이상</a>
                    <a><span class="stars">4.5</span>점 이상</a>
                </div>
            </div>
        </div>
        <div class="sort">
            <div class="dropdown">
                <button class="dropbtn">
                    <span class="dropbtn_icon">정렬 기준</span>
                </button>
                <div class="dropdown-sort">
                    <a>정렬기준 1</a>
                    <a>정렬기준 2</a>
                    <a>정렬기준 3</a>
                    <a>정렬기준 4</a>
                </div>
            </div>

        </div>



    </div>

    <!-- 모임 목록 -->
        <ol class="list">
            <c:forEach items="${list}" var="list" varStatus="status">
            <li>
                <figure>
                    <img src="/imgs/moim_img/image1.jpg" alt="사진1"; class="host_photo">
                    <div class="host_info">
                        <div class="host_level">${locList[status.index].location_name}</div>        <!--장소-->
                        <div class="host_reputation">
                            <span class="host_stars">${list.moimStartDate}</span>        <!--모임 시작 시간-->
                        </div>
                        <div class="host_name">${list.moimTitle}</div>              <!--모임 제목-->
                        <div class="host_introduction">${list.moimMainContent}</div> <!--모임 소개-->
                    </div>
                </figure>
            </li>
            </c:forEach>
        </ol>
        <hr>
        <!--페이징 시작 -->
        <ul class="paging">
            <c:if test="${paging.prev}">
                <span><a href='<c:url value="/moim/getMoim/list?moimCategoryNum=${moimCategoryNum}&page=${paging.startPage-1}"/>'>이전</a></span>
            </c:if>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                <span><a href='<c:url value="/moim/getMoim/list?moimCategoryNum=${moimCategoryNum}&page=${num}"/>'>${num}</a></span>
            </c:forEach>
            <c:if test="${paging.next && paging.endPage>0}">
                <span><a href='<c:url value="/moim/getMoim/list?moimCategoryNum=${moimCategoryNum}&page=${paging.endPage+1}"/>'>다음</a></span>
            </c:if>
        </ul>
        <!--페이징 끝 -->
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