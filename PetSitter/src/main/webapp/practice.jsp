<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#circle1 {
	background-color:#86efef;
	width:150px;
	height:150px;
	border-radius:25px;
	text-align:center;
	margin:0 auto;
	font-size:12px;
	vertical-align:middle;
	line-height:150px;
	opacity: 0.5;
}
</style>
</head>
<body>
<div id="map" style="width:700px;height:600px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da075431da7cb95698bbd878c9f1b3cc&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map');
		mapOption = {
			center: new kakao.maps.LatLng(36.633535, 127.425882),
			level: 4
		};

		var map = new daum.maps.Map(mapContainer, mapOption);
		
		var geocoder = new daum.maps.services.Geocoder();
		
		var myAddress = [
			"용산구 한강대로 405", "영등포구 경인로 846", "서초구 강남대로 459", "남동구 담방로 105"
		];
		
		function myMarker(number, address) {
			geocoder
				.addressSearch(
						//'주소',
						address,
						function(result, status) {
							// 정상적으로 검색이 완료됐으면
							if (status == daum.maps.services.Status.OK) {
								var coords = new daum.maps.LatLng(
										result[0].y, result[0].x);
								
								var content = '<div class="customoverlay">'
								+ '<span class="title">'
								+ '<div id="circle1" style="font-style:normal; color:red; weight:bold; font-size:2.0em">'
								+ number + '</div>' + '</span>'
								+ '</div>';
								
								var position = new daum.maps.LatLng(
										result[0].y, result[0].x);
								
								var customOverlay = new daum.maps.CustomOverlay(
										{
											map : map,
											position : position,
											content : content,
											yAnchor : 1
										});
																
								map.setCenter(coords);
								
							}
						});
		}
		
		for(i =0 ; i < myAddress.length; i++) {
			myMarker(i + 1, myAddress[i]);
		}
	</script>
</body>
</html>