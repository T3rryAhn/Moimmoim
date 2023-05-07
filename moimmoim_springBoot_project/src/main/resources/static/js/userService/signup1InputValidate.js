var userInfoForm = document.getElementById("userInfoForm");
var cnfirmMsg = document.getElementById("confirm-msg");
var sendCodeBttn = document.getElementById("sendCodeBttn");
var nextBttn = document.getElementById("signup-next-bttn");
var submitCodeArry =[0,0];
var inputCountArry =[0,0,0,0,0];
var submitEvent;

//페이지 로드 시 submit 버튼 제한
document.addEventListener("DOMContentLoaded", function () {
        sendCodeBttn.disabled=true;
        nextBttn.disabled=true;

    });
//input요소 벗어날 시 msg 안보이게 함
userInfoForm.querySelectorAll('input').forEach((input) => {
    input.addEventListener("blur", function () {
        cnfirmMsg.innerHTML = "";
    });
});
//아이디 유효성 검사
var idInput = document.getElementById("idInput");
idInput.addEventListener("input", function () {
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
         sendCodeBttn.disabled=true;
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
            cnfirmMsg.innerHTML = "이미 등록된 아이디";
            submitCodeArry[0] =0;
            inputCountArry[0]=0;
            sendCodeBttn.disabled=true;
            }
            else if(result ==""){
             console.log("[서버확인]사용가능한 아이디 :" + value );
              cnfirmMsg.innerHTML = "사용가능한 아이디";
              submitCodeArry[0] =1;
              inputCountArry[0] =1;
            }
           }

//            error:function(xhr, status, error){
//             console.log("error: "+error);}
        });

    }
});
//이메일 유효성 검사
var emailInput = document.getElementById("emailInput");
emailInput.addEventListener("input", function () {
    cnfirmMsg.innerHTML = "";
    const emailregex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var value = emailInput.value;

    if (emailregex.test(value) == false) {
        cnfirmMsg.innerHTML = "이메일 형식을 확인하세요";
         sendCodeBttn.disabled=true;
    }
    else {
       $.ajax({
       url:"signup/EmailCheck",
       type:"GET",
       data:{userEmail:value},
       dataType:"text",

       success:function(data){
       if(data === value){
       console.log("[서버확인]등록된 email"+value);
       cnfirmMsg.innerHTML= "사용중인 email 입니다";
       sendCodeBttn.disabled=true;
       submitCodeArry[0] =0;
        inputCountArry[1]=0;
       }
       else if(data ===""){
       console.log("[서버확인]사용가능한 이메일" + value);
       cnfirmMsg.innerHTML="사용가능한 email 입니다.";
       submitCodeArry[1]=1;
       inputCountArry[1]=1;
       if(submitCodeArry[0]==1 && submitCodeArry[1] ==1){
                console.log("send code to Email 버튼 활성화");
                sendCodeBttn.disabled=false;
          }
       else if(submitCodeArry[0]==0 && submitCodeArry[1] ==1){
        console.log("이미 등록된 아이디 입니다.");
         cnfirmMsg.innerHTML="이미 등록된 아이디 입니다.";
         inputCountArry[1]=0;
         sendCodeBttn.disabled=true;
       }
       else{
       inputCountArry[1]=0;
       sendCodeBttn.disabled=true;}
        }
       }
       //            error:function(xhr, status, error){
       //             console.log("error: "+error);}
       });
    }

});
//이메일로 코드 보내는 이벤트
var code;
sendCodeBttn.addEventListener("click",function(){
    sendCodeBttn.disabled=true;

   //서버측에 이메일주소 보내고 이메일주소에 코드 보내기 요청
   $.ajax({
    url:"signup/sendCodeToEmail",
    type:"GET",
    dataType:"text",
    data:{userEmail:emailInput.value},
    success:function(response){
         console.log(response);
         code = response;
         console.log(code);
    }
 });
     alert("메일로 인증코드를 보냈습니다. ");
   });
//코드 일치 불일치 여부 검사
var codeInput =document.getElementById("codeInput");
codeInput.addEventListener("input", function(){
    if(codeInput.value === code){
        cnfirmMsg.innerHTML ="Correct code";
        inputCountArry[2]=1;
    }
    else{
        cnfirmMsg.innerHTML ="NOT Correct code";
        inputCountArry[2]=0;
    }
});
//비밀번호 유효성 검사
//1. 8자~20자
//2. 숫자, 대문자, 소문자, 특수문자 최소 1개 있어야함
var pwInput = document.getElementById("pwInput");
var firstPwInput;
pwInput.addEventListener("input",function(){
    var pwRegex =/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    var pw = pwInput.value;
    //8자~20자 검사
    if(pw.length<8 || pw.length >20){
       cnfirmMsg.innerHTML ="8~20자만 가능합니다.";
       console.log(pwRegex.test(pw));
       inputCountArry[3]=0;
   }
    else if(!pwRegex.test(pw)){
        alert("숫자,대문자,소문자,특수문자를 포함해야합니다.");
        inputCountArry[3]=0;
    }
   else{
        firstPwInput = pw;
        cnfirmMsg.innerHTML ="사용가능";
         inputCountArry[3]=1;
    }
});
//비밀번호 중복검사
var pwReInput = document.getElementById("pwReInput");
pwReInput.addEventListener("input",function(){
   if(firstPwInput == pwReInput.value){
    cnfirmMsg.innerHTML ="PW correct"
    inputCountArry[4] =1;
   }
   else if(firstPwInput != pwReInput.value){
        cnfirmMsg.innerHTML ="PW nonCorrect";
        inputCountArry[4] =0;
    }

});
//모든 input 요소 유효성 만족 시 next 버튼 활성화
var valuesCheck = setInterval(function(){
var sum =0;
for (var i = 0; i < inputCountArry.length; i++) {
      nextBttn.disabled =true;
  sum += inputCountArry[i];
  if (sum == 5) {
    // next 버튼 활성화
    nextBttn.disabled =false;
  }
}
},1000);
 //next 버튼 클릭 시 db에 회원 등록
nextBttn.addEventListener("click", function() {

userInfoForm.addEventListener("submit", function(event) {
    event.preventDefault();
    // 폼 제출을 막음

var formData ={
//        "userId" : "huiung011",
//        "userEmail":"huiung011@gmail.com",
//        "userPassword":"@@h3055449"

        "userId" : idInput.value,
        "userEmail": emailInput.value,
        "userPassword":firstPwInput
    };

    $.ajax({
    url:"signup/addUserStep1",
    type:"POST",
    contentType :"application/json",

    data:JSON.stringify(formData),

    success:function(response){
        console.log("데이터 전송:"+response);

        // 데이터 전송 후 signupPage2 요청
        location.href="signupPage2?userId="+idInput.value;
    },
    error:function(error){
        console.log(error);
      }
    });

});

});


