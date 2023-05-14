<%@ page  language ="java" contentType="text/html; charset=utf-8" pageEncoding ="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
    <title>MOIMMOIM :: 모임글 보기</title>
    <link rel="stylesheet" href="/css/moimCss/moim_detail.css">
    <link rel="stylesheet" href="/css/moimCss/headerfooter_basic.css">

    <script>
    //티켓 삽입을 위한 스크립트
      $(document).ready(function() {
        $.get("/ticket/forDetailMoim/${moimDo.moimNum}", function(data) {
          $("#insertContent").html(data);
        });
      });
    </script>

    <script>
    function delOk(){
        if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
            return false;
        }
    }
    </script>
</head>
<body>
<!-- 헤더 시작 -->
<header>
    <div id="header_container">
        <div id="header_logo"><a href="/"><img src="\imgs\moimmoimUi\logo.png" alt="logo" width="180px"></a></div>
        <div class="header_bar">
            <a href="/moim/getMoim/list" class="header_menu">MOIM LIST</a>
            <a href="#" class="header_menu">HOST LIST</a>
            <a href="#" class="header_menu">고객센터</a>
            <c:if test="${sessionScope.userIdNum==null}">
                <div id="login_icon"><a href="/login"><img src="/imgs/moimmoimUi/login.png" alt="login" width="40px"></a></div>
            </c:if>
            <c:if test="${sessionScope.userIdNum!=null}">
                <div id="login_icon"><a href=/profilePage/${sessionScope.userIdNum}><img src="/imgs/moimmoimUi/mypage.png" alt="login" width="40px"></a></div>
            </c:if>
        </div>
    </div>
</header>
<main>

    <!--
    대표사진 src = /files/${moimDo.moimImage}
    사진들
       <c:forEach items="${imageList}" var="ImageDTO">
            <img src=/files/${ImageDTO.uploadPath}${ImageDTO.uuid}-${ImageDTO.fileName} alt="My Image"style="width:100px; height:100px;">
       </c:forEach>
    <img src="/files/2023/05/10/801d6934-86a7-4671-af9e-15a5ecf4481b-2.jpg" alt="My Image" >
    -->

    <div class="container">
    <div class="form-group">
        <div class="box box1">
            <h1 class="moim_title">
                <img src="\imgs\moimmoimUi\bar.png"; class="green_bar">
                ${moimDo.moimTitle}</h1>
        </div>
        <div class="box box2">
            <ul class="slider-container simple-list" id="slider">
<!--                <li class="slide">
                    <img src="/files/${moimDo.moimImage}" alt="moim_photo" class="moim_photo" >
                </li>-->
                <li class="slide">
                    <img src="/imgs/moim_img/image1.jpg" alt="moim_photo" class="moim_photo" >
                </li>
                <li class="slide">
                    <img src="/imgs/moim_img/image1.jpg" alt="moim_photo" class="moim_photo" >
                </li>
                <li class="slide">
                    <img src="/imgs/moim_img/image1.jpg" alt="moim_photo" class="moim_photo" >
                </li>


            </ul>
            <a href="#" id="prev"></a>
            <a href="#" id="next"></a>

        </div>
        <div class="box box3">
            <div >
                <div class="detail_box top">
                    <dl class="moim_creator">
                        <dt class="moim_creator_title">모임 만든이</dt>
                        <dd class="moim_creator_content">
                            <a href="/profilePage/${moimDo.moimHostUserIdNum}"> ${name}</a></dd>
                    </dl>
                </div>
                <div class="detail_box middle">
                    <dl class="moim_info">
                        <dt class="moim_info_title"> 모임 카테고리</dt>
                        <a href="#"><dd class="moim_info_content category">
                        ${moimDo.moimCategoryNum==1 ? '🍴' : ''}
                        ${moimDo.moimCategoryNum==2 ? '🎞' : ''}
                        ${moimDo.moimCategoryNum==3 ? '🎨' : ''}
                        ${moimDo.moimCategoryNum==4 ? '🎈' : ''}
                        ${moimDo.moimCategoryNum==5 ? '🎠' : ''}
                        ${moimDo.moimCategoryNum}.${category}</dd></a>
                    </dl>
                    <div>
                        <dl class="moim_info">
                            <dt class="moim_info_title"> 모임 시작 시간</dt>
                            <dd class="moim_info_content"><tf:formatDateTime value="${moimDo.moimStartDate}" pattern="yyyy-MM-dd HH:mm" /></dd>
                        </dl>
                        <dl class="moim_info">
                            <dt class="moim_info_title"> 모임 종료 시간</dt>
                            <dd class="moim_info_content"><tf:formatDateTime value="${moimDo.moimEndDate}" pattern="yyyy-MM-dd HH:mm" /></dd>
                        </dl>

                        <dl class="moim_info">
                            <dt class="moim_info_title"> 현재 모임 참가 인원</dt>
                            <dd class="moim_info_content">${moimDo.moimMemberCount}명</dd>
                        </dl>
                        <dl class="moim_info">
                            <dt class="moim_info_title"> 모임 최대 참가 인원</dt>
                            <dd class="moim_info_content">${moimDo.moimMemberMax}명</dd>
                        </dl>
                    </div>
                </div>
                <div class="detail_box middle">
                    <dl class="moim_info">
                        <dt class="moim_info_title">모임 가격</dt>
                        <dd class="moim_info_content">${moimDo.moimPrice}원/1인</dd>
                    </dl>
                    <dl class="moim_info">
                        <dt class="moim_info_title">모집 마감일</dt>
                        <dd class="moim_info_content"><tf:formatDateTime value="${moimDo.moimDeadLine}" pattern="yyyy-MM-dd" /></dd>
                    </dl>

                    <dl class="moim_info">
                        <dt class="moim_info_title">모집 마감 여부</dt>
                        <dd class="moim_info_content">${moimDo.moimDeadCheck==0 ? '모집중' : '모집 마감'}</dd>
                    </dl>
                </div>
                <div class="detail_box bottom">
                    <dl class="moim_info">
                        <dt class="moim_info_title"> 모임 위치</dt>
                        <dd class="moim_info_content">${locationDo.locationName}</dd>
                    </dl>
                        <div id="map" style="width: 300px; height: 200px; left: 0px; top: 0px"></div>
                        <div>
                            <input id="vworld" type="hidden" min="0" max="1" step="0.1" value="1">
                        </div>
                        <div>
                            <input id="nsdi" type="hidden" min="0" max="1" step="0.1" value="0">
                        </div>
                        <div class="location_check">
                            <input type="text" name="sig_kor_nm" value="${locationDo.destination}" disabled class="d-none">
                            <input type="button" name="search" value="모임 시작 지역 확인" onclick="callAjax()" class="location_check">
                        </div>

                    <p class="created_date"><tf:formatDateTime value="${moimDo.moimCreateDate}" pattern="yyyy-MM-dd" /></p>
                </div>

            </div>
        </div>
        <div class="box box4">
            <div class="moim_content">모임 소개 글 : ${moimDo.moimMainContent}
이 지역의 이름은 시대에 따라 바뀌어 왔으나, 지금의 평창동이라는 이름은 조선시대 때 있던 선혜청이라는 곳의 평창 세금으로 온 곡식들을 저장한 창고이다에서 유래하여 명명되었다. 조선 후기에는 세도 정치를 한 반남 박씨(潘南 朴氏), 장동 김씨(壯洞 金氏) 등의 명문 양반가들이 종로구 일대에 모여 살던 곳이다. 이후에 가회동으로 거쳐를 옮기며 무명 예술인들이 모여 살기 시작했다.

평창동은 전체의 65%가 개발제한구역이다. 즉, 평창동 전체에서 35%의 구역에만 주민들이 살고 있다는 뜻이다. 본래는 북한산 국립공원 인근 지역이다보니 개발제한구역의 비율이 더 높았으나, 1968년에 김신조 일당이 이 인근 지역을 침투한 이후로 청와대 궁전의 뒤편에 사람이 사는 마을이 있어야 침투로가 없어질 것이라고 생각하여 정부 차원에서 마을을 활성화시켰다. (424자)
            </div>
        </div>

        <div class="box box5">
          <div id="insertContent"></div>
        </div>

        <div class="box box6">
            <div class="post_info">
                <div>
                    <p class="moim_nums"> 모임 넘버: ${moimDo.moimNum}</p>
                </div>
                <div>
                    <p class="moim_nums"> 모임 조회수: ${moimDo.moimViewCount}</p>
                </div>
            </div>
        </div>

        <div class="box box7">
            <div class="post_man">
                <form action="/moim/getMoim/delete" method="get">
                    <input type="hidden" id="num" name="moimNum" value=${moimDo.moimNum} >
                    <button onclick="if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까?')){return false;}"${moimDo.moimHostUserIdNum == userIdNum ? '':'disabled'} class="post_delete">
                    삭제하기</button>
                </form>

                <form action="/moim/getMoim/update" method="get">
                    <input type="hidden" id="num" name="moimNum" value=${moimDo.moimNum}>
                    <button ${moimDo.moimHostUserIdNum == userIdNum ? '':'disabled'} class="post_edit">수정하기</button>
                </form>
            </div>

        </div>

    </div>

</div>
</main>
    <footer>
        <div id="footer_container">
            <div class="footer_logo_menu">
                <a href="#"><img src="\imgs\moimmoimUi\whiteLogo.png" alt="logo" width="200px"></a>
                <a href="#" class="footer_font">개인정보 처리방침</a>
                <a href="#" class="footer_font">기타 필요메뉴</a>
                <a href="#" class="footer_font">메뉴구성</a>
                <c:if test="${sessionScope.userIdNum!=null}">
                    <a href="/logout" class="footer_font">로그아웃</a>
                </c:if>
            </div>
            <div>
                <a href="#" class="footer_font">Copyright © MOIM MOIM. All Rights Reserved.</a>
            </div>
        </div>
    </footer>
    <script src="\js.moimService\moim_detail.js"></script>

    <script type="text/javascript">


        let  Base = new ol.layer.Tile({
    		name : "Base",
    		source: new ol.source.XYZ({
    			url: 'http://api.vworld.kr/req/wmts/1.0.0/CEB52025-E065-364C-9DBA-44880E3B02B8/Base/{z}/{y}/{x}.png'
    		})
    	}); // WMTS API 사용

        let  olView = new ol.View({
            center:[14135182, 4515000],//좌표계 변환
            zoom: 10
        })// 뷰 설정
        let  map = new ol.Map({
            layers: [Base],
            target: 'map',
            view: olView
        });

        let  wms_title = '시군구';
        let  wms_val = 'LT_C_ADSIGG_INFO';
        wms_val = wms_val.toLowerCase();
        let  wms_tile = new ol.layer.Tile({
            name : "WMS_LAYER",
            source : new ol.source.TileWMS({
                url : "http://api.vworld.kr/req/wms?",
                params : {
                    LAYERS : wms_val,
                    STYLES : wms_val,
                    CRS : "EPSG:3857",
                    apikey : "CEB52025-E065-364C-9DBA-44880E3B02B8",
                    DOMAIN : "http://loacalhost:8080",
                    title : wms_title,
                    FORMAT : "image/png",
                    domain : "http://localhost"
                }
            })
        });


        /* 폴리곤의 스타일 설정 */
    function styleFunction(feature) {

        return [
            new ol.style.Style({
                fill: new ol.style.Fill({
                color: 'rgba(255,0,255,0.4)'
                }),
                stroke: new ol.style.Stroke({
                color: '#3399CC',
                width: 1.25
                }),
                text: new ol.style.Text({
                    offsetX:0.5, //위치설정
                    offsetY:20,   //위치설정
                    font: '20px Calibri,sans-serif',
                    fill: new ol.style.Fill({ color: '#000' }),
                    stroke: new ol.style.Stroke({
                        color: '#fff', width: 3
                    }),
                    text: feature.get('addr') == null ? feature.get('sig_kor_nm') : feature.get('addr')
                }),
                image: new ol.style.Icon(/** @type {olx.style.IconOptions} */ ({
                    anchor: [0.5, 10],
                    anchorXUnits: 'fraction',
                    anchorYUnits: 'pixels',
                    src: 'http://map.vworld.kr/images/ol3/marker_blue.png'
                }))
            })
        ];
    }

        map.getView().getProjection().code_="EPSG:3857" //브이월드의 EPSG:900913 사용시 편집지적도가 작동되지 않음

        map.addLayer(wms_tile);  // 브이월드 지적도 등록 (openlayers 3.0 버전의 WMS tile layer 등록)

        //  http://openapi.nsdi.go.kr/nsdi/map/LandInfoBaseMapUTMKService - 항공영상 -

        //  http://openapi.nsdi.go.kr/nsdi/map/LandInfoBaseMapITRF2000Service? 지도조회(ITRF2000)

        //  http://openapi.nsdi.go.kr/nsdi/map/LandInfoBaseMapBesselService 지도조회(Bessel)

        //  http://openapi.nsdi.go.kr/nsdi/map/LandInfoBaseMapUTMKBlueService 지도조회(UTM-K)

        //  http://openapi.nsdi.go.kr/nsdi/map/LandInfoBaseMapITRF2000BlueService - 지도조회(ITRF2000)

        let  nsdi_tile = new ol.layer.Tile({
            name : "NSDI_LAYER",
            source : new ol.source.TileWMS({
                url : "http://openapi.nsdi.go.kr/nsdi/map/LandInfoBaseMapUTMKBlueService?",
                params : {
                    authkey :   "aed1f1084e775267d81d20",
                    SERVICE : "WMS",
                    VERSION : "1.3.0",
                    REQUEST : "GetMap",
                    FORMAT  : "image/png",
                    LAYERS : "0",
                    CRS : "EPSG:3857",
                    STYLES : ""
                }
            })
        });
        nsdi_tile.setOpacity(0);
        map.addLayer(nsdi_tile);  // 편집 지적도 등록 (openlayers 3.0 버전의 WMS tile layer 등록)

        let  kop = document.getElementById('vworld');
        let  mop = document.getElementById('nsdi');

        kop.addEventListener('input', function() {
            map.getLayers().forEach(function(layer){ //openlayers 에서의 name 속성값을 이용한 Layer 접근
                if(layer.get("name")=="WMS_LAYER"){
                    layer.setOpacity(kop.value) //투명도 설정
                }
            });
        });

        mop.addEventListener('input', function() {
            map.getLayers().forEach(function(layer){ //openlayers 에서의 name 속성값을 이용한 Layer 접근
                if(layer.get("name")=="NSDI_LAYER"){
                    layer.setOpacity(mop.value) //투명도 설정
                }
            });
        });

        $("[name=sig_kor_nm]").on('input', function() {
            callAjax();
        })

        let  callAjax = function(){
            value = $("[name=sig_kor_nm]").val();
            let  data = "key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=100&page=1&data=LT_C_ADSIGG_INFO&geometry=true&attribute=true&crs=EPSG:3857"
            data += "&attrfilter=sig_kor_nm:like:"+value

            $.ajax({
    		    	type: "get",
    		    	url: "http://api.vworld.kr/req/data",
    		    	data : data,
    		    	dataType: 'jsonp',
    		    	async: false,
    		    	success: function(data) {

    		    	    let  vectorSource = new ol.source.Vector({features: (new ol.format.GeoJSON()).readFeatures(data.response.result.featureCollection)})


    		    		map.getLayers().forEach(function(layer){
    		    			if(layer.get("name")=="search_result"){
    		    				map.removeLayer(layer);//기존결과 삭제
    		    			}
    		    		})
    		    	    let  vector_layer = new ol.layer.Vector({
    		    	  	  source: vectorSource,
    		    	  	  style: styleFunction
    		    	  	})

    		    	    vector_layer.set("name","search_result");
    		    	 	map.addLayer(vector_layer);
    		       	},

    		    	error: function(xhr, stat, err) {}
            });
        }

        // $("[name=sig_kor_nm]").on('input', function() {
        //     callAjax();
        // })

    </script>
</body>
</html>