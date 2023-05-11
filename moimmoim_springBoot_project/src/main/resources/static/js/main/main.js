/*$(document).ready(function() {
    $('.tab button').on('click', function () {
        var categoryNum = $(this).data('category');
        fetchMoimData(categoryNum);
    });
});

function fetchMoimData(categoryNum) {
    $.ajax({
        url: 'moimService/getMoimByCategory',
        method: 'GET',
        data: { categoryNum: categoryNum },
        success: function(response) {
            $('.content').empty();

            $.each(response, function(index, MoimDo) {
                var contentId = 'content-' + (index + 1);
                var $content = $('#' + contentId);

                $content.find('.photo').attr('src', MoimDo.getMoimImage);
                $content.find('.moim_title').text(MoimDo.getMoimTitle);
                $content.find('.moim_location').text(MoimDo.getMoimLocationNum);
                $content.find('.moim_price').text(MoimDo.getMoimPrice);
            });
        },
        error: function() {
            console.log('Error fetching Moim data');
        }
    });
}*/

function openTab(evt, tabName) {
    // 모든 탭 컨텐츠를 숨김
    var tabcontent = document.getElementsByClassName("tabcontent");
    for (var i = 0; i < tabcontent.length; i++) {
        if (tabcontent[i]) {
            tabcontent[i].classList.remove("active");
        }
    }

    // 모든 탭 버튼에서 active 클래스 제거
    var tablinks = document.getElementsByClassName("tablinks");
    for (var i = 0; i < tablinks.length; i++) {
        if (tablinks[i]) {
            tablinks[i].classList.remove("active");
        }
    }

    // 선택된 탭 버튼에 active 클래스 추가
    evt.currentTarget.classList.add("active");

    // 선택된 탭 컨텐츠에 active 클래스 추가
    var selectedTab = document.getElementById(tabName);
    selectedTab.classList.add("active");
}

