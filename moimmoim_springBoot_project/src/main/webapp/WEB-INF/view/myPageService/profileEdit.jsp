<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta chatset="UTF-8">
    <title>프로필 등록 페이지</title>
    <meta name="viewport" content="width=device-width , initial-scale=1.0" />
    <link rel="stylesheet" href="/css/myPageUi/profileEdit.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <header>
            <div id="header_container">
                <div id="header_logo"><a href="/"><img src="/imgs/moimmoimUi/logo.png" alt="logo" width="180px"></a></div>
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
        <form method="POST" action="/myPage/profileEdit/${sessionScope.userIdNum}">
        <div class="allside">
            <div class="leftside">
               <div class="profile_list">
                   <div id="previewContainer">
                       <img id="profileImg" src="/files/${profilePageDto.userProfileDto.userProfileImage}" alt="프사" class="picture">
                   </div>
                   <a onclick="window.open('/profileImg', '이미지 등록')"><%--<label for="profileImageInput">--%>업로드</label></a>
                   <%--<input type="file" id="profileImageInput" onchange="previewImage(event)" style="display: none">--%>

                   <script src="profile_edit.js"></script>

                    <div class="prolist one">
                            <div class="profile_info">
                            <div class="profile_text level">${hostLevelName}</div>
                            <div class="profile_text nick">${profilePageDto.userProfileDto.userNickName}</div>
                            <div class="profile_text name">${profilePageDto.userProfileDto.userName}</div>
                            <div class="profile_text avgstar">${profilePageDto.userProfileDto.userMoimReviewScoreAvg}</div>
                            <div class="profile_text moimcount">${profilePageDto.userProfileDto.userHostingCount}</div>
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
            <div class="rightside">
                <div class="section_introduceedit">
                <div class="section_header">
                    <div class="section_title">
                        <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> INTRODUCE EDIT</div>
                </div>
                <label for="userIntroduction">자기소개</label>
                <textarea id="userIntroduction" name="userIntroduction" class="introduceedit"
                          placeholder="${profilePageDto.userIntroduction}" cols="130" rows="10"></textarea>

            </div>
            <div class="section_profileedit">
                <div class="section_header">
                    <div class="section_title">
                        <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> PROFILE EDIT</div>
                </div>

                    <fieldset>

                        <ul class="profileedit">

                            <li>
                                <label for="userNickname">닉네임</label>
                                <input type="text" id="userNickname" name="userNickname" class="nicknameedit"
                                       placeholder="${profilePageDto.userProfileDto.userNickName}" required>
                            </li>
                            <li>
                                <label for="phoneNum">전화번호</label>
                                <input type="tel" id="phoneNum" name="phoneNum" class="phonenumberedit" placeholder="하이픈 빼고 입력해주세요. (01012345678)" required>
                            </li>
                            <!-- <li>
                                <label for="location">지역</label>
                                <input type="text" name="location" class="locationedit" required>
                            </li> -->
                            <li>
                                <label for="birth">출생연도</label>
                                <select id="birth" name="userBirth" class="birthyearedit"></select>
                                <script src="/js/myPageService/profileEdit.js"></script>
                            </li>
                            <li>
                                관심 카테고리

                                <label><input type="radio" name="categoryNum" value="1">먹기</label>
                                <label><input type="radio" name="categoryNum" value="2">보기</label>
                                <label><input type="radio" name="categoryNum" value="3">배우기</label>
                                <label><input type="radio" name="categoryNum" value="4">힐링하기</label>
                                <label><input type="radio" name="categoryNum" value="5">체험하기</label>

                            </li>
                        </ul>
                    </fieldset>
                <button type="submit" id="saveButton">저장</button>

                </div>
            </div>
        </div>
        </form>

         </main>
    <footer>
        <div id="footer_container">
            <div id="logo" ><a href="/"><img src="img/logo_white.png" alt="logo" width="200px"></a></div>
            <a href="/" class="footer_font">개인정보 처리방침</a>
            <a href="/" class="footer_font">기타 필요메뉴</a>
            <a href="/" class="footer_font">메뉴구성</a>
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