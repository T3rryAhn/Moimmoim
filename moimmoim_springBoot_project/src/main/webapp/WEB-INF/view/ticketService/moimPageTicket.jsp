<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <!-- 테스트용 css 나중에 삭제하고 본 페이지에 넣을것 -->
 <link rel="stylesheet" type="text/css" href="/css/ticketCss/ticket.css">

<!-- 티켓 -->
<div class="ticket">
  <div class="ticket-left">
    <img src="/imgs/moimmoimUi/whitelogo.png" alt="logo" style="width: 80px; height: auto; display: inline-block;" >
    <b style="display: inline-block;">Ticket</b>
    <br><br><br>
    <p>date: ${moimDo.moimStartDate}<br>
    time: <br>
    location: ${moimDo.moimLocationNum}</p>
  </div>
  <div class="ticket-right">
    <p>${moimDo.moimTitle}</p>
    <p>호스트</p>
    <p><a href="/users/userSimpleProfile/${moimDo.moimHostUserIdNum}">${moimDo.moimHostUserIdNum}의 userSimpleProfile</a></p>
  </div>
</div>


<!-- 구매 버튼 -->

<form id="buy-form" method="POST" action="/buyPage/${moimNum}" style="float:right;">
    <input type="hidden" name="userIdNum" value="${userDo.userIdNum}"
    <input type="hidden" name="moimNum" value="${moimDo.moimNum}">
    <input type="submit" value="${moimDo.moimMemberMax == moimDo.moimMemberCount ? '모집 마감' : '구매하기'}" ${moimDo.moimMemberMax == moimDo.moimMemberCount ? 'disabled' : ''} style="font-size: 30px;">

</form>


 <!-- 팝업 버튼 -->
 <button type="button" onclick="openBuyPagePopup()">구매하기</button>

 <script>
     function openBuyPagePopup() {
         var moimNum = ${moimDo.moimNum};
         var userIdNum = ${userDo.userIdNum};
         var form = document.getElementById('buy-form');
         form.action = '/buyPage/' + moimNum;
         var popupWidth = 800;
         var popupHeight = 600;
         var popupLeft = (window.screen.width / 2) - (popupWidth / 2);
         var popupTop = (window.screen.height / 2) - (popupHeight / 2);
         var popup = window.open('', '', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupLeft + ', top=' + popupTop);
         form.target = popup.name;
         form.submit();
     }

   window.addEventListener("beforeunload", function(event) {
     // 주문 취소 요청 보내기
     $.ajax({
       type: "POST",
       url: "/cancelOrder",
       data: {
         orderNum: ${orderNum} // 생성된 주문 번호(OrderNum)를 전달합니다.
       },
       async: false, // 동기적으로 요청합니다.
       error: function(xhr, status, error) {
         alert("결제 취소 중 오류가 발생했습니다.");
       }
     });
   });
 </script>
