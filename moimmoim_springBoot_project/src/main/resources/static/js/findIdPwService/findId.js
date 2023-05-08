//페이지 로드 시 send id 버튼 비활성화
var inputCountArry =[0,0]; // 입력요소 유효성 검증 완료 flag
var  cnfirmMsg = document.getElementById("confirm-msg");
var sendIdBttn = document.getElementById("signup-next-bttn");
var userInfo={"userName":"", "userEmail":""};
document.addEventListener("DOMContentLoaded",function(){

    sendIdBttn.disabled=true;
});


//이름 입력 시 유효성 검증
var nameInput = document.getElementById("nameInput");
nameInput.addEventListener("blur", function(){
 const nameRegex = /^[가-힣]{2,5}$/;
if(!nameRegex.test(nameInput.value)){
    cnfirmMsg.innerHTML ="이름 형식을 확인하세요";
    inputCountArry[0] =0;
 }
else{
     userInfo.userName =nameInput.value;
     cnfirmMsg.innerHTML ="안녕하세요! "+nameInput.value+"님";
     inputCountArry[0] =1;
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
        sendIdBttn.disabled = false;
    }
},1000);
//send iD 버튼 클릭 시 서버에 이름과 이메일 확인 일치 확인
sendIdBttn.addEventListener("click",function(){
    // 폼 제출 비활성화
    var userInfoForm =document.getElementById("userInfoForm");
    userInfoForm.addEventListener("submit",function(event){
        event.preventDefault();
    })
    $.ajax({
     url:"findId/checkUser",
     type:"POST",
     contentType: "application/json",
     data: JSON.stringify(userInfo),
     success:function(response){
     console.log(response);
     if(response =="success"){
        alert("이메일을 확인하세요");
        location.href="/login";
     }
     else if(response === ""){
        alert("이름과 이메일을 확인하세요 유효하지 않습니다.");
        location.href="redirect:/findId";
     }
     },
     error:function(error){
       console.log(error);
     }

    });

})