//변수만들기
const imageList = document.querySelector('.list');
const imageListItems = document.querySelectorAll('.list li');
const active = 'active';
const dNone = 'd-none';


// [검색 키워드 필터]
const names = document.querySelectorAll('.list .host_info .host_name');
const nameArray = [];
let nameCounter = 1;

for(const name of names){
    nameArray.push({
        id:nameCounter++,
        text:name.textContent
    });
}

const searchInput = document.querySelector('input[type=search]');

searchInput.addEventListener('keyup', keyupHandler);

function keyupHandler(){
    for(const item of imageListItems){
        item.classList.add(dNone);
    }
    const keywords = this.value;

    const filteredArray = nameArray.filter(el => el.text.toLowerCase().includes(keywords.toLowerCase()));
    console.log(filteredArray)

    if(filteredArray.length > 0){
        for(const el of filteredArray){
            document.querySelector(`.list li:nth-child(${el.id})`).classList.remove(dNone);
        }
    }
}
console.log(nameArray);



// [호스트 리스트 필터]
const levels = document.querySelectorAll('.list .host_info .host_level');
const hostLevelArray = [];
let hostlevelCounter = 1;

for(const level of levels){
    hostLevelArray.push({
        id:hostlevelCounter++,
        text:level.textContent
    });
}

// "dropdown-hostlevel" 요소의 자식 요소들을 선택합니다.
const dropdownHostLevel = document.querySelectorAll('.dropdown-hostlevel a');

// 각각의 요소에 클릭 이벤트를 추가합니다.
dropdownHostLevel.forEach(item => {
  item.addEventListener('click', function() {
    // "active" 클래스가 적용된 요소들을 찾아서 클래스를 제거합니다.
    const activeItems = document.querySelectorAll('.dropdown-hostlevel a.active');
    activeItems.forEach(activeItem => {
        activeItem.classList.remove('active');
    });  
    // 선택된 요소의 클래스에 "active" 클래스를 추가합니다.
    this.classList.add('active');
    // 모든 li에 안 보이게 하는 클래스(dNone)추가
    for(const item of imageListItems){
        item.classList.add(dNone);
    }
    console.log("HostList -> classList?")      
    console.log(this.classList)      


    // 선택된 요소의 텍스트 불러오기 
    const keywords = document.querySelector('.dropdown-hostlevel .active').innerText;
    console.log("keywords");
    console.log(keywords);
    // 선택된 요소의 텍스트와 각 li의 hostlist 텍스트가 일치하는 것들 filteredArray에 추가
    const filteredArray = hostLevelArray.filter(el => el.text==keywords);
    console.log(filteredArray)
    // filteredArray에 속한 li들의 dNone 클래스 삭제 
    if(filteredArray.length > 0){
        for(const el of filteredArray){
            document.querySelector(`.list li:nth-child(${el.id})`).classList.remove(dNone);
        }
    }
    })
});


// [별점 필터]
const stars = document.querySelectorAll('.list .host_info .host_stars');
const starsArray = [];
let starsCounter = 1;

for(const star of stars){
    starsArray.push({
        id:starsCounter++,
        text:star.textContent
    });
}
console.log(starsArray);      

// "dropdown-stars" 요소의 자식 요소들을 선택합니다.
const dropdownStars = document.querySelectorAll('.dropdown-stars a');

// 각각의 요소에 클릭 이벤트를 추가합니다.
dropdownStars.forEach(item => {
  item.addEventListener('click', function() {
    // "active" 클래스가 적용된 요소들을 찾아서 클래스를 제거합니다.
    const activeItems = document.querySelectorAll('.dropdown-stars a.active');
    activeItems.forEach(activeItem => {
        activeItem.classList.remove('active');
    });  
    // 선택된 요소의 클래스에 "active" 클래스를 추가합니다.
    this.classList.add('active');
    // 모든 li에 안 보이게 하는 클래스(dNone)추가
    for(const item of imageListItems){
        item.classList.add(dNone);
    }
    // 선택된 요소의 텍스트 불러오기 
    const keywords = document.querySelector('.dropdown-stars .active .stars').innerText;

    // 선택된 요소의 텍스트와 각 li의 hostlist 텍스트가 일치하는 것들 filteredArray에 추가
    const filteredArray = starsArray.filter(el => el.text>=keywords);
    // filteredArray에 속한 li들의 dNone 클래스 삭제 
    if(filteredArray.length > 0){
        for(const el of filteredArray){
            document.querySelector(`.list li:nth-child(${el.id})`).classList.remove(dNone);
        }
    }
    })
});
console.log(starsArray);      
