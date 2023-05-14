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
        // 에러메시지 전역변수
        let errorMsg = '<%= request.getAttribute("errorMsg") %>';

        if (errorMsg && errorMsg.trim() !== 'null' && errorMsg.trim() !== '') {
            alert(errorMsg);
            errorMsg = null;

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
            window.location.href = '/moim/getMoim/getMoim?moimNum=${moimNum}';
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
                $.ajax({
                    type: "POST",
                    url: "/updateOrderStatus",
                    data: {
                        orderNum: "${orderNum}",
                        imp_uid: rsp.imp_uid, // 아임포트에서 발급한 고유 번호
                        status: "결제 완료"
                    },
                    success: function (data) {
                        // 구매 성공 페이지로 이동
                       window.parent.postMessage('buySuccess', '*');
                        alert("결제 성공");
                    },
                    error: function (xhr, status, error) {
                        alert("결제 정보 업데이트 중 오류가 발생했습니다.");
                    }
                });
              } else {
                  // 결제 실패 시 로직 작성
                  //alert("결제에 실패하였습니다.");

                  //실패해도 성공한것처럼 하기. 테스트용
                  $.ajax({
                                          type: "POST",
                                          url: "/buySuccess",
                                          data: {
                                              orderNum: "${orderNum}",

                                          }
                      });
                   $.ajax({
                      type: "POST",
                      url: "/updateOrderStatus",
                      data: {
                          orderNum: "${orderNum}",
                          imp_uid: rsp.imp_uid, // 아임포트에서 발급한 고유 번호
                          status: "결제 완료"
                      },



                      success: function (data) {
                          // 구매 성공 페이지로 이동
                          console.log('Sending paymentSuccess message');
                          window.parent.postMessage('buySuccess', '*');
                          alert("결제 성공");
                      },
                      error: function (xhr, status, error) {
                          //alert("결제 정보 업데이트 중 오류가 발생했습니다.");
                            window.parent.postMessage('buySuccess', '*');
                                                    alert("결제 성공");
                            window.parent.location.href = '/moim/getMoim/getMoim?moimNum=${moimNum}';


                      }
                  });
              }

            });
          }

    //간단 프로필 로드
        $(document).ready(function() {

            $.get(`/users/userSimpleProfile/${moimDo.moimHostUserIdNum}`, function(data) {
                $('#user-profile').html(data);
            });
        });
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
       <div id="user-profile"style="width: 50%; height: 50%;"></div>
     </div>
</div>
<hr/>
<div class="pay">
    <!-- 결제 금액 -->
    <h3>결제 금액</h3>
    <p>금액: ${moimDo.moimPrice}원</p>




     <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->

    <!-- 취소 버튼 -->
    <!--
    <button type="button" onclick="goBack()">취소하기</button>
    -->
</div>


</body>
</html>
