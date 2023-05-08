var loginBttn = document.getElementById("signup-next-bttn");
var cnfirmMsg = document.getElementById("confirm-msg");
var submitCodeArry =[0,0];
 var loginInfo ={
     "userId":"",
     "userPassword":""
  };
//페이지 로드 시 submit 버튼 제한
document.addEventListener("DOMContentLoaded", function () {
        loginBttn.disabled=true;
    });


//아이디 입력 시 회원인지 아닌지 검사
var idInput = document.getElementById("idInput");
idInput.addEventListener("blur",function(){
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
                 loginInfo.userId=value;
                submitCodeArry[0] =1;

                }
                else if(result ==""){
                 console.log("[server]:등록되지 않은 아이디 ");
                  cnfirmMsg.innerHTML = "아이디를 확인하세요";
                   submitCodeArry[0] =0;
                }
               }

    //            error:function(xhr, status, error){
    //             console.log("error: "+error);}
            });

        }
    });

// 비밀번호 입력 시 비밀번호 유효성 검사
var pwInput = document.getElementById("pwInput");
pwInput.addEventListener("blur",function(){
    var pwRegex =/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        var pw = pwInput.value;
        //8자~20자 검사
        if(pw.length<8 || pw.length >20){
           cnfirmMsg.innerHTML ="8~20자만 가능합니다.";
           console.log(pwRegex.test(pw));
           submitCodeArry[1]=0;
       }
        else if(!pwRegex.test(pw)){
            alert("숫자,대문자,소문자,특수문자를 포함해야합니다.");
            submitCodeArry[1]=0;
        }
       else{
             console.log("비밀번호 형식 : ok");
             loginInfo.userPassword =pw;
             cnfirmMsg.innerHTML ="";
             submitCodeArry[1]=1;
        }
});

//아이디, 비밀번호 형식에 맞게 입력 시 로그인 버튼 활성화
setInterval(function(){
   if(submitCodeArry[0] == 1 && submitCodeArry[1] == 1){
    loginBttn.disabled =false;
   }
},1000);

//로그인 버튼 클릭 시 서버로 ID와 PW 확인
var loginForm = document.getElementById("loginForm");

loginBttn.addEventListener("click",function(){
 // 폼 제출 비활성화
 loginForm.addEventListener("submit",function(event){
   event.preventDefault();
 });

 // 서버로 입력받은 id와 비밀번호 전달
 $.ajax({
    url:"login/checkUser",
    type:"POST",
    contentType:"application/json",
    data:JSON.stringify(loginInfo),
    success:function(response){
    console.log(response);
    //회원일 시 메인페이지로 이동
    if(response!=""){
      location.href="/";
    }
    //회원이 아닐 시 로그인페이지로 이동
    else if(response ==""){
     alert("회원이 아닙니다. 로그인 정보를 확인하세요");
     location.href="login";
    }
    },
    error:function(error){
    console.log("error");
    }
 });
});