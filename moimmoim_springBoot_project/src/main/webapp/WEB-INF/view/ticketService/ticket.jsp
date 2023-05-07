
<!-- 티켓 -->
<div class="ticket">
    <div class="ticket-left">
        <img src="imgs/logo.png" width="100px">
        <h1>Ticket</h1>

        <p>date: </p>
        <p>time: </p>
        <p>location: </p>
    </div>
    <div class="ticket-right">
        <p>모임제목: ${moimDo.moimTitle} 모임 티켓</p>
        <p>모집 인원: ${moimDo.moimMemberMax}명</p>
        <p>호스트: userSimpleProfile/${moimDo.moimHostuserIdNum}  </p>
    </div>
</div>


<!-- 구매 버튼 -->
<form method="post" action="/buy">
    <input type="hidden" name="moimNum" value="${moimDo.moimNum}">
    <input type="submit" value="${moimDo.moimMemberMax == moimDo.moimMemberCount ? '모집 마감' : '구매하기'}" ${moimDo.moimMemberMax == moimDo.moimMemberCount ? 'disabled' : ''}>

</form>