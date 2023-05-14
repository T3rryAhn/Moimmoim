<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta chatset="UTF-8">
    <title>결제 및 대금수령</title>
    <meta name="viewport" content="width=device-width , initial-scale=1.0" />
    <link rel="stylesheet" href="/css/myPageUi/myPageReceipt.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
   <header>
           <header>
           <div id="header_container">
               <div id="main-logo" ><a href="/"><img src="/imgs/moimmoimUi/logo.png" alt="logo" width="200px"></a></div>
               <c:if test="${sessionScope.userIdNum==null}">
                   <div id="login_icon"><a href="/login"><img src="/imgs/moimmoimUi/login.png" alt="login" width="40px"></a></div>
               </c:if>
               <c:if test="${sessionScope.userIdNum!=null}">
                   <div id="login_icon"><a href=/profilePage/${sessionScope.userIdNum}><img src="/imgs/moimmoimUi/mypage.png" alt="login" width="40px"></a></div>
               </c:if>
           </div>
           </header>
       </header>
    <main>
        <h1><a href="/">마이페이지</a> > 결제 및 대금수령</h1>
        <div class="receipt_body">
        <p>수령받으실 금액</p>
        <p>${receiptDo.receiptMoney} 원</p>
        <label for="accountnumber">입금 받으실 계좌</label>
        <input type="text" name="accountnumber" class="acnumber_box" pattern="[0-9]*" required>
        <button id="registerButton">등록</button>
        <div id="loadingMessage" style="display: none;">서비스 준비중입니다.</div>
        <script src="/js/myPageService/myPageReceipt.js"></script>
        </div>
        </main>
    <footer>
        <div id="footer_container">
            <div id="logo" ><a href="/"><img src="/imgs/userService/whiteLogo.png" alt="logo" width="200px"></a></div>
            <a href="/" class="footer_font">개인정보 처리방침</a>
            <a href="/" class="footer_font">기타 필요메뉴</a>
            <a href="/" class="footer_font">메뉴구성</a>
            <c:if test="${sessionScope.userIdNum!=null}">
                <a href="/logout" class="footer_font">로그아웃</a>
            </c:if>
            <a href="/" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
        </div>
    </footer>
</body>
</html>