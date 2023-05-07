<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <!-- 테스트용 css 나중에 삭제하고 본 페이지에 넣을것 -->
 <link rel="stylesheet" type="text/css" href="/css/ticketCss/ticket.css">

<!-- 티켓 -->
<div class="ticket">
  <div class="ticket-left">
    <img src="imgs/logo.png" alt="ticket" style="width: 80px; height: auto; display: block;" >
    <b style="display: inline-block;">Ticket</b>
    <p>date: moimDo.moimStartDate<br>
    time: <br>
    location: moimDo.moimLocationNum</p>
  </div>
  <div class="ticket-right">
    <p>moimDo.moimTitle</p>
    <p>호스트</p>
    <p><a href="#">호스트의 userSimpleProfile</a></p>
  </div>
</div>


<!-- 구매 버튼 -->

<form method="post" action="/buy">
    <input type="hidden" name="moimNum" value="${moimDo.moimNum}">
    <input type="submit" value="${moimDo.moimMemberMax == moimDo.moimMemberCount ? '모집 마감' : '구매하기'}" ${moimDo.moimMemberMax == moimDo.moimMemberCount ? 'disabled' : ''}>

</form>