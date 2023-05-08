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
    <h2> --카테고리별 리스트 조회-- </h2>
    <form action="/moim/getMoim/list" method="get">
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
    <hr/>

    <h2> --모임 생성-- </h2>
    <form action="/moim/new" method="get">
                    <button type="submit">모임생성</button>
        </form>
    <hr/>

    <h2> --모임 상세 보기-- </h2>
    <form action="/moim/getMoim/getMoim" method="get">
                <input type="int" id="detail" name="moimNum" placeholder="모임 넘버 입력">
                <button type="submit">모임상세</button>
    </form>



    </body>
</html>