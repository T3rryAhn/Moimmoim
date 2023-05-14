<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>${make == 1 ? '마이페이지 > 내가 만든 모임' : '마이페이지 > 내가 참가한 모임'}</title>
    <link rel="stylesheet" href="/css/myPageUi/mycreate_moim.css">
    <link rel="stylesheet" href="/css/myPageUi/headerfooter_basic.css">
</head>


<body>
<!--헤더 시작-->
<header>
    <div id="header_container">
        <div id="header_logo"><a href="/"><img src="\imgs\moimmoimUi\logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="/moim/getMoim/list" class="header_menu">MOIM LIST</a>
            <a href="/hostList" class="header_menu">HOST LIST</a>
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
            <h1 class="moim_title">마이페이지 > ${make == 1 ? '내가 만든 모임' : '내가 참가한 모임'}</h1>
        </div>






<!--opened moims-->
        <div class="box box2">
            <h1 class="status">
                <img src="/imgs/moimmoimUi/bar.png"; class="green_bar">
                OPEN </h1>
            <div>
                <ol class="slider-container list">
                <c:forEach items="${openList}" var="openList" varStatus="status">
                    <li class="slide">
                        <a href=getMoim?moimNum=${openList.moimNum}><figure>
                            <img src="/files/${openList.moimImage}" alt="사진1"; class="photo">
                            <div class="info">
                                <div class="moim_location">${locList[status.index].locationName}</div>
                                <div class="title">${openList.moimTitle}</div>
                                <div class="moim_time"><tf:formatDateTime value="${openList.moimCreateDate}" pattern="yyyy-MM-dd" /></div>
                                <div class="moim_price">${openList.moimPrice}원</div>
                                <div class="num_of_people">${openList.moimMemberCount}명 참여중</div>
                            </div>
                        </figure></a>
                    </li>
                    </c:forEach>
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
                <c:forEach items="${closeList}" var="closeList" varStatus="status">
                    <li class="slide">
                    <a href=getMoim?moimNum=${closeList.moimNum}><figure>
                        <img src="/files/${closeList.moimImage}" alt="사진1"; class="photo">
                        <div class="info">
                            <div class="moim_location">${locList[status.index].locationName}</div>
                            <div class="title">${closeList.moimTitle}</div>
                            <div class="moim_time"><tf:formatDateTime value="${closeList.moimCreateDate}" pattern="yyyy-MM-dd" /></div>
                            <div class="moim_price">${closeList.moimPrice}원</div>
                            <div class="num_of_people">${closeList.moimMemberCount}명 참여</div>
                        </div>
                        </figure></a>
                    </li>
                </c:forEach>
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
    <script src="/js/myPageService/mycreate_moim.js"></script>

</body>
</html>