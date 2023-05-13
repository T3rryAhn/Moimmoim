<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta chatset="UTF-8">
    <title>사용자 상세 페이지</title>
    <meta name="viewport" content="width=device-width , initial-scale=1.0" />
    <link rel="stylesheet" href="css/myPageUi/profilePage">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <header>
            <div id="header_container">
                <div id="header_logo"><a href="/"><img src="img/logo.png" alt="logo" width="180px"></a></div>
                <div class="header_font">USER PROFILE</div>
                    <div id="login_icon"><a href="/"><img src="img/login.png" alt="login" width="40px"></a></div>

            </div>
        </header>
    </header>
    <main>
        <div class="section_profile">
            <div class="profile_list">
                <div class="prolist one">
                    <img src="img/profilepic.jpg" alt="프사"; class="picture">
                    <div class="profile_info">
                        <div class="profile_text level">주니어 호스트</div>
                        <div class="profile_text nick">${profilePageDto.userProfileDto.userNickName}</div>
                        <div class="profile_text name">${profilePageDto.userProfileDto.userName}</div>
                        <div class="profile_text avgstar">${profilePageDto.userProfileDto.userMoimReviewScoreAvg}</div>
                        <div class="profile_text moimcount">${profilePageDto.userProfileDto.userHostingCount}</div>
                    </div>
                </div>
                <div class="prolist two">
                    <div class="profile_info">
                        <div class="profile_text birthyear">출생: ${profilePageDto.userProfileDto.userBirth}</div>
                        <!-- <div class="profile_text birthlocation">Loction: 서울</div> -->
                        <div class="profile_text phonenumber">휴대폰: ${profilePageDto.userProfileDto.phoneNum}</div>
                        <div class="profile_text email">이메일: ${profilePageDto.userProfileDto.userEmail}</div>
                        <div class="profile_text createdate">가입일: ${profilePageDto.userProfileDto.userCreateDate}</div>
                    </div>
                </div>
                <div class="prolist three">
                    <div class="profile_info">
                        <div class="profile_text interestedcat">관심있는 카테고리</div>
                        <div class="profile_text category">먹기</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="rightpart">
            <div class="section_introduce">
                <div class="section_header">
                    <div class="section_title">
                        <img src="img/bar.png"; class="green_bar"> INTRODUCE</div>
                </div>
                <div class="itroduce_content">${profilePageDto.userIntroduction}</div>
            </div>
            <div class="section_open">
                <div class="section_header">
                    <div class="section_title">
                        <img src="img/bar.png"; class="green_bar"> MOIMLIST</div>
                </div>
                <div class="oc_state">OPEN</div>
                <div class="open_moim_list">
                    <div class="open_moim"><a href="/">
                        <img src="img/image1.jpg" alt="사진1"; class="photo">
                        <div class="moim_info">
                            <div class="moim_location_price">서울시 관악구</div>
                            <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                            <div class="moim_location_price">20,000원/1인</div>
                        </div>
                    </a></div>
                    <div class="open_moim"><a href="/">
                        <img src="img/image2.jpg" alt="사진1"; class="photo">
                        <div class="moim_info">
                            <div class="moim_location_price">서울시 관악구</div>
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
                    </a></div>
                </div>
            </div>
            <div class="section_closed">
            <div class="oc_state">CLOSED</div>
            <div class="closed_moim_list">
                <div class="closed_moim"><a href="/">
                    <img src="img/image5.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <img src="img/starpic.png" alt="별점"; class="moim_starpoint">
                    </div>
                </a></div>
                <div class="closed_moim"><a href="/">
                    <img src="img/image6.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <img src="img/starpic.png" alt="별점"; class="moim_starpoint">
                    </div>
                </a></div>
                <div class="closed_moim"><a href="/">
                    <img src="img/image7.jpg" alt="사진1"; class="photo">
                    <div class="moim_info">
                        <div class="moim_location_price">서울시 관악구</div>
                        <div class="moim_title">모임의 이름이 들어갈곳 길어지면 밑줄...</div>
                        <img src="img/starpic.png" alt="별점"; class="moim_starpoint">
                    </div>
                </a></div>
            </div>
            </div>
                    </div>
                </div>

                </div>
        </div>
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
    </footer>
</body>
</html>