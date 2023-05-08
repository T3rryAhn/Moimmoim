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



