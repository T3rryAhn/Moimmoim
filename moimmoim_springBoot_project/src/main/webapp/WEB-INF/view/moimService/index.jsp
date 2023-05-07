<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@page import="java.util.*"%>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <title>login-form</title>
    </head>
    <title>Spring Boot Application</title>
    </head>

    <body>
    <form action="/moim/getMoim/list" method="post">
        <div class="form-group">

            <label for="moimCategoryNum">카테고리</label>
            <input type="int" id="moimCategoryNum" name="moimCategoryNum" placeholder="이름을입력하세요">

        </div>
        <button type="submit">등록</button>
    </form>

    <a href="/moim/new">모임 생성</a>

    </body>
</html>