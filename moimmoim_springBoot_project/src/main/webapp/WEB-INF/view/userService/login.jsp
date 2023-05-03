<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>

<head lang="kr">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/loginPage.css" />
    <link rel="icon" href="imgs/logo.png"/>
    <title>moimmoim login</title>

</head>

<body>
    <header id="header">
        <a href=""><img id="logo" src="imgs/logo.png"></a>
    </header>
    <main>

        <img id="main-logo" src="imgs/logo.png" />
        <h1 id="wellcome">Wellcome<br>Please LogIn!!</h1>

        <form class="userInfo" action="${pageContext.request.contextPath}/login" method="post">
            <input type="text" id="userId" name="userId" placeholder="Type ID" />
            <input type="password" id="userPassword" name="userPassword" placeholder="Type password" />
            <h1 id="confirm-msg">msg</h1>
            <button type="submit" id="signup-next-bttn">Kick in yo!</button>
        </form>

        <div id="link-bttn">
            <button id="signup-bttn" onclick="location.href='signup'">sign up</button>
            <button id="find-id-bttn">find id</button>
            <button id="find-pw-bttn">find pw</button>
        </div>



    </main>


    <!-- <footer id="footer">
        <a href="https://www.naver.com/"><img id="whitelogo" src="imgs/whiteLogo.png"></a>
        <span id="copyright">Copyright © MOIM MOIM. All Rights Reserved.</span>
    </footer> -->

</body>

</html>