<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width , initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>MyPage</title>
    <link rel="stylesheet" type="text/css" href="/css/moimmoimBody.css">
    <link rel="stylesheet" type="text/css" href="/css/myPageUi/myPageUi.css">
</head>


<body>
<!--java script 시작-->
    <script>
        // 현재 로그인된 사용자 정보를 가정
        const user = {
            userName: '사용자',
            email: 'user@example.com'
        }

        // 페이지 로딩 후 사용자 정보를 출력
        window.onload = function () {
            document.getElementById('username').innerHTML = user.userName;
            document.getElementById('email').innerHTML = user.email;
        }

      </script>
<!--java script 끝-->

<!--header 시작-->
    <header>
        <header>
        <div id="header_container">
            <div id="main-logo" ><a href="/"><img src="/imgs/moimmoimUi/logo.png" alt="logo" width="200px"></a></div>
            <c:if test="${sessionScope.userIdNum==null}">
                <div id="login_icon"><a href="/login"><img src="/imgs/moimmoimUi/login.png" alt="login" width="40px"></a></div>
            </c:if>
            <c:if test="${sessionScope.userIdNum!=null}">
                <div id="login_icon"><a href=/myPage/${sessionScope.userIdNum}><img src="/imgs/moimmoimUi/mypage.png" alt="login" width="40px"></a></div>
            </c:if>
        </div>
        </header>
    </header>
<!--header 끝-->
<!--main 시작 -->
    <main>
    <div class="section_profile">
        <h1>마이페이지</h1>
      <p>
      안녕하세요<br>
          ${profilePageDto.userProfileDto.userName}, ${profilePageDto.userProfileDto.userEmail} 님.
      </p>
    <hr>
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
                            <div class="profile_text birthyear">Birth: ${profilePageDto.userProfileDto.userBirth}</div>
                            <div class="profile_text phonenumber">Phone: ${profilePageDto.userProfileDto.phoneNum}</div>
                            <div class="profile_text email">Email: ${profilePageDto.userProfileDto.userEmail}</div>
                            <div class="profile_text createdate">Date: ${profilePageDto.userProfileDto.userCreateDate}</div>
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
            <div class="mypage_button">
                <div class="profile_manager">
                <div class="section_header">
                    <div class="section_title">
                        <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> 프로필 관리</div>
                </div>
            <a href="/profilePage/${userIdNum}"><button>프로필로 이동</button></a>
            <a href="/myPage/profileEdit/${userIdNum}"><button>프로필 수정하기</button></a>
            </div>
            <div class="moim_manager">
                <div class="section_header">
                    <div class="section_title">
                        <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> 모임 관리</div>
                </div>
                <a href="/myPage/myJoinMoim"><button>내가 참가한 모임</button></a>
            <a href="/myPage/myMadeMoim"><button>내가 만든 모임</button></a>

            </div>
            <div class="pay_get">
                <div class="section_header">
                    <div class="section_title">
                        <img src="/imgs/moimmoimUi/bar.png"; class="green_bar"> 결제 관리</div>
                </div>
            <a href="/myPage/receiptPage"><button>결제 및 대금 수령</button></a>
            </div>
            </div>
                </div>
            </main>
<!--main 끝 -->


<!--footer 시작-->
    <footer>
        <div id="footer_container">
            <div id="whitelogo" ><a href="/"><img src="img/logo_white.png" alt="logo" width="200px"></a></div>
            <a href="/" class="footer_font">개인정보 처리방침</a>
            <a href="/" class="footer_font">기타 필요메뉴</a>
            <a href="/" class="footer_font">메뉴구성</a>
            <c:if test="${sessionScope.userIdNum!=null}">
                <a href="/logout" class="footer_font">로그아웃</a>
            </c:if>
            <a href="/" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
        </div>
            <!--푸터 메뉴 바 내용은 논의 필요
                기존: 모임 목록, 모임 글 올리기, 호스트 목록, 마이페이지, 고객센터
            -->
    </footer>
<!--footer 끝-->

</body>
</html>