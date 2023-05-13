<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
            <div id="main-logo" ><a href="/"><img src="img/logo.png" alt="logo" width="200px"></a></div>
            <div id="login_icon"><a href="/"><img src="img/login.png" alt="login" width="50px"></a></div>
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
      ${userDo.userName}, ${userDo.userEmail} 님.
      </p>
    <hr>
        <div class="profile_list">
            <div class="prolist one">
                <img src="img/profilepic.jpg" alt="프사"; class="picture">
                <div class="profile_info">
                    <div class="profile_text level">주니어 호스트</div>
                    <div class="profile_text nick">DORICK</div>
                    <div class="profile_text name">김도균</div>
                    <div class="profile_text avgstar">4.2점</div>
                    <div class="profile_text moimcount">17회</div>
                </div>
            </div>
            <div class="prolist two">
                <div class="profile_info">
                    <div class="profile_text birthyear">Birth: 1996년</div>
                    <div class="profile_text birthlocation">Loction: 서울</div>
                    <div class="profile_text phonenumber">Phone: 010-1234-5678</div>
                    <div class="profile_text email">Email: email@gmail.com</div>
                    <div class="profile_text createdate">Date: 2022/01/01</div>
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
    <div class="mypage_button">
        <div class="profile_manager">
        <div class="section_header">
            <div class="section_title">
                <img src="img/bar.png"; class="green_bar"> 프로필 관리</div>
        </div>
    <a href="/profilePage/${userIdNum}"><button>프로필로 이동</button></a>
    <a href="프로필 수정 페이지 링크"><button>프로필 수정하기</button></a>
    </div>
    <div class="moim_n_reviews">
        <div class="section_header">
            <div class="section_title">
                <img src="img/bar.png"; class="green_bar"> 모임 및 리뷰</div>
        </div>
        <a href="내가 참가한 모임 페이지 링크"><button>내가 참가한 모임</button></a>
    <a href="내가 만든 모임 페이지 링크"><button>내가 만든 모임</button></a>
    <a href="리뷰 페이지 링크"><button>리뷰 모아보기</button></a>
    </div>
    <div class="pay_get">
        <div class="section_header">
            <div class="section_title">
                <img src="img/bar.png"; class="green_bar"> 결제 관리</div>
        </div>
    <a href="결제 및 대금 수령 페이지 링크"><button>결제 및 대금 수령</button></a>
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
            <a href="/" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
        </div>
            <!--푸터 메뉴 바 내용은 논의 필요
                기존: 모임 목록, 모임 글 올리기, 호스트 목록, 마이페이지, 고객센터
            -->
    </footer>
<!--footer 끝-->

</body>
</html>