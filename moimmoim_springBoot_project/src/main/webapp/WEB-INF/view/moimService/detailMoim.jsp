<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta name="viewport" content="width=device-width , initial-scale=1.0" />
        <meta charset="UTF-8" />
        <title>login-form</title>
    </head>

    <body>

    <table border="1">
        <tr>
            <th>글번호</th>
            <th>유저 넘버</th>
            <th>모임 제목</th>
            <th>작성시간</th>
        </tr>

        <tr>
            <td>${moimDo.moimNum}</td>
            <td>${moimDo.moimHostUserIdNum}</td>
            <td>${moimDo.moimTitle}</td>
            <td>${moimDo.moimCreateDate}</td>
        </tr>


    </body>

</html>