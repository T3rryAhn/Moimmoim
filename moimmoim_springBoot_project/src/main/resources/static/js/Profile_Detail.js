//open//
// 변수 지정
var slideWrapper =  document.getElementsByClassName('open_moim'),
    slideContainer  = document.getElementsByClassName('slider-container'),
    slides = document.getElementsByClassName('slide'),
    slideCount = slides.length,
    currentIndex = 0,
    topHeight = 0,
    navPrev = document.getElementById('prev'),
    navNext =  document.getElementById('next');

// 슬라이드가 있으면 가로로 배열하기
if (slideCount > 0) {
  for (var i = 0; i < slideCount; i++) {
    slides[i].style.left = (100 / 3) * (i) + "%";
  }
}

// 슬라이드 이동 함수
function goToSlide(index){
  slideContainer[0].style.left = -100 * index + '%';
  slideContainer[0].classList.add('animated');
  currentIndex = index;
  updateNav();
}

// 버튼기능 업데이트 함수
function updateNav(){
  if(currentIndex == 0){
    navPrev.classList.add('disabled');
  }else{
    navPrev.classList.remove('disabled');
  }
  if(currentIndex >= (slideCount/3) - 1){
    navNext.classList.add('disabled');
  } else {
    navNext.classList.remove('disabled');
  }
}

// 버튼을 클릭하면 슬라이드 이동시키기
navPrev.addEventListener('click', function(event) {
  event.preventDefault();
  goToSlide(currentIndex - 1);
  console.log("다음칸으로");
});

navNext.addEventListener('click', function(event) {
  event.preventDefault();
  goToSlide(currentIndex + 1);
  console.log("이전으로");
});

// 첫번째 슬라이드 먼저 보이도록 하기
goToSlide(0);


//closed//
// 변수 지정
var slideWrapper2 =  document.getElementsByClassName('closed_moim'),
    slideContainer2  = document.getElementsByClassName('slider-container2'),
    slides2 = document.getElementsByClassName('slide2'),
    slideCount2 = slides2.length,
    currentIndex2 = 0,
    topHeight2 = 0,
    navPrev2 = document.getElementById('prev2'),
    navNext2 =  document.getElementById('next2');
// 슬라이드가 있으면 가로로 배열하기
if (slideCount2 > 0) {
  for (var i = 0; i < slideCount2; i++) {
    slides2[i].style.left = (100 / 3) * (i) + "%";
  }
}
// 슬라이드 이동 함수
function goToSlide2(index2){
  slideContainer2[0].style.left = -100 * index2 + '%';
  slideContainer2[0].classList.add('animated');
  currentIndex2 = index2;
  updateNav2();
}
// 버튼기능 업데이트 함수
function updateNav2(){
  if(currentIndex2 == 0){
    navPrev2.classList.add('disabled');
  }else{
    navPrev2.classList.remove('disabled');
  }
  if(currentIndex2 >= (slideCount2/3) - 1){
    navNext2.classList.add('disabled');
  } else {
    navNext2.classList.remove('disabled');
  }
}
// 버튼을 클릭하면 슬라이드 이동시키기
navPrev2.addEventListener('click', function(event) {
  event.preventDefault();
  goToSlide2(currentIndex2 - 1);
  console.log("다음칸으로2");
});
navNext2.addEventListener('click', function(event) {
  event.preventDefault();
  goToSlide2(currentIndex2 + 1);
  console.log("이전으로2");
});
// 첫번째 슬라이드 먼저 보이도록 하기
goToSlide2(0);