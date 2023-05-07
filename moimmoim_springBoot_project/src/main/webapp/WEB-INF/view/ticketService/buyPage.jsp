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

<!-- 모임 정보 -->
<h3>모임 정보</h3>
<p>제목: ${moimDo.moimTitle}</p>
<p>날짜: ${moimDo.moimDate}</p>
<p>장소: ${moimDo.moimPlace}</p>
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
    <p style="color: red">${errorMsg}</p>
</c:if>

</body>
</html>