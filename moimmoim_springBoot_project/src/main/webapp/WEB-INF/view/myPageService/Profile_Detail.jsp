<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
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
                        <div class="profile_text moimcount">모임 개최: ${profilePageDto.userProfileDto.userHostingCount}회</div>
                    </div>
                </div>
                <div class="prolist two">
                    <div class="profile_info">
                        <div class="profile_text birthyear">출생: ${profilePageDto.userProfileDto.userBirth}년</div>
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
                <div class="itroduce_content">${profilePageDto.userIntroduction}</div>
            </div>
            <div class="section_open">
                <div class="section_header">
                    <div class="section_title">
                        <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> MOIMLIST</div>
                </div>
                <div class="oc_state">OPEN</div>
                <div class="open_moim">
                    <div>
                        <c:choose>
                        <c:when test="${openMoimDoList.size() == 0}">
                            <ol class="slider-container list no_moim">
                                모임이 없습니다!
                            </ol>
                        </c:when>
                        <c:otherwise>
                        <ol class="slider-container list">
                            <c:forEach var="openMoimDoList" items="${openMoimDoList}" varStatus="openstatus">
                            <li class="slide">
                                <a href="/moim/getMoim/getMoim?moimNum=${openMoimDoList.moimNum}"><figure>
                                    <img src="/files/${openMoimDoList.moimImage}" alt="사진1"; class="photo">
                                    <div class="info">
                                        <div class="moim_location">${locationList[openstatus.index]}</div>
                                        <div class="title">${openMoimDoList.moimTitle}</div>
                                        <div class="moim_time"><tf:formatDateTime value="${openMoimDoList.moimStartDate}" pattern="yyyy-MM-dd HH:mm" /></div>
                                        <div class="moim_price">${openMoimDoList.moimPrice}원</div>
                                        <div class="num_of_people">${openMoimDoList.moimMemberCount}명 참여중</div>
                                    </div>
                                </figure></a>
                            </li>
                            </c:forEach>
                        </ol>
                        </c:otherwise>
                        </c:choose>
                    </div>
                    <a href="#" id="prev"></a>
                    <a href="#" id="next"></a>
                </div>
            </div>
            <div class="section_closed">
            <div class="oc_state">CLOSED</div>
            <div class="closed_moim">
                <div>
                    <c:choose>
                    <c:when test="${closedMoimDoList.size() == 0}">
                        <ol class="slider-container2 list no_moim">
                            모임이 없습니다!
                        </ol>
                    </c:when>
                    <c:otherwise>
                    <ol class="slider-container2 list">
                        <c:forEach var="closedMoimDoList" items="${closedMoimDoList}" varStatus="closedstatus">
                            <li class="slide2">
                                <a href="/moim/getMoim/getMoim?moimNum=${closedMoimDoList.moimNum}"><figure>
                                    <img src="/files/${closedMoimDoList.moimImage}" alt="사진1"; class="photo">
                                    <div class="info">
                                        <div class="moim_location">${locationList[closedstatus.index]}</div>
                                        <div class="title">${closedMoimDoList.moimTitle}</div>
                                        <div class="moim_time"><tf:formatDateTime value="${closedMoimDoList.moimStartDate}" pattern="yyyy-MM-dd HH:mm" /></div>
                                        <div class="moim_price">${closedMoimDoList.moimPrice}원</div>
                                        <div class="num_of_people">${closedMoimDoList.moimMemberCount}명 참여함</div>
                                    </div>
                                </figure></a>
                            </li>
                        </c:forEach>
                    </ol>
                    </c:otherwise>
                    </c:choose>
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