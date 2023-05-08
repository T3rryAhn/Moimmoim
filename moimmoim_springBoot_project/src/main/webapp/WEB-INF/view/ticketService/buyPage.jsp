<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>모임 티켓 구매 페이지</title>
</head>
<body>
<h2>모임 티켓 구매 페이지</h2>
<hr/>

<!-- 모임 정보 -->
<h3>모임 정보</h3>
<p>제목: ${moimDo.moimTitle}</p>
<p>날짜: ${moimDo.moimStartDate}</p>
<p>장소: ${moimDo.moimLocationNum}</p>
<p>인원: ${moimDo.moimMemberCount}명 / ${moimDo.moimMemberMax}명</p>

<!-- 결제 금액 -->
<h3>결제 금액</h3>
<p>금액: ${moimDo.moimPrice}원</p>

<!-- 결제 수단 -->
<h3>결제 수단</h3>
<form action="/pay" method="post">
    <input type="hidden" name="moimNum" value="${moimDo.moimNum}"/>
    <input type="hidden" name="moimPrice" value="${moimDo.moimPrice}"/>
    <select name="payMethod">
        <option value="credit">KSP</option>
    </select>
    <button type="submit">결제하기</button>
</form>

<!-- 취소 버튼 -->
<button type="button" onclick="cancelOrder()">취소하기</button>

<!-- 자바 스크립트 -->
<script type="text/javascript">
let isCanceled = false;

window.addEventListener('beforeunload', function(event) {
  if (!isCanceled) {
    event.preventDefault();
    event.returnValue = "주문이 취소됩니다.";

    // 사용자가 확인 버튼을 누르면 취소 이벤트를 실행하고 뒤로 이동합니다.
    setTimeout(() => {
      cancelOrder();
      window.history.back();
    }, 100);
  }
});

function cancelOrder() {
  // 주문이 취소됩니다라는 알림창을 표시합니다.
  if (!isCanceled) {
    isCanceled = true;
    alert("주문이 취소됩니다.");

    $.ajax({
      type: "POST",
      url: "/cancelOrder",
      data: {
        orderNum: "${orderNum}"
      },
      success: function(data) {
        // 결제 취소가 완료되면 알림창이 닫힌 후 뒤로 이동합니다.
         window.history.back();
      },
      error: function(xhr, status, error) {
        alert("결제 취소 중 오류가 발생했습니다.");
      }
    });
  }
}
</script>

</body>
</html>
