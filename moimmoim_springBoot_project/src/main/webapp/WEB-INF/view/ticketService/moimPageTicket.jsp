<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

 <!-- css -->
 <link rel="stylesheet" type="text/css" href="/css/ticketCss/ticket.css">

<!-- 자바스크립트 -->
<script>

    //페이지 로드시 오류 메시지 검출
    window.onload = function() {
        checkErrorMessage();
    };

    //에러 메시지가 있으면 표시
    function checkErrorMessage() {
        const errorMsg = "<%= request.getAttribute("errorMsg") %>";
        if (errorMsg && errorMsg.trim() !== 'null' && errorMsg.trim() !== '') {
            alert(errorMsg);
        }
    }

    //에러 메시지가 있으면 페이지 이동을 막기
    function checkBeforeSubmit(event) {
        const errorMsg = '<%= request.getAttribute("errorMsg") %>';
        if (errorMsg && errorMsg.trim() !== 'null' && errorMsg.trim() !== '') {
            event.preventDefault();
            alert(errorMsg);
            location.href = '/buyPage'
        } else {
            const userIdNum = '${userDo.userIdNum}';
            const moimNum = '${moimDo.moimNum}';
            location.href = `/buyPage/${moimNum}?userIdNum=${userIdNum}`;
        }
    }

</script>
<!-- 자바스크립트 끝-->

    <title>moimPageTicket</title>
</head>

<body>
    <!-- 티켓 -->
    <div class="ticket">

      <!-- 티켓 왼쪽 -->
      <div class="ticket-left">
        <img src="/imgs/moimmoimUi/whitelogo.png" alt="logo" style="width: 80px; height: auto; display: inline-block;" >
        <b style="display: inline-block;">Ticket</b>
        <br><br><br>
        <p>date: ${moimDo.moimStartDate}<br>
        time: <br>
        location: ${moimDo.moimLocationNum}</p>
      </div>

      <!-- 티켓 오른-->
      <div class="ticket-right">
        <p>${moimDo.moimTitle}</p>
        <p>호스트</p>
        <p><a href="/users/userSimpleProfile/${moimDo.moimHostUserIdNum}">${moimDo.moimHostUserIdNum}의 userSimpleProfile</a></p>
      </div>
    </div>
    <!-- 티켓 끝-->

<!-- 구매 버튼 -->

<button onclick="checkBeforeSubmit(event)" style="float:right; font-size: 30px;">
        ${moimDo.moimMemberMax == moimDo.moimMemberCount ? '모집 마감' : '구매하기'}
    </button>

</body>
</html>


