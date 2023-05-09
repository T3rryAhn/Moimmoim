<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>

<head lang="kr">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/userService/findId.css" />
    <link rel="icon" href="imgs/userService/logo.png"/>
     <script src="https://code.jquery.com/jquery-3.6.4.js"
                integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <title>moimmoim findId</title>

</head>

<body>
    <header id="header">
        <a href="/"><img id="logo" src="imgs/userService/logo.png"></a>
    </header>
    <main>

           <img id="main-logo" src="imgs/userService/logo.png" />
            <h1 id="wellcome">find ID</h1>

            <form class="userInfo" id = "userInfoForm">
                <input type="text" id="nameInput" placeholder="Type user name" />
                <input type="Email" id ="emailInput" placeholder="Type registered Email" />
                <h1 id="confirm-msg"> </h1>
                <button id="signup-next-bttn">send ID</button>
            </form>

            <div id="link-bttn">
                <button id="signup-bttn" onclick="location.href='login'">log in</button>
                <button id="find-id-bttn" onclick="location.href='findId'">find id</button>
                <button id="find-pw-bttn"onclick="location.href='findPw1'">find pw</button>
            </div>
        </main>

</body>
<script src = "js/findIdPwService/findId.js"></script>
</html>