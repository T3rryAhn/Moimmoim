<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/ticketCss/ticket.css">

<!DOCTYPE html>
<html>
<head>

    <!-- jQuery -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <!-- 자바 스크립트 -->
    <script type="text/javascript">

    window.onpageshow = function(event) {
        if (event.persisted) {
          window.location.back();
        }
      };



    let isCanceled = false;

    window.addEventListener('beforeunload', function(event) {
      if (!isCanceled) {
        event.preventDefault();
        event.returnValue = "주문이 취소됩니다.";


         cancelOrder();
      }

       // 세션 종료 요청 보내기
              $.ajax({
                  type: "POST",
                  url: "/endSession",
                  async: false,
                  error: function(xhr, status, error) {
                      alert("세션 종료 중 오류가 발생했습니다.");
                  }
              });
    });

    function goBack(){
        window.history.back();
    }

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
             window.history.back;
          },
          error: function(xhr, status, error) {
            alert("결제 취소 중 오류가 발생했습니다.");
          }
        });
      }
    }

    <!-- 아임포트 연동 -->
        IMP.init("imp62670576"); // 가맹점 식별코드

        function requestPay() {
            IMP.request_pay({
              pg: "html5_inicis",
              pay_method: "card",
              merchant_uid: "${orderNum}",   // 주문번호
              name: "${moimDo.moimTitle}",
              amount: ${moimDo.moimPrice},                         // 숫자 타입
              buyer_email: "${userDo.userEmail}",
              buyer_name: "${userDo.userName}",
              buyer_tel: "${userDo.phoneNum}",
              buyer_addr: "${userDo.location}",
              buyer_postcode: ""

            }, function (rsp) { // callback
              //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.

            });
          }
    </script>


    <meta charset="UTF-8">


    <title>모임 티켓 구매 페이지</title>
</head>
<body>
<h2>모임 티켓 구매 페이지</h2>
<hr/>

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
<hr/>
<div class="pay">
    <!-- 결제 금액 -->
    <h3>결제 금액</h3>
    <p>금액: ${moimDo.moimPrice}원</p>




     <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->

    <!-- 취소 버튼 -->
    <button type="button" onclick="goBack()">취소하기</button>
</div>


</body>
</html>
