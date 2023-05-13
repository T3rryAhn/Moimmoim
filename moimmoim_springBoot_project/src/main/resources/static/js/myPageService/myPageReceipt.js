//버튼 클릭시 서비스 준비중 알림 기능
const registerButton = document.getElementById('registerButton');
const loadingMessage = document.getElementById('loadingMessage');

registerButton.addEventListener('click', function() {
  // 알림을 표시
  loadingMessage.style.display = 'block';
  loadingMessage.textContent = '서비스 준비중입니다.';

  // 알림을 일정 시간 후에 숨김
  setTimeout(function() {
    loadingMessage.style.display = 'none';
  }, 5000); // 알림을 보여줄 시간 밀리초 단위
});