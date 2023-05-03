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
            <label for="category_num">카테고리 구분</label>
            <input type="text" id="category_num" name="category_num" placeholder="이름을입력하세요">
            <label for="moim_start_time">모임 시작</label>
            <input type="date" id="moim_start_time" name="moim_start_time" placeholder="이메일을 입력하세요">
            <label for="moim_end_time">모임 종료</label>
            <input type="date" id="moim_end_time" name="moim_end_time" placeholder="이름을입력하세요">
            <label for="moim_title">모임 제목</label>
            <input type="text" id="moim_title" name="moim_title" placeholder="이름을입력하세요">
            <label for="moim_member_max">모임 최대 인원</label>
            <input type="text" id="moim_member_max" name="moim_member_max" placeholder="이메일을 입력하세요">
            <label for="moim_pictures">사용할 사진</label>
            <input type="text" id="moim_pictures" name="moim_pictures" placeholder="이름을입력하세요">
            <label for="location_num">위치</label>
            <input type="text" id="location_num" name="location_num" placeholder="이메일을 입력하세요">
            <label for="moim_main">모임 소개</label>
            <input type="text" id="moim_main" name="moim_main" placeholder="이름을입력하세요">
            <label for="moim_price">참가 비용</label>
            <input type="text" id="moim_price" name="moim_price" placeholder="이메일을 입력하세요">
            <label for="moim_deadline">모집 마감일</label>
            <input type="date" id="moim_deadline" name="moim_deadline" placeholder="이메일을 입력하세요">

        </div>
        <button type="submit">등록</button>
    </form>

    </div> <!-- /container -->

    </body>

</html>