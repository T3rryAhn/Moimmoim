
var inputCountArry =[0,0]; // 입력요소 유효성 검증 완료 flag
var cnfirmMsg = document.getElementById("confirm-msg");
var resetBttn = document.getElementById("signup-next-bttn");
var userInfoForm = document.getElementById("userInfoForm");

//페이지 로드 시 resetBttn 제출 제한
document.addEventListener("DOMContentLoaded",function(){
    resetBttn.disabled = true;
});


//새롭게 설정할 비밀번호 유효성 검사
var pwInput = document.getElementById("pwInput");
pwInput.addEventListener("input",function(){
var pwRegex =/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        var pw = pwInput.value;
        //8자~20자 검사
        if(pw.length<8 || pw.length >20){
           cnfirmMsg.innerHTML ="8~20자만 가능합니다.";
           console.log(pwRegex.test(pw));
           inputCountArry[1]=0;
       }
        else if(!pwRegex.test(pw)){
            alert("숫자,대문자,소문자,특수문자를 포함해야합니다.");
            inputCountArry[1]=0;
        }
       else{
             cnfirmMsg.innerHTML ="POSSIBLE";
           inputCountArry[1]=1;
        }

});

// 다시 입력받는 비밀번호와 일치 여부 검사
var pwReInput = document.getElementById("pwReInput");
pwReInput.addEventListener("input",function(){

    if(pwInput.value == pwReInput.value){
        cnfirmMsg.innerHTML="CORRECT";
        resetBttn.disabled =false;
    }
    else{
        cnfirmMsg.innerHTML = "NOT CORRECT";
    }
});

// resetBttn 버튼 클릭 시 서버로 비밀번호 갱신 요청
resetBttn.addEventListener("click",function(){
    // 폼 제출 방지
    userInfoForm.addEventListener("submit",function(event){
        event.preventDefault();
    });

    // 서버에 비밀번호 갱신 요청
    $.ajax({
    url:"findPw/resetPw",
    type:"POST",
    contentType:"text/plain",
    data:pwReInput.value,
    success:function(response){
    if(response =="success"){
        alert("비밀번호 갱신 완료");
        location.href="/login";
    }
    else{
        console.log(response);
    }


    },
    error:function(error){
     console.log(error);
    }
    });

});