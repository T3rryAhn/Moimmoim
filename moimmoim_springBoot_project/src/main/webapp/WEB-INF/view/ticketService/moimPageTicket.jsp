<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <title>moimPageTicket</title>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/css/ticketCss/ticket.css">
    <link rel="stylesheet" type="text/css" href="/css/ticketCss/moimPageTicket.css">

    <!-- JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        window.addEventListener('message', function(event) {
          if (event.data === 'closeModal') {
            const moimNum = '<%= request.getAttribute("moimNum") %>';
                    const userIdNum = '<%= request.getAttribute("userIdNum") %>';
                    location.href = 'moim/getMoim/getMoim';

          }
        }, false);

        // 모달 열기
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

        // 이벤트 리스너를 추가하여 'buySuccess' 메시지를 처리합니다.
        window.addEventListener('message', function(event) {
          if (event.data === 'buySuccess') {
            // 결제 성공 시 실행할 코드를 이곳에 추가하세요.
            const successUrl = '/buySuccess'; // 여기에 성공 페이지 URL을 입력하세요.
            const iframe = document.getElementById("buy-page-iframe");
            iframe.src = successUrl;
            iframe.contentWindow.location.reload();
          }
        }, false);

        /* 주석처리로 기능해제해놓음.
        // 모달 외부를 클릭하면 모달을 닫습니다.
        window.onclick = function(event) {
            const modal = document.getElementById("buy-page-modal");
            if (event.target == modal) {
                closeBuyPageModal();
            }
        }
        */

        function closeBuyPageModal() {
            const modal = document.getElementById("buy-page-modal");
            const iframe = document.getElementById("buy-page-iframe");
            iframe.src = "";
            modal.style.display = "none";

            window.location.href = '/moim/getMoim/getMoim?moimNum=${moimNum}';
        }

    //간단 프로필 로드
    $(document).ready(function() {

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
            <img src="\imgs\moimmoimUi\whiteLogo.png" alt="logo" style="width: 80px; height: auto; display: inline-block;">
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


