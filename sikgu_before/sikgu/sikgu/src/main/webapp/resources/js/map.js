//기본 지도 불러오기 (기본 좌표, 줌 레벨 지정)
var g_map;

window.addEventListener("load",function(){

   makeMap();
   makeMarkers();
   makeZoomButtonListener();
   makeMarkerListener();

}); // onload listner end

function makeMap(){
   var mapContainer = document.getElementById('map');
   var mapOption = {center : new kakao.maps.LatLng(37.502231, 127.039549), level : 2};
   g_map = new kakao.maps.Map(mapContainer, mapOption);
};

function makeZoomButtonListener(){
//   줌 인 아웃 버튼
   document.getElementById('zoomIn').addEventListener("click", function (){g_map.setLevel(g_map.getLevel()-1);});
   document.getElementById('zoomOut').addEventListener("click", function (){g_map.setLevel(g_map.getLevel()+1);});

//   현재 위치로 이동 버튼
   document.getElementById('locationMe').addEventListener("click", function (){
      locPosition =null;
      if (navigator.geolocation) {
         navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude, lon = position.coords.longitude;
            locPosition = new kakao.maps.LatLng(lat.toString(), lon.toString());
            g_map.setCenter(locPosition);
         });
      } else {
         locPosition = new kakao.maps.LatLng(37.502231, 127.039549), message = 'geolocation을 사용할수 없어요..'
            g_map.setCenter(locPosition);
      }
   })
};

// 마커 생성 함수 (비동기)
function makeMarkers(){

      var mapBound = g_map.getBounds();
      var latLngNE = mapBound.getNorthEast();
      var latLngSW = mapBound.getSouthWest();

      var bounds = {
            E : latLngNE.getLng(),   N : latLngNE.getLat(),
            S : latLngSW.getLat(),   W : latLngSW.getLng()
      };       

      $.ajax({
         url:'getMarkers.do',
         type: 'post',
         dataType: 'json',
         contentType:'application/json',
         success : function(data){
            drawSpot(data);               
         },
         data : JSON.stringify(bounds)
      }) ;
};

// 지도 idle 이벤트 시 마커 새로 생성
function makeMarkerListener(){
   
   kakao.maps.event.addListener(g_map, 'idle', function(){
      makeMarkers()
   });
};

// makeMarkerListener() 함수의 ajax이 success일 경우 (DB의 정보를 기반으로 마커 형성하는 함수)
function drawSpot(list) {

   list.forEach(function(d,i) {

      //마커 생성
      var markerPositionLngLat=new kakao.maps.LatLng(d.store_y,d.store_x); 
      var marker = new kakao.maps.Marker({
         title: d.store_name,
         position: markerPositionLngLat
      }); 
      marker.setMap(g_map);
      // 인포윈도우 생성
      kakao.maps.event.addListener(marker, 'click', function() {
         var name = marker.getTitle();
         var y = marker.getPosition().getLat();
         var x = marker.getPosition().getLng();
         //인포윈도우<div>의 내부 코드 (String, HTML code 기재 가능)
         var iwContent = '<div style="padding:5px; color:black; "><h5 style="font-size:5px;">'+marker.getTitle()+'</h5>'+
         '   <a href="javascript:void(0);" onclick="visibleInfo(this)" store_name='+name+' x='+x+' y='+y+
         '>상세정보</a></div>';
         var infowindow = new kakao.maps.InfoWindow({ content : iwContent });
         infowindow.open(g_map, marker);

         // 
         kakao.maps.event.addListener(g_map, 'click', function() {infowindow.close();});
         document.getElementById("Ground1").addEventListener('click', function() {infowindow.close();});
         document.getElementById("Ground2").addEventListener('click', function() {infowindow.close();});
         document.getElementById("category").addEventListener('click', function() {infowindow.close();});
      });
   }); // foreach end
};

// 상점 상세정보 호출 ( 비동기 )
function visibleInfo(obj){

   var name = $(obj).attr('store_name');
   var x = ($(obj).attr('x')).substring(0,9);
   var y = ($(obj).attr('y')).substring(0,8);
   var store = {
         'store_name':name,
         'store_x':x,
         'store_y':y
   };

   $.ajax({
      url: 'getStoreDetail.do',
      type: 'post',
      dataType: 'json',
      contentType:'application/json',
      data : JSON.stringify(store),
      success : function(data){
         document.getElementById('store_name').innerHTML = data.store_name;      
         document.getElementById('my-video_html5_api').src = data.store_video_path+"1.mp4"
         document.getElementById('my-video').setAttribute('poster', 'resources/images/portfolio/1_image.PNG')
         document.getElementById('my-video').childNodes[0].setAttribute('poster', 'resources/images/portfolio/1_image.PNG')
      },
      error : function(){
         console.log("fail")
      }
   }) ;
   document.getElementById('store_detail').style.display='block'
   document.getElementById("Ground1").addEventListener('click', function() {document.getElementById('store_detail').style.display='none';});
   document.getElementById("Ground2").addEventListener('click', function() {document.getElementById('store_detail').style.display='none';});
}