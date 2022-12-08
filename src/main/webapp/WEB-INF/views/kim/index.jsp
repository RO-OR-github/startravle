<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>게시판 만들기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  </head>
  <body style="background-color: burlywood">
    <h1 class="d-flex justify-content-center">동네 길</h1>
    <header>
      <ul class="nav justify-content-center">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="project/board.do" style="margin: 0 50px; color: black;">동네길 추천</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="project/board.do" style="margin: 0 50px; color: black;">걷기 친구 찾기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="project/board.do" style="margin: 0 50px; color: black;">자유 게시판</a>
        </li>
      </ul>
    </header>
    <main>
      <article style="margin: auto">
        <div class="map_wrap">
        <%--              <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>--%>
          <div id="map" style="width:1200px;height:400px; border: black solid; margin: auto;"></div>
          <div id="menu_wrap" class="bg_white">
            <div class="option">
              <div style="margin: 20px;">
                  키워드 : <input type="text" value="한림대학교" id="keyword" size="15">
                  <button onclick="findKeyword()">검색하기</button>
              </div>
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
          </div>
        </div>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d18a71439138a73b0d4182481a507071&libraries=services,clusterer"></script>


        <script>
          var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                  mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 5 // 지도의 확대 레벨
                  };

          var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

          var ps = new kakao.maps.services.Places();

          var ps = new kakao.maps.services.Places();

          var geocoder = new kakao.maps.services.Geocoder();

          // 마커를 표시할 위치와 title 객체 배열입니다
          let positions = [];
          // 마커 이미지의 이미지 주소입니다
          var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

          <c:forEach var = "road" items="${main}">
            geocoder.addressSearch("${road.startaddress}", function(result, status) {
              // 정상적으로 검색이 완료됐으면
              if (status === kakao.maps.services.Status.OK) {
                positions.push(
                        {
                          title: '${road.name}',
                          latlng: new kakao.maps.LatLng(result[0].y, result[0].x)
                        }
                );
              }
            });
          </c:forEach>



          function allMaker(){
            for (var i = 0; i < positions.length; i ++) {

              // 마커 이미지의 이미지 크기 입니다
              var imageSize = new kakao.maps.Size(24, 35);

              // 마커 이미지를 생성합니다
              var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

              // 마커를 생성합니다
              var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지
              });

              var infowindow = new kakao.maps.InfoWindow({
                content: positions[i].title // 인포윈도우에 표시할 내용
              });

              // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
              // 이벤트 리스너로는 클로저를 만들어 등록합니다
              // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
              kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
              kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
            }
            // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
            function makeOverListener(map, marker, infowindow) {
              return function() {
                infowindow.open(map, marker);
              };
            }

             // 인포윈도우를 닫는 클로저를 만드는 함수입니다
            function makeOutListener(infowindow) {
              return function () {
                infowindow.close();
              };
            }
            console.log(positions.length);
          }

          setTimeout(() => allMaker(), 10000);


          function findKeyword(){
            // 키워드로 장소를 검색합니다
            ps.keywordSearch(document.getElementById("keyword").value, placesSearchCB);
          }


          // 키워드 검색 완료 시 호출되는 콜백함수 입니다
          function placesSearchCB (data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {

              // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
              // LatLngBounds 객체에 좌표를 추가합니다
              var bounds = new kakao.maps.LatLngBounds();

              for (var i=0; i<data.length; i++) {
                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
              }

              // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
              map.setBounds(bounds);
            }
          }

        </script>
      </article>
    </main>
    <footer>
      <div>

      </div>
    </footer>
  </body>
</html>