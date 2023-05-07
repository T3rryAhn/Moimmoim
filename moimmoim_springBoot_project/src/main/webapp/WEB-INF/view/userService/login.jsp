<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>

<head lang="kr">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/userService/loginPage.css" />
    <link rel="icon" href="imgs/userService/logo.png"/>
    <title>moimmoim login</title>

</head>

<body>
    <header id="header">
        <a href=""><img id="logo" src="imgs/userService/logo.png"></a>
    </header>
    <main>

        <img id="main-logo" src="imgs/userService/logo.png" />
        <h1 id="wellcome">Wellcome<br>Please LogIn!!</h1>

        <form class="userInfo">
            <input type="text" placeholder="Type ID" />
            <input type="password" placeholder="Type password" />
            <h1 id="confirm-msg">msg</h1>
            <button id="signup-next-bttn">Kick in yo!</button>
        </form>

        <div id="link-bttn">
            <button id="signup-bttn" onclick="location.href='signup'">sign up</button>
            <button id="find-id-bttn">find id</button>
            <button id="find-pw-bttn">find pw</button>
        </div>
    </main>

</body>

</html>