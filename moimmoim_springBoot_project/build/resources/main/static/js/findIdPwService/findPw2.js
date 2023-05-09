
var inputCountArry =[0]; // 입력요소 유효성 검증 완료 flag
var cnfirmMsg = document.getElementById("confirm-msg");
var nextBttn = document.getElementById("signup-next-bttn");
var userInfoForm = document.getElementById("userInfoForm");
//페이지 로드 시 send CODE 버튼 비활성화
//document.addEventListener("DOMContentLoaded",function(){
//    nextBttn.disabled=true;
//});

var codeInput = document.getElementById("codeInput");
var code;
codeInput.addEventListener("input",function(){
    code = codeInput.value;
})
 nextBttn.addEventListener("click",function(){
 //form submit 제한
    userInfoForm.addEventListener("submit",function(event){
        event.preventDefault();
    });
    $.ajax({
        url:"findPw/checkCode",
        type:"POST",
        contentType:"text/plain",
        data:code,
        success:function(response){

            if(response===""){
                alert("코드를 확인하세요");
            }
             else if(response!=null){
                            console.log(response);
                            location.href="/resetPw"
                        }
        },
        error:function(error){
        }
    });
});
