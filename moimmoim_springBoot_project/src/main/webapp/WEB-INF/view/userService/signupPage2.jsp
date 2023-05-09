<%@ page language ="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>

<head lang="kr">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/userService/signupPage2.css" />
    <script src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

    <link rel="icon" href="imgs/userService/logo.png" />
    <title>moimmoim signup</title>

</head>

<body>
    <header id="header">
        <a href="/"><img id="logo" src="imgs/userService/logo.png"></a>
    </header>
    <main>

        <img id="main-logo" src="imgs/userService/logo.png" />
        <form class="userInfo" id="userInfoForm" action="signup/addUserStep2" method="post">
            <input type="text" id = "nameInput" name = "userName" placeholder="Type Name" />
            <input type="tel" id = "phoneInput" name ="phoneNum" placeholder="Type PhoneNumber" />
            <p id="choose-your-birth">choose your birth</p>
            <input type="date" id="birth" value="yyyy-mm-dd" />
            <fieldset id = "categorySet">
                <legend id="category-radio-legend">choose your favorite catetgory</legend>
                <label for=" eating">먹기</label>
                <input type="radio" id="eating" name="category-radio" value="eating"/>
                <label for="watching">보기</label>
                <input type="radio" id="watching" name="category-radio" value="watching" />
                <label for="leaning">배우기</label>
                <input type="radio" id="leaning" name="category-radio" value="leaning" />
                <label for="healing">힐링하기</label>
                <input type="radio" id="healing" name="category-radio" value="healing" />
                <label for="experiencing">체험하기</label>
                <input type="radio" id="experiencing" name="category-radio" value="experiencing" />
            </fieldset>

          <!-- <div id="loc-srch-div">
                <legend>search your location</legend>
                <button id="srch-popup-bttn" type="button">search</button>
                <input id="loc-result" type="text" placeholder="address" />
            </div> -->
            <h1 id="confirm-msg"></h1>
            <button id="signup-btn">signup</button>
        </form>
    </main>
</body>
<script src="js/userService/signup2InputValidate.js"></script>



</html>