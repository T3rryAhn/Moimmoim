<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko">

<head>
  <meta name="viewport" content="width=device-width , initial-scale=1.0" />
  <meta charset="UTF-8" />
  <link rel="stylesheet" type="text/css" href="css/moimmoimBody.css">
  <title>Test Home</title>
</head>

<body>

  <!--header 시작-->
  <header>
    <div id="header_container">
      <div id="main-logo"><a href="/"><img src="imgs/moimmoimUi/logo.png" alt="logo" width="200px"></a></div>
    </div>
  </header>
  <!--header 끝-->

  <!--메인 컨텐츠 시작-->
  <main>
    <h1>어디로든 문!!!</h1>
    개발용 페이지<br>
    손쉽게 어디로든 이동해보세요
    <hr />

    <div id="mainPage" style="display: inline-block;" >
      <h3>mainPage</h3>
      <a href="/main"><button>메인페이지로 이동</button></a>
    </div>
    <div id="moimPage" style="display: inline-block;">
        <h3>moimPage</h3>
        <a href="/moim"><button>모임 페이지로 이동</button></a>
    </div>
    <div id="login" style="display: inline-block;">
       <h3>login</h3>
       <a href="/login"><button>로그인 페이지로 이동</button></a>
    </div>
    <br>
    <hr/>

  <b>회원번호입력</b>
  <form  method="get">
    <label for="userIdNum">userIdNum:</label>
    <input type="number" name="userIdNum" value="1" id="userIdNum" placeholder="userIdNum을 입력하세요" />
    <br><br>
  </form>
  <b>모임번호 입력</b>
  <form  method="get">
      <label for="moimNum">userIdNum:</label>
      <input type="number" name="moimNum" value="1" id="moimNum" placeholder="moimNum을 입력하세요" />
      <br><br>
  </form>

    <div id="myPage">
      <h3>myPage</h3>
      <button onclick="goToMyPage(userIdNum.value)">마이페이지 보기</button>
    </div>
    <br>

    <div id="userProfile">
      <h3>userProfilePages</h3>
      <button onclick="goToProfilePage(userIdNum.value)">프로필 페이지 보기</button>
      <button onclick="goToUserProfile(userIdNum.value)">사용자 프로필 보기</button>
      <button onclick="goToUserSimpleProfile(userIdNum.value)">간단한 사용자 프로필 보기</button>
    </div>

    <div id="ticketing">
      <h3>ticketPage</h3>
      <button onclick="goToTicket(moimNum.value, userIdNum.value)">티켓 보기</button>
    </div>

  </main>
  <!--메인 끝-->

  <script>
    function goToMyPage(userIdNum) {
      const url = '/myPage/' + userIdNum;
      window.location.href = url;
    }
    function goToProfilePage(userIdNum) {
      const url = '/profilePage/' + userIdNum;
      window.location.href = url;
    }

    function goToUserProfile(userIdNum) {
      const url = '/users/userProfile/' + userIdNum;
      window.location.href = url;
    }

    function goToUserSimpleProfile(userIdNum) {
      const url = '/users/userSimpleProfile/' + userIdNum;
      window.location.href = url;
    }

    function goToTicket(moimNum, userIdNum) {
      const url = '/ticket/' + moimNum + '/' + userIdNum;
      window.location.href = url;
    }
  </script>

</body>

</html>