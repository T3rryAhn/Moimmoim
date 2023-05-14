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
                <img src="/files/${profilePageDto.userProfileDto.userProfileImage}" alt="프사"; class="picture">
                <div class="profile_info">
                    <div class="profile_text level">${hostLevelName}</div>
                    <div class="profile_text nick">${profilePageDto.userProfileDto.userNickName}</div>
                    <div class="profile_text name">${profilePageDto.userProfileDto.userName}</div>
                    <div class="profile_text moimcount">${profilePageDto.userProfileDto.userHostingCount}회</div>
                </div>
            </div>
            <div class="prolist two">
                <div class="profile_info">
                    <div class="profile_text birthyear">출생: ${profilePageDto.userProfileDto.userBirth}</div>
                    <div class="profile_text phonenumber">휴대폰: ${profilePageDto.userProfileDto.phoneNum}</div>
                    <div class="profile_text email">이메일: ${profilePageDto.userProfileDto.userEmail}</div>
                    <div class="profile_text createdate">가입일: ${profilePageDto.userProfileDto.userCreateDate}</div>
                </div>
            </div>
            <div class="prolist three">
                <div class="profile_info">
                    <div class="profile_text interestedcat">관심있는 카테고리</div>
                    <div class="profile_text category">${categoryName}</div>
                </div>
            </div>
        </div>
    </div>
    <div class="rightpart">
        <div class="section_introduce">
            <div class="section_header">
                <div class="section_title">
                    <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> INTRODUCE</div>
            </div>
            <div class="introduce_content">${profilePageDto.userIntroduction}</div>
        </div>
        <div class="section_open">
            <div class="section_header">
                <div class="section_title">
                    <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> MOIMLIST</div>
            </div>
            <div class="oc_state">OPEN</div>
            <div class="open_moim_list">
                <c:choose>
                <c:when test="${fn:length(openMoimDoList)>3}">
                    <c:forEach items="${openMoimDoList}" var="openMoimDoList" varStatus="openstatus">
                        <c:if test="${openstatus.index le 2}">
                            <div class="open_moim">
                                <a href="/">
                                    <img src="/files/${openMoimDoList.moimImage}" alt="Picture 1" class="photo">
                                    <div class="moim_info">
                                        <div class="moim_location_price">${locationList[openstatus.index]}</div>
                                        <div class="moim_title">${openMoimDoList.moimTitle}</div>
                                        <div class="moim_location_price">${openMoimDoList.moimPrice}won/person</div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach var="openMoimDoList" items="${openMoimDoList}" varStatus="openstatus">
                    <div class="open_moim"><a href="/">
                        <img src="/files/${openMoimDoList.moimImage}" alt="사진1"; class="photo">
                        <div class="moim_info">
                            <div class="moim_location_price">${locationList[openstatus.index]}</div>
                            <div class="moim_title">${openMoimDoList.moimTitle}</div>
                            <div class="moim_location_price">${openMoimDoList.moimPrice}원/1인</div>
                        </div>
                    </a></div>
                    </c:forEach>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="section_closed">
            <div class="oc_state">CLOSED</div>
            <div class="closed_moim_list">
                <c:choose>
                    <c:when test="${fn:length(closedMoimDoList)>3}">
                    <c:forEach items="${closedMoimDoList}" var="closedMoimDoList" varStatus="closedstatus">
                        <c:if test="${closedstatus.index le 2}">
                            <div class="closed_moim">
                                <a href="/">
                                    <img src="/files/${closedMoimDoList.moimImage}" alt="Picture 1" class="photo">
                                    <div class="moim_info">
                                        <div class="moim_location_price">${locationList[closedstatus.index]}</div>
                                        <div class="moim_title">${closedMoimDoList.moimTitle}</div>
                                        <div class="moim_location_price">${closedMoimDoList.moimPrice}won/person</div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="closedMoimDoList" items="${closedMoimDoList}" varStatus="closedstatus">
                            <div class="closed_moim"><a href="/">
                                <img src="/files/${closedMoimDoList.moimImage}" alt="사진1"; class="photo">
                                <div class="moim_info">
                                    <div class="moim_location_price">${locationList[closedstatus.index]}</div>
                                    <div class="moim_title">${closedMoimDoList.moimTitle}</div>
                                    <div class="moim_location_price">${closedMoimDoList.moimPrice}원/1인</div>
                                </div>
                            </a></div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        </div>
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
</body>
</html>