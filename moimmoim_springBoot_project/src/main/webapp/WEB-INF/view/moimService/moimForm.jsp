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
            <label for="moimCategoryNum">카테고리 구분</label>
            <input type="number" id="moimCategoryNum" name="moimCategoryNum" placeholder="이름을입력하세요">

            <label for="moimStartDate">모임 시작</label>
            <input type="date" id="moimStartDate" name="moimStartDate" placeholder="이메일을 입력하세요">

            <label for="moimEndDate">모임 종료</label>
            <input type="date" id="moimEndDate" name="moimEndDate" placeholder="이름을입력하세요">

            <label for="moimTitle">모임 제목</label>
            <input type="text" id="moimTitle" name="moimTitle" placeholder="이름을입력하세요">

            <label for="moimMemberMax">모임 최대 인원</label>
            <input type="int" id="moimMemberMax" name="moimMemberMax" placeholder="이메일을 입력하세요">

            <label for="moimImage">사용할 사진</label>
            <input type="text" id="moimImage" name="moimImage" placeholder="이름을입력하세요">

            <label for="moimLocationNum">위치</label>
            <input type="text" id="moimLocationNum" name="moimLocationNum" placeholder="이메일을 입력하세요">

            <label for="moimMainContent">모임 소개</label>
            <input type="text" id="moimMainContent" name="moimMainContent" placeholder="이름을입력하세요">

            <label for="moimPrice">참가 비용</label>
            <input type="text" id="moimPrice" name="moimPrice" placeholder="이메일을 입력하세요">

            <label for="moimDeadline">모집 마감일</label>
            <input type="date" id="moimDeadline" name="moimDeadline" placeholder="이메일을 입력하세요">
            <!--테스트 용-->

            <label for="moimHostUserIdNum">유저 아이디</label>
            <input type="number" id="moimHostUserIdNum" name="moimHostUserIdNum" placeholder="이메일을 입력하세요">
            <label for="moimNum">모임 넘버</label>
            <input type="number" id="moimNum" name="moimNum" placeholder="이메일을 입력하세요">
            <label for="moimCreateDate">모집 만든시간</label>
            <input type="date" id="moimCreateDate" name="moimCreateDate" placeholder="이메일을 입력하세요">
            <label for="moim_deadline">모집 조회수</label>
            <input type="number" id="moimViewCount" name="moimViewCount" placeholder="이메일을 입력하세요">
            <label for="moimLocationNum">모집 장소</label>
            <input type="number" id="moimLocationNum" name="moimLocationNum" placeholder="이메일을 입력하세요">
            <label for="moimMemberCount">모집 마감일</label>
            <input type="number" id="moimMemberCount" name="moimMemberCount" placeholder="이메일을 입력하세요">

        </div>
        <button type="submit">등록</button>
    </form>

    </div> <!-- /container -->

    </body>

</html>