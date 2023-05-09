<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>모임 티켓 구매 페이지</title>
    <link rel="stylesheet" type="text/css" href="/css/ticketCss/ticket.css">

    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <script type="text/javascript">
        function refreshShowBuyPage() {
            location.reload();
        }

        function showAlert(message, callback) {
            alert(message);
            if (typeof callback === 'function') {
                callback();
            }
        }

        const errorMsg = '<%= request.getAttribute("errorMsg") %>';

        if (errorMsg && errorMsg.trim() !== 'null' && errorMsg.trim() !== '') {
            showAlert(errorMsg, <%= request.getAttribute("errorCallback") %>);
            closeBuyPageModal();
        }

        let isCanceled = false;

        window.addEventListener('beforeunload', function(event) {
            if (!isCanceled) {
                event.preventDefault();
                event.returnValue = "주문이 취소됩니다.";
                cancelOrder();
            }
        });

        window.onbeforeunload = function (event) {
            if (!isCanceled && !goingBack) {
              event.preventDefault();
              event.returnValue = "주문이 취소됩니다.";
              cancelOrder();
            }
          };

        function goBack() {
             // 오류 메시지 초기화
                if (errorMsg && errorMsg.trim() !== 'null' && errorMsg.trim() !== '') {
                    errorMsg = null;
                }
            closeBuyPageModal();
        }

        function cancelOrder() {
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
                        closeBuyPageModal();
                    },
                    error: function(xhr, status, error) {
                        alert("결제 취소 중 오류가 발생했습니다.");
                        closeBuyPageModal();
                    }
                });
            }
        }

        function closeBuyPageModal() {
            //모달 창 닫힐때 주문 취소
            cancelOrder();

            const modal = parent.document.getElementById("buy-page-modal");
            const iframe = parent.document.getElementById("buy-page-iframe");
            iframe.src = "";
            modal.style.display = "none";
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
              if (rsp.success) {
                          // 결제 성공 시 로직 작성 (서버에 결제 결과 전송, DB 업데이트 등)
                      } else {
                          // 결제 실패 시 로직 작성
                          alert("결제에 실패하였습니다.");
                      }

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
