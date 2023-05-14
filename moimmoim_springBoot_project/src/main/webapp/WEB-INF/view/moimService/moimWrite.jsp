<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>MOIMMOIM :: 모임글 작성하기</title>
    <link rel="stylesheet" href="/css/moimCss/moim_write.css">
    <link rel="stylesheet" href="/css/moimCss/headerfooter_basic.css">
    </script>
</head>


<body>
<!--헤더 시작-->
<header>
    <div id="header_container">
        <div id="header_logo"><a href="/"><img src="/imgs/moimmoimUi/logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="/moim/getMoim/list" class="header_menu">MOIM LIST</a>
            <a href="#" class="header_menu">HOST LIST</a>
            <a href="#" class="header_menu">고객센터</a>
            <c:if test="${sessionScope.userIdNum==null}">
                <div id="login_icon"><a href="/login"><img src="/imgs/moimmoimUi/login.png" alt="login" width="40px"></a></div>
            </c:if>
            <c:if test="${sessionScope.userIdNum!=null}">
                <div id="login_icon"><a href=/profilePage/${sessionScope.userIdNum}><img src="/imgs/moimmoimUi/mypage.png" alt="login" width="40px"></a></div>
            </c:if>
        </div>
    </div>
</header>
<!--헤더 끝-->

<main>
    <div class="container">
    <div class="section_title">
        <img src="\imgs\moimmoimUi\bar.png"; class="green_bar"> 모임글 작성하기
    </div>
    <form action=${moimDo.moimNum!=null ? '/moim/getMoim/update/run' : '/moim/new'} method="post" enctype="multipart/form-data">
        <div class="form-group">
            <div class="box box1">
                <label for="moimCategoryNum" class="form_name">카테고리 구분</label>
                <select name="moimCategoryNum" class="select_box">
                    <option value="">카테고리를 선택하세요.</option>
                    <option value="1">먹기</option>
                    <option value="2">보기</option>
                    <option value="3">배우기</option>
                    <option value="4">힐링하기</option>
                    <option value="5">체험하기</option>
                </select>
            </div>
            <div class="box box2">
                <label for="moimLocationNum" class="form_name">지역 선택</label>
                <select name="moimLocationNum" id="moimLocationNum" class="select_box">
                   <option value="">시작 지역을 선택하세요.</option>
                     <c:forEach var="list" items="${locList1}">
                     	<option value="${list.locationNum}">${list.locationName}</option>
                    </c:forEach>
                 </select>
            </div>
            <div class="box box3">
                <label for="moimStartDate" class="form_name">모임 시작일</label>
                <input class="textbox" type="datetime-local" id="moimStartDate" name="moimStartDate" placeholder="모임 시작일을 선택해 주세요" value=${moimDo.moimStartDate}>
            </div>
            <div class="box box4">
                <label for="moimEndDate" class="form_name">모임 종료일</label>
                <input class="textbox" type="datetime-local" id="moimEndDate" name="moimEndDate" placeholder="모임 종료일을 선택해 주세요" value=${moimDo.moimEndDate}>
            </div>
            <div class="box box5">
                <label for="moimPrice" class="form_name">참가 비용</label>
                <input class="textbox" type="text" id="moimPrice" name="moimPrice" placeholder="1인당 모임 참가 비용을 작성해 주세요." value=${moimDo.moimPrice}>
            </div>
            <div class="box box6">
                <label for="moimMemberMax" class="form_name">모임 최대 인원</label>
                <input class="textbox" type="text" id="moimMemberMax" name="moimMemberMax" placeholder="모임 최대 인원을 작성해 주세요(또는 선택해 주세요? 형식 어떻게 하실건가요?)" value=${moimDo.moimMemberMax}>
            </div>
            <div class="box box7">
                <label for="moimDeadLine" class="form_name">모집 마감일</label>
                <input class="textbox" type="datetime-local" id="moimDeadLine" name="moimDeadLine" placeholder="모임 모집 마감일을 선택해 주세요." value=${moimDo.moimDeadLine}>
            </div>
            <div class="box box8">
               <label for="sigFile" class="form_name">대표사진</label>
               <input type="file" name="sigFile" id="sigFile" style="display:none"/>
               <label for="uploadFile">소개 사진</label>
               <input type="file" name="uploadFile" id="uploadFile" style="display:none" multiple />
            </div>

            <div class="box box9">
                <label for="moimTitle" class="form_name">모임 제목</label>
                <input class="textbox title" type="text" id="moimTitle" name="moimTitle" placeholder="모임 제목을 작성해 주세요." value=${moimDo.moimTitle}>
            </div>
            <div class="box box10">
                <label for="moimMainContent" class="form_name form_main">모임 소개</label>
                <!-- <input class="textbox main" type="text" id="moimMainContent" name="moimMainContent" placeholder="이름을입력하세요"> -->
                <textarea class="textbox main" type="text" id="moimMainContent" name="moimMainContent" placeholder="모임 소개글을 작성해 주세요.">${moimDo.moimMainContent}</textarea>
            </div>
        </div>

        <label for="moimHostUserIdNum">모임 유저 넘버</label>
        <input type="Long" id="moimHostUserIdNum" name="moimHostUserIdNum" placeholder="테스트를 위한 유저넘버 입력">
        <input type="hidden" id="num" name="moimNum" value=${moimDo.moimNum}>
        <button type="submit" class="submit">등록하기</button>
    </form>
    </div>
</main>

<!-- 푸터 시작-->
    <footer>
        <div id="footer_container">
            <div class="fotter_logo_menu">
                <a href="#"><img src="\imgs\moimmoimUi\logo_white.png" alt="logo" width="200px"></a>
                <a href="#" class="footer_font">개인정보 처리방침</a>
                <a href="#" class="footer_font">기타 필요메뉴</a>
                <a href="#" class="footer_font">메뉴구성</a>
                <c:if test="${sessionScope.userIdNum!=null}">
                    <a href="/logout" class="footer_font">로그아웃</a>
                </c:if>
            </div>
            <div>
                <a href="#" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
            </div>
        </div>
    </footer>
<!-- 푸터 끝-->

</body>
</html>