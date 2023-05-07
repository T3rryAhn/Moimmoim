<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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



<!-- 구매 실패 메시지 -->

<c:if test="${not empty errorMsg}">
    <script type="text/javascript">
        alert("${errorMsg}");
        history.back();
    </script>
</c:if>

<script type="text/javascript">
    window.onbeforeunload = function() {
        return "정말로 페이지를 나가시겠습니까?";
    };

    $(document).ready(function() {
        $(window).on('unload', function() {
            var orderNum = "${orderNum}";

            $.ajax({
                url: "/cancelOrder",
                method: "POST",
                data: {},
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("X-CSRF-Token", $("meta[name='_csrf']").attr("content"));
                },
                success: function(result) {
                    alert(result);
                },
                error: function(xhr, status, error) {
                    alert("주문 취소 중 오류가 발생했습니다.");
                }
            });
        });
    });
</script>

</body>
</html>