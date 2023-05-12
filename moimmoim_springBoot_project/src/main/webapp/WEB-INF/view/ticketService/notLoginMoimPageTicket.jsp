<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>

    <meta charset="UTF-8">
    <title>not logined moimPageTicket</title>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/css/ticketCss/ticket.css">
    <link rel="stylesheet" type="text/css" href="/css/ticketCss/moimPageTicket.css">

    <!-- JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>


    //간단 프로필 로드
    $(document).ready(function() {
        const userIdNum = '${moimDo.moimHostUserIdNum}';
        $.get(`/users/userSimpleProfile/${moimDo.moimHostUserIdNum}`, function(data) {
            $('#user-profile').html(data);
        });
    });

    </script>
    <!-- JavaScript 끝-->

</head>

<body>

    <!-- 티켓 -->
    <div class="ticket">
        <!-- 티켓 왼쪽 -->
        <div class="ticket-left">
            <img src="/imgs/moimmoimUi/whitelogo.png" alt="logo" style="width: 80px; height: auto; display: inline-block;">
            <b style="display: inline-block;">Ticket</b>
            <br><br><br>
            <p>date: ${moimDo.moimStartDate}<br>
            time: <br>
            location: ${moimDo.moimLocationNum}</p>
        </div>

        <!-- 티켓 오른-->
        <div class="ticket-right">
            <p>${moimDo.moimTitle}</p>
            <br><br>
            <p>호스트</p>
            <div id="user-profile"style="width: 50%; height: 50%;"></div>
        </div>
    </div>
    <!-- 티켓 끝-->

<!-- 구매 버튼 -->
<button onclick="openBuyPageModal()" style="float:right; font-size: 30px;" ${moimDo.moimMemberMax == moimDo.moimMemberCount ? 'disabled' : ''}>
  ${moimDo.moimMemberMax == moimDo.moimMemberCount ? '모집 마감' : '로그인 필요'}
</button>


<!-- Buy Page Modal -->
<div id="buy-page-modal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeBuyPageModal()">&times;</span>
    <iframe id="buy-page-iframe" src="" width="100%" height="100%"></iframe>
  </div>
</div>


</body>
</html>


