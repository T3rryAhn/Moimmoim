
var inputCountArry =[0,0]; // 입력요소 유효성 검증 완료 flag
var cnfirmMsg = document.getElementById("confirm-msg");
var sendCodeBttn = document.getElementById("signup-next-bttn");
var userInfo={"userId":"", "userEmail":""};
//페이지 로드 시 send CODE 버튼 비활성화
document.addEventListener("DOMContentLoaded",function(){

    sendCodeBttn.disabled=true;
});


//아이디 입력 시 유효성 검증
var idInput = document.getElementById("idInput");
idInput.addEventListener("blur", function(){
  var value = idInput.value;
         console.log("id :", value);

         //아이디 유효성 검사 기준
         //1. 영문 소문자와 숫자로만 구성
         //2. 4~20자만 가능
         const idregex = /^[a-z][a-z0-9]+$/;
         if (idregex.test(value) == false) {
             console.log("소문자와 숫자만 가능합니다.");
             cnfirmMsg.innerHTML = "소문자와 숫자만 가능합니다.";
             sendCodeBttn.disabled=true;
         }
         else if (value.length < 4 || value.length > 20) {
             console.log("4~20자 까지만 가능합니다.");
             cnfirmMsg.innerHTML = "4~20자 까지만 가능합니다.";
              loginBttn.disabled=true;
              inputCountArry[0]=0;
         }
         //형식에 맞는지 검사 완료
         //서버로 아이디를 보내 중복검사
         else {
             $.ajax({
                 url:"signup/idCheck",
                 type:"GET",
                 data:{userId:value},
                 dataType:"text", // 서버로부터 문자열 받음
                 success:function(result){
                 if(result === value){
                 console.log("[서버확인]이미 등록된 아이디 : "+ result);
                 cnfirmMsg.innerHTML = "안녕하세요"+value+"님";
               userInfo.userId =value;
                inputCountArry[0] =1;

                 }
                 else if(result ==""){
                  console.log("[server]:등록되지 않은 아이디 ");
                   cnfirmMsg.innerHTML = "아이디를 확인하세요";
                     inputCountArry[0] =0;
                 }
                }

     //            error:function(xhr, status, error){
     //             console.log("error: "+error);}
             });

         }
});

//이메일 입력 시 유효성 검증
var emailInput = document.getElementById("emailInput");
emailInput.addEventListener("blur",function(){

 const emailregex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var value = emailInput.value;

    if (emailregex.test(value) == false) {
        cnfirmMsg.innerHTML = "이메일 형식을 확인하세요";
        inputCountArry[1] =0;
    }
    else{
         userInfo.userEmail = value;
        inputCountArry[1] =1;
    }

});


//이름,이메일 유효성 검증 통과 시 버튼 활성화
setInterval(function(){
    if(inputCountArry[0]==1 && inputCountArry[1] ==1){
        sendCodeBttn.disabled = false;
    }
},1000);

//sendCode 버튼 클릭 시 서버에 아이디와 이메일 확인 일치 확인
sendCodeBttn.addEventListener("click",function(){
    // 폼 제출 비활성화
    var userInfoForm =document.getElementById("userInfoForm");
    userInfoForm.addEventListener("submit",function(event){
        event.preventDefault();
    })
    $.ajax({
     url:"findPw/checkUser",
     type:"POST",
     contentType: "application/json",
     data: JSON.stringify(userInfo),
     success:function(response){
     console.log(response);
     if(response!=""){
        alert("이메일을 확인하세요");
         document.cookie = "JSESSIONID="+response;
        location.href="/findPw2";
     }
     else if(response === ""){
        alert("아이디와 이메일을 확인하세요 유효하지 않습니다.");
        location.href="/findPw1";
     }
     },
     error:function(error){
       console.log(error);
     }

    });

})