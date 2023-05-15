<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<!DOCTYPE html>
<html lang="ko">

<head>
    <link rel="stylesheet" href="/css/moimCss/delete_edit.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@600&family=Noto+Sans+KR:wght@400;500;700&display=swap');
        *{
        font-family: 'Noto Sans kr', sans-serif;
        font-size: 16px;
        }
        .box {
        width: 500px;
        height: 200px;
        background-color: rgb(250, 255, 253);
        border-radius: 10px;
        border: 3px rgb(17, 151, 65) dotted;
        text-align: center;
        font-size: 20px;
        font-weight: lighter;
        line-height: 5;
        padding: 30px auto;
        }
        button{
            width: 80px;
            height: 30px;
            border-radius: 5px;
            background-color: rgb(17, 151, 65);
            color: white;
            border: transparent
        }
    </style>

</head>
<body>
    <div class="box">
    삭제되었습니다.
    <form action="/moim/getMoim/list" method="get">
        <button>확인</button>
    </form>
    </div>

</body>
</html>