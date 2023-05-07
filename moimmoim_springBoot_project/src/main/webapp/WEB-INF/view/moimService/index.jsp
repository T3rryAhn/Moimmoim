<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html lang="ko">

    <head>
        <title>test</title>
    </head>
    <title>Spring Boot Application</title>
    </head>

    <body>
    <form action="/moim/getMoim/list" method="get">
            <label for="cat1">카테고리</label>
            <input type="hidden" id="cat" name="moimCategoryNum" value=1>
            <button type="submit">먹기</button>
    </form>

    <form action="/moim/getMoim/list" method="get">
            <input type="hidden" id="cat" name="moimCategoryNum" value=2>
            <button type="submit">보기</button>
    </form>

    <form action="/moim/getMoim/list" method="get">
            <input type="hidden" id="cat" name="moimCategoryNum" value=3>
            <button type="submit">배우기</button>
    </form>

    <form action="/moim/getMoim/list" method="get">
            <input type="hidden" id="cat" name="moimCategoryNum" value=4>
            <button type="submit">힐링하기</button>
    </form>

    <form action="/moim/getMoim/list" method="get">
            <input type="hidden" id="cat" name="moimCategoryNum" value=5>
            <button type="submit">체험하기</button>
    </form>

    <a href="/moim/new">모임 생성</a>

    </body>
</html>