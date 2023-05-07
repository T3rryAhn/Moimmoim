var userInfoForm = document.getElementById("userInfoForm");
var cnfirmMsg = document.getElementById("confirm-msg");
var signupBttn = document.getElementById("signup-btn");
var checkArry =[0,0,0,0];


//페이지 로드 시 submit 버튼 제한
document.addEventListener("DOMContentLoaded", function () {
        signupBttn.disabled =true;

    });
//input요소 벗어날 시 msg 안보이게 함
userInfoForm.querySelectorAll('input').forEach((input) => {
    input.addEventListener("blur", function () {
        cnfirmMsg.innerHTML = "";
    });
});

//이름 유효성 검사
//1. 한글 2자 이상 5자 이하
var nameInput = document.getElementById("nameInput");
var nameValue;
nameInput.addEventListener("input",function(){
    const nameRegex = /^[가-힣]{2,5}$/;
    if( !nameRegex.test(nameInput.value)){
        cnfirmMsg.innerHTML="이름 형식을 확인하세요";
        checkArry[0]=0;
    }
    else{
        nameValue = nameInput.value;
        cnfirmMsg.innerHTML="환영합니다."+nameValue+"님";
        checkArry[0] =1;
    }
});


//핸드폰 번호 유효성 검사
//1. 010으로 시작
//2. 010-xxxx-xxxx 11자리
var phoneInput = document.getElementById("phoneInput");
var phoneValue;
phoneInput.addEventListener("input",function(){
//1. 010으로 시작
//2. 010-xxxx-xxxx 11자리
//3. 하이픈 미포함
    const phoneRegex = /^010[0-9]{8,}$/;
    if(!phoneRegex.test(phoneInput.value)){
        cnfirmMsg.innerHTML = "하이픈 없이 010포함 11자리 입력하세요";
        checkArry[1] =0;
    }
    else{
        phoneValue = parseInt(phoneInput.value);
        // 등록된 핸드폰 번호인지 서버로부터 조회
        $.ajax({

         url:"signup/phoneCheck",
         type:"GET",
         dataType:"text",
         data:{phoneNum:phoneInput.value},
         success:function(response){
            console.log(response);
            if(response == phoneInput.value){
            cnfirmMsg.innerHTML =response+": 이미 등록된 번호입니다.";
            console.log("[server]:이미 등록된 번호입니다. ");
                checkArry[1] =0;
            }
           else if(response ==""){
            cnfirmMsg.innerHTML ="사용가능";
            console.log("[server]: 사용가능");
                checkArry[1] =1;
           }
         },
         error:function(error){
            console.log(error);
            checkArry[1] =0;
         }
        });



    }
});


//생일 선택 시 checkArry[2] = 1;
var birth = document.getElementById("birth");
if(birth.value =="연도-월-일"){
    cnfirmMsg.innerHTML ="생일을 선택하세요";
    checkArry[2] =0;
}
else{
    checkArry[2] =1;
}

// 취미 선택 시  checkArry[3] =1
 var categoryNum;
 setInterval(function(){
   document.getElementById("eating").addEventListener("click",function(){categoryNum =1; checkArry[3] =1;});
   document.getElementById("watching").addEventListener("click",function(){categoryNum =2; checkArry[3] =1;});
   document.getElementById("leaning").addEventListener("click",function(){categoryNum =3;checkArry[3] =1;});
   document.getElementById("healing").addEventListener("click",function(){categoryNum =4; checkArry[3] =1;});
    document.getElementById("experiencing").addEventListener("click",function(){categoryNum =5; checkArry[3] =1;});
 }, 1000);





//모든 input 요소 유효성 만족 시 signup 버튼 활성화
var valuesCheck = setInterval(function(){
var sum =0;
for (var i = 0; i < checkArry.length; i++) {
      signupBttn.disabled =true;
  sum += checkArry[i];
  if (sum == 4) {
    // next 버튼 활성화
    signupBttn.disabled =false;
  }
}
},1000);

//signup 버튼 클릭 시 db에 데이터 전송
signupBttn.addEventListener("click",function(){

userInfoForm.addEventListener("submit", function(event) {
    event.preventDefault();
    // 폼 제출을 막음

var formData ={

        "userName" : nameInput.value,
        "phoneNum": phoneInput.value,
        "birth": birth.value,
        "categoryNum" :categoryNum
    };

    $.ajax({
    url:"signup/addUserStep2",
    type:"post",
    contentType :"application/json",

    data:JSON.stringify(formData),

    success:function(response){
        console.log("데이터 전송:"+response);
        // 데이터 전송 후 로그인페이지 요청
        location.href="login";
    },
    error:function(error){
        console.log(error);
      }
    });

});

});