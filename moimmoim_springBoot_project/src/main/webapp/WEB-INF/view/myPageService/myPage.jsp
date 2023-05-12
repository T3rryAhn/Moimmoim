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
        <div id="header_container">
            <div id="main-logo" ><a href="/"><img src="/imgs/moimmoimUi/logo.png" alt="logo" width="200px"></a></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <a href="/" class="header_font">MOIM LIST</a>
            <a href="/" class="header_font">HOST LIST</a>
            <div id="login_icon"><a href="/"><img src="/imgs/moimmoimUi/login.png" alt="login" width="50px"></a></div>
        </div>
    </header>
<!--header 끝-->


<!--main 시작 -->
    <main>
      <h1>MyPage</h1>
      <p>
      안녕하세요<br>
      ${userDo.userName}, ${userDo.userEmail} 님.
      </p>
    <hr>
    
    <a href="/profilePage/${userIdNum}"><button>프로필로 이동</button></a>
    <a href="프로필 수정 페이지 링크"><button>프로필 수정하기</button></a>
    <br>
    <a href="결제 및 대금 수령 페이지 링크"><button>결제 및 대금 수령</button></a>
    <a href="myPage/myMadeMoim"><button>내가 만든 모임</button></a>
    <br>
    <a href="리뷰 페이지 링크"><button>리뷰 모아보기</button></a>
    <a href="myPage/myJoinMoim"><button>내가 참가한 모임</button></a>
    <br>
    </main>
<!--main 끝 -->


<!--footer 시작-->
    <footer>
        <div id="footer_container"> 
            <div id="whitelogo" ><a href="/"><img src="/imgs/moimmoimUi/whiteLogo.png" alt="logo" width="200px"></a></div>
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
            <!--푸터 메뉴 바 내용은 논의 필요
                기존: 모임 목록, 모임 글 올리기, 호스트 목록, 마이페이지, 고객센터
            -->
    </footer>
<!--footer 끝-->

</body>
</html>