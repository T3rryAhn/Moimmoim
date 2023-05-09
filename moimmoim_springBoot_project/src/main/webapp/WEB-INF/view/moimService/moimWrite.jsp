<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>MOIMMOIM :: 모임글 작성하기</title>
    <link rel="stylesheet" href="/css/moimCss/moim_write.css">
    <link rel="stylesheet" href="/css/moimCss/headerfooter_basic.css">
</head>

<body>
<!--헤더 시작-->
<header>
    <!--로그인 전 헤더-->
    <div id="header_container">
        <div id="header_logo"><a href="/"><img src="\imgs\moimmoimUi\logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="/moim/getMoim/list" class="header_menu">MOIM LIST</a>
            <a href="#" class="header_menu">HOST LIST</a>
            <a href="#" class="header_login login">LOG IN</a>        </div>
    </div>

    <!--로그인 후 헤더-->
    <!-- <div id="header_container">
        <div id="header_logo"><a href="/"><img src="\imgs\moimmoimUi\logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="#" class="header_menu">MOIM LIST</a>
            <a href="#" class="header_menu">HOST LIST</a>
            <div id="mypage_icon"><a href="/"><img src="\imgs\moimmoimUi\mypage.png" alt="mypage" width="40px"></a></div>
        </div>
    </div> -->
</header>
<!--헤더 끝-->

<main>
    <div class="container">
    <div class="section_title">
        <img src="\imgs\moimmoimUi\bar.png"; class="green_bar"> 모임글 작성하기
    </div>
    <form action="/moim/new" method="post">
        <div class="form-group">
            <div class="box box1">
                <label for="moimCategoryNum" class="form_name">카테고리 구분</label>
                <input class="textbox" type="text" id="moimCategoryNum" name="moimCategoryNum" placeholder="모임 카테고리를 선택해 주세요 (또는 작성해 주세요? )">
            </div>
            <div class="box box2">
                <label for="moimLocationNum" class="form_name">위치</label>
                <input class="textbox" type="text" id="moimLocationNum" name="moimLocationNum" placeholder="모임의 시작 위치를 선택해 주세요.">
            </div>
            <div class="box box3">
                <label for="moimStartDate" class="form_name">모임 시작일</label>
                <input class="textbox" type="datetime-local" id="moimStartDate" name="moimStartDate" placeholder="모임 시작일을 선택해 주세요">
            </div>
            <div class="box box4">
                <label for="moimEndDate" class="form_name">모임 종료일</label>
                <input class="textbox" type="datetime-local" id="moimEndDate" name="moimEndDate" placeholder="모임 종료일을 선택해 주세요">
            </div>
            <div class="box box5">
                <label for="moimPrice" class="form_name">참가 비용</label>
                <input class="textbox" type="text" id="moimPrice" name="moimPrice" placeholder="1인당 모임 참가 비용을 작성해 주세요.">
            </div>
            <div class="box box6">
                <label for="moimMemberMax" class="form_name">모임 최대 인원</label>
                <input class="textbox" type="text" id="moimMemberMax" name="moimMemberMax" placeholder="모임 최대 인원을 작성해 주세요(또는 선택해 주세요? 형식 어떻게 하실건가요?)">
            </div>
            <div class="box box7">
                <label for="moimDeadLine" class="form_name">모집 마감일</label>
                <input class="textbox" type="datetime-local" id="moimDeadLine" name="moimDeadLine" placeholder="모임 모집 마감일을 선택해 주세요.">
            </div>
            <div class="box box8">
                <label for="moimImage" class="form_name">사용할 사진</label>
                <input class="textbox" type="text" id="moimImage" name="moimImage" placeholder="모임 사진을 업로드 해주세요.">
            </div>
            <div class="box box9">
                <label for="moimTitle" class="form_name">모임 제목</label>
                <input class="textbox title" type="text" id="moimTitle" name="moimTitle" placeholder="모임 제목을 작성해 주세요.">
            </div>
            <div class="box box10">
                <label for="moimMainContent" class="form_name form_main">모임 소개</label>
                <!-- <input class="textbox main" type="text" id="moimMainContent" name="moimMainContent" placeholder="이름을입력하세요"> -->
                <textarea class="textbox main" type="text" id="moimMainContent" name="moimMainContent" placeholder="모임 소개글을 작성해 주세요."></textarea>
            </div>
        </div>

        <label for="moimHostUserIdNum">모임 유저 넘버</label>
        <input type="Long" id="moimHostUserIdNum" name="moimHostUserIdNum" placeholder="테스트를 위한 유저넘버 입력">

        <button type="submit" class="submit">등록하기</button>
    </form>
    </div>
</main>

<!-- 푸터 시작-->
    <footer>
        <div id="footer_container">
            <div class="footer_logo_menu">
                <a href="#"><img src="\imgs\moimmoimUi\whiteLogo.png" alt="logo" width="200px"></a>
                <a href="#" class="footer_font">개인정보 처리방침</a>
                <a href="#" class="footer_font">기타 필요메뉴</a>
                <a href="#" class="footer_font">메뉴구성</a>
            </div>
            <div>
                <a href="#" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
            </div>
        </div>
    </footer>
<!-- 푸터 끝-->

</body>
</html>