<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta name="viewport" content="width=device-width , initial-scale=1.0" />
        <meta charset="UTF-8" />
        <title>login-form</title>
    </head>
    <body>

    <div class="container">
    <form action="/moim/new" method="post">
        <div class="form-group">

            <label for="moimHostUserIdNum">모임 유저 넘버</label>
            <input type="Long" id="moimHostUserIdNum" name="moimHostUserIdNum" placeholder="이메일을 입력하세요">

            <label for="moimTitle">모임 제목</label>
            <input type="text" id="moimTitle" name="moimTitle" placeholder="이름을입력하세요">

            <label for="moimMainContent">모임 내용</label>
            <input type="text" id="moimMainContent" name="moimMainContent" placeholder="이름을입력하세요">

            <label for="moimImage">모임 이미지</label>
            <input type="text" id="moimImage" name="moimImage" placeholder="이메일을 입력하세요">


            <label for="moimViewCount">조회수</label>
            <input type="int" id="moimViewCount" name="moimViewCount" placeholder="이메일을 입력하세요">

            <label for="moimCategoryNum">카테고리</label>
            <input type="int" id="moimCategoryNum" name="moimCategoryNum" placeholder="이름을입력하세요">

            <label for="moimStartDate">모임 시작 시간</label>
            <input type="date" id="moimStartDate" name="moimStartDate" placeholder="이메일을 입력하세요">

            <label for="moimEndDate">모집 종료 시간</label>
            <input type="date" id="moimEndDate" name="moimEndDate" placeholder="이메일을 입력하세요">

            <label for="moimMemberCount">모임 현재 인원</label>
            <input type="int" id="moimMemberCount" name="moimMemberCount" placeholder="이메일을 입력하세요">

            <label for="moimMemberMax">모임 최대 인원</label>
            <input type="int" id="moimMemberMax" name="moimMemberMax" placeholder="이름을입력하세요">

            <label for="moimPrice">가격</label>
            <input type="int" id="moimPrice" name="moimPrice" placeholder="이메일을 입력하세요">

            <label for="moimDeadLine">모임 마감 시간</label>
            <input type="date" id="moimDeadLine" name="moimDeadLine" placeholder="이름을입력하세요">

            <label for="moimDeadCheck">모임 마감 여부</label>
            <input type="int" id="moimDeadCheck" name="moimDeadCheck" placeholder="이메일을 입력하세요">

            <label for="moimLocationNum">위치</label>
            <input type="int" id="moimLocationNum" name="moimLocationNum" placeholder="이메일을 입력하세요">


        </div>
        <button type="submit">등록</button>
    </form>

    </div> <!-- /container -->

    </body>

</html>




