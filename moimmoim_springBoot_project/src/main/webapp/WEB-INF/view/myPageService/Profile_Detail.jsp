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
                    <div class="profile_text avgstar">${profilePageDto.userProfileDto.userMoimReviewScoreAvg}점</div>
                    <div class="profile_text moimcount">${profilePageDto.userProfileDto.userHostingCount}회</div>
                </div>
            </div>
            <div class="prolist two">
                <div class="profile_info">
                    <div class="profile_text birthyear">${profilePageDto.userProfileDto.userBirth}</div>
                    <%--<div class="profile_text birthlocation">서울</div>--%>
                    <div class="profile_text phonenumber">&#128241 ${profilePageDto.userProfileDto.phoneNum}</div>
                    <div class="profile_text email">&#128231 ${profilePageDto.userProfileDto.userEmail}</div>
                    <div class="profile_text createdate">${profilePageDto.userProfileDto.userCreateDate}</div>
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
                <c:when test="${fn:length(moimDoList)>3}">
                    <c:forEach items="${moimDoList}" var="moimDo" varStatus="openstatus">
                        <c:if test="${moimDo.moimDeadCheck eq 0}">
                        <c:if test="${openstatus.index le 3}">
                            <div class="open_moim">
                                <a href="/">
                                    <img src="/files/${moimDo.moimImage}" alt="Picture 1" class="photo">
                                    <div class="moim_info">
                                        <div class="moim_location_price">${locationList[openstatus.index]}</div>
                                        <div class="moim_title">${moimDo.moimTitle}</div>
                                        <div class="moim_location_price">${moimDo.moimPrice}won/person</div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                        </c:if>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach var="moimDo" items="${moimDoList}" varStatus="openstatus">
                    <c:if test="${moimDo.moimDeadCheck eq 0}">
                    <div class="open_moim"><a href="/">
                        <img src="/files/${moimDo.moimImage}" alt="사진1"; class="photo">
                        <div class="moim_info">
                            <div class="moim_location_price">${locationList[openstatus.index]}</div>
                            <div class="moim_title">${moimDo.moimTitle}</div>
                            <div class="moim_location_price">${moimDo.moimPrice}원/1인</div>
                        </div>
                    </a></div>
                    </c:if>
                    </c:forEach>
                </c:otherwise>
                </c:choose>

                <%--<div class="open_moim"><a href="/">
                    <img src="/files/${moimDoList[0].moimImage}" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">${locationList[0]}</div>
                        <div class="moim_title">${moimDoList[0].moimTitle}</div>
                        <div class="moim_location_price">${moimDoList[0].moimPrice}원/1인</div>
                    </div>
                </a></div>
                <div class="open_moim"><a href="/">
                    <img src="img/image2.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">${locationList[0]}</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>
                <div class="open_moim"><a href="/">
                    <img src="img/image3.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <div class="moim_location_price">20,000원/1인</div>
                    </div>
                </a></div>--%>
            </div>
        </div>
        <div class="section_closed">
            <div class="oc_state">CLOSED</div>
            <div class="closed_moim_list">
                <c:choose>
                    <c:when test="${fn:length(moimDoList)>3}">
                        <c:forEach items="${moimDoList}" var="moimDo" varStatus="closedstatus">
                            <c:if test="${moimDo.moimDeadCheck eq 1}">
                                <c:if test="${closedstatus.index le 2}">
                                    <div class="closed_moim">
                                        <a href="/">
                                            <img src="/files/${moimDo.moimImage}" alt="Picture 1" class="photo">
                                            <div class="moim_info">
                                                <div class="moim_location_price">${locationList[closedstatus.index]}</div>
                                                <div class="moim_title">${moimDo.moimTitle}</div>
                                                <div class="moim_location_price">${moimDo.moimPrice}won/person</div>
                                            </div>
                                        </a>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="moimDo" items="${moimDoList}" varStatus="closedstatus">
                            <c:if test="${moimDo.moimDeadCheck eq 1}">
                                <div class="closed_moim"><a href="/">
                                    <img src="/files/${moimDo.moimImage}" alt="사진1"; class="photo">
                                    <div class="moim_info">
                                        <div class="moim_location_price">${locationList[closedstatus.index]}</div>
                                        <div class="moim_title">${moimDo.moimTitle}</div>
                                        <div class="moim_location_price">${moimDo.moimPrice}원/1인</div>
                                    </div>
                                </a></div>
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="section_reviews">
            <div class="section_header">
                <div class="section_title">
                    <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> REVIEWS</div>
            </div>
            <div class="reviews_list">
                <div class="reviews_content">
                    <div class="reviews_nickname">DORIC</div>
                    <div class="reviews_date">230101</div>
                    <div class="reviews_text">재밌었어요</div>
                    <img src="img/starpic.png" alt="평점"; class="reviews_starpoint">
                </div>


                <div class="reviews_content">
                    <div class="reviews_nickname">DORIC</div>
                    <div class="reviews_date">230101</div>
                    <div class="reviews_text">재밌었어요</div>
                    <img src="img/starpic.png" alt="평점"; class="reviews_starpoint">
                </div>


                <div class="reviews_content">
                    <div class="reviews_nickname">DORIC</div>
                    <div class="reviews_date">230101</div>
                    <div class="reviews_text">재밌었어요</div>
                    <img src="img/starpic.png" alt="평점"; class="reviews_starpoint">
                </div>

                <div class="reviews_content">
                    <div class="reviews_nickname">DORIC</div>
                    <div class="reviews_date">230101</div>
                    <div class="reviews_text">재밌었어요</div>
                    <img src="img/starpic.png" alt="평점"; class="reviews_starpoint">
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
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <a href="/" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
    </div>
</footer>
</body>
</html>