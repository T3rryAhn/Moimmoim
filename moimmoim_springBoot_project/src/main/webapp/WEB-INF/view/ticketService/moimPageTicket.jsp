<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

    <meta charset="UTF-8">
    <title>moimPageTicket</title>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/css/ticketCss/ticket.css">
    <link rel="stylesheet" type="text/css" href="/css/ticketCss/moimPageTicket.css">

    <!-- JavaScript -->
    <script>
        // 페이지 로드시 오류 메시지 검출
        window.onpageshow = function(event) {
            checkErrorMessage();
        };

        // 에러 메시지가 있으면 표시
        function checkErrorMessage() {
            const errorMsg = "<%= request.getAttribute("errorMsg") %>";
            if (errorMsg && errorMsg.trim() !== 'null' && errorMsg.trim() !== '') {
                alert(errorMsg);
            }
        }

        function openBuyPageModal() {
            const userIdNum = '${userDo.userIdNum}';
            const moimNum = '${moimDo.moimNum}';
            const orderNum = '${orderNum}';
            const url = `/buyPage/${moimNum}?userIdNum=${userIdNum}&orderNum=${orderNum}`;

            // 모달 열기
            const modal = document.getElementById("buy-page-modal");
            const iframe = document.getElementById("buy-page-iframe");
            iframe.src = url;
            modal.style.display = "block";

            // 현재 URL 추가
            window.history.pushState(null, null, url);
        }

        // 모달 외부를 클릭하면 모달을 닫습니다.
        window.onclick = function(event) {
            const modal = document.getElementById("buy-page-modal");
            if (event.target == modal) {
                closeBuyPageModal();
            }
        }

        function closeBuyPageModal() {
            const modal = document.getElementById("buy-page-modal");
            const iframe = document.getElementById("buy-page-iframe");
            iframe.src = "";
            modal.style.display = "none";

            // 추가한 URL 삭제
            window.history.back();
        }
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
            <p>호스트</p>
            <p><a href="/users/userSimpleProfile/${moimDo.moimHostUserIdNum}">${moimDo.moimHostUserIdNum}의 userSimpleProfile</a></p>
        </div>
    </div>
    <!-- 티켓 끝-->

<!-- 구매 버튼 -->
<button onclick="openBuyPageModal()" style="float:right; font-size: 30px;" ${moimDo.moimMemberMax == moimDo.moimMemberCount ? 'disabled' : ''}>
  ${moimDo.moimMemberMax == moimDo.moimMemberCount ? '모집 마감' : '구매하기'}
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


