<%@ page language ="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>

<head lang="kr">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/userService/signupPage1.css" />
    <script src="https://code.jquery.com/jquery-3.6.4.js"
            integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

    <link rel="icon" href="imgs/userService/logo.png"/>
    <title>moimmoim signup</title>

</head>

<body>
    <header id="header">
        <a href="https://www.naver.com/"><img id="logo" src="imgs/userService/logo.png"></a>
    </header>
    <main>
        <h1 id="wellcome">wellcome to </h1>
        <img id="main-logo" src="imgs/userService/logo.png" />

        <form class="userInfo" id="userInfoForm" method ="POST" action="signup/addUserStep1">

            <input type="text" id="idInput" name="userId" placeholder="Type ID" />
            <input type="email" id="emailInput" name="userEmail" placeholder="Type your Email" />
            <button type="button" id ="sendCodeBttn"  >send code to Email</button>
            <input type="text" id ="codeInput"  placeholder="Type the code" />
            <input type="password" id ="pwInput" name ="userPassword" placeholder="Type the Password" />
            <input type="password" id ="pwReInput" placeholder="ReType the Password" />

            <h1 id="confirm-msg"></h1>
            <button id="signup-next-bttn">NEXT</button>
        </form>

    </main>
</body>js/
 <script src="js/userService/signup1InputValidate.js"></script>
</html>
