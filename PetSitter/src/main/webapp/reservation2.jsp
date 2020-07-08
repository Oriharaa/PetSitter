<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션 종료시 홈으로
	if(session.getAttribute("id") == null) {
		out.println("<script>");
		out.println("location.href = 'home.me'");
		out.println("</script>");
	}
%>
<!-- ***방문 돌봄*** -->

<!doctype html>
<html lang="en">


<style>
	/*펫시터 메인 폰트컬러 */
	.main_mintfont{
	color : #53DC98!important;
	}
	
	.main_whitefont{
	color : #ffffff!important;
	}
	
	#main_whitefont2{
	color : #ffffff!important;
	}
	
	#main_grayfont1{
	color : #707070!important;
	}
	
	#main_grayfont2{
	color : #949494!important;
	}
	/*펫시터 메인 폰트컬러 끝*/
	
	
	/* 제이쿼리 로인해 색 폰트 사이즈 수정을 위해 jsp파일안에 스타일 오버라이트 
resource/css/style.css 부분에서 찾은 부분(최종은 jsp에있는 style로 적용 됨) */
	.site-mobile-menu {
	  width: 300px;
	  position: fixed;
	  right: 0;
	  z-index: 2000;
	  padding-top: 20px;
	  background: #d3d3d3!important;
	  height: calc(100vh);
	  -webkit-transform: translateX(110%);
	  -ms-transform: translateX(110%);
	  transform: translateX(110%);
	  -webkit-box-shadow: -10px 0 20px -10px rgba(0, 0, 0, 0.1);
	  box-shadow: -10px 0 20px -10px rgba(0, 0, 0, 0.1);
	  -webkit-transition: .3s all ease-in-out;
	  -o-transition: .3s all ease-in-out;
	  transition: .3s all ease-in-out; }
	  
	.site-mobile-menu .site-mobile-menu-body {
	background: #d3d3d3!important;
	overflow-y: scroll;
	-webkit-overflow-scrolling: touch;
	position: relative;
	padding: 0 20px 20px 20px;
	height: calc(100vh - 52px);
	padding-bottom: 150px; }
	  /* 기본 상단바 끝*/
	  
	/*최하단바 시작*/
	.site-footer {
	  padding: 4em 0;
	  background: #e9e9e9!important; 
	}
	/*최하단바 종료*/
	  
/* 언택 추가 CSS *//* 언택 추가 CSS *//* 언택 추가 CSS */
/* 언택 추가 CSS *//* 언택 추가 CSS *//* 언택 추가 CSS */ 
	 
</style>


  <head>
    <title>방문 예약 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700&display=swap" rel="stylesheet">
	<!-- 아이콘 css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/aos.css">

    <!-- MAIN CSS 다양한 폰트크기보유 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    
    <!-- 언택 CSS -->
    <link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/reservation2.css">
    
    
    
		<!--     데이트피커 ver.1
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
    
    
    
    <!-- 데이트피커 ver.2(bootstrap) -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
		<!-- 데이트피커ver.2(bootstrap_design) -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
    
    <!-- 타임피커 -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
  

      <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>
      
      
    <div class="top-bar">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <a href="#" class=""><span class="mr-2  icon-envelope-open-o"></span> <span class="d-none d-md-inline-block">petsitter@yourdomain.com</span></a>
              <span class="mx-md-2 d-inline-block"></span>
              <a href="#" class=""><span class="mr-2  icon-phone"></span> <span class="d-none d-md-inline-block">1+ (234) 5678 9101</span></a>


              <div class="float-right">
              	<%
              		if(session.getAttribute("id") == null) {
              	%>
                <a href="loginform.me" ><span class = "font-size-14" >로그인 및 회원가입</span></a>
                <span class="mx-md-2 d-inline-block"></span>
                <%} else if(((String)session.getAttribute("id")).contains("@")){ %> <!-- 일반 회원 마이 페이지 -->
                <a href="memberinfo.me?id=${id}"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
                <%} else {%> <!-- 펫시터 마이 페이지 -->
                <a href="petsitterinfo.me?id=${id}"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
                <%} %>
              </div>
              
            </div>
          </div>
        </div>
      </div>
      
      <header class="site-navbar js-sticky-header site-navbar-target" role="banner" style = "background : rgba(83,220,152,0.86);">

        <div class="container">
          <div class="row align-items-center position-relative">
            <div class="site-logo">
              <a href="./home.me"><span class="main_whitefont">보살펴조</span></a>
            </div>

            <div class="col-12">
              <nav class="site-navigation text-right ml-auto " role="navigation">

                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                  <li><a href="home.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">방문 돌봄</a></li>
                  <li><a href="home.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">위탁 돌봄</a></li>
                  <li><a href="home.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">반려동물 전문가 상담</a></li>
                  <li><a href="home.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">후기 게시판</a></li>
                  <li><a href="home.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">공지사항</a></li>
                </ul>
              </nav>

            </div>

            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>
        </div>

      </header>
      
<!-- 본 기능 추가 시작 -->

<!-- top_box 시작 -->      
<!-- 주소 검색 & 예약날짜 & 맞춤조건 등.. 시작-->      
<form name="frm_ins" method="post" enctype="multipart/form-data" target="frm_hiddenFrame" onsubmit="return check_reservation();">
<section class="top_box">
	<div class="container">
	
		<div class="row justify-content-center">
			<div class="col-3">
			</div>
			<div class="col-6">
				<div class="top_box_title">
					<h1 class="top_box_text1">방문 돌봄</h1>
					<p class="top_box_text2">시터가 회원님 집으로 찾아가서 돌봐요!</p>
				</div>
			</div>
			<div class="col-3">
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="col">
				<!-- 주소 검색 시작-->
				<div class="address">
					<h1 class="top_box_text3">어디에 사시나요?</h1>
					<input type="text" id="sample5_address" placeholder="동 이름을 검색하세요 (예:논현동)">
					<input type="button" id="sample5_button"onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
					<div id="map" style="width:80%;height:300px;margin-top:10px;display:none">
					</div>
        </div>
        <!-- 주소 검색 종료-->
			</div>
			
			<div class="col">
				<div class="date">
					<h1 class="top_box_text3">날짜를 설정해주세요!</h1>
					<input type="text" id="datePicker_start" class="form-control" placeholder="방문 날짜">			
				</div>
				<div class="time">
					<h1 class="top_box_text3">시간을 설정해주세요!</h1>
					<input type="text" name="time" class="timepicker" id="timePicker_start" value="00:00">
					<i class="fas fa-arrow-right"></i>
  				<input type="text" name="time" class="timepicker" id="timePicker_end" value="00:00">
				</div>
			</div>
		</div>
				
		<div class="row">
			<div class="col">
				<div class="custom">
					<h1 class="top_box_text4">원하는 조건을 선택해주세요!</h1>
					<input type="button" class="custom_btn" id="custom_btn1" value="픽업 OK!">
					<input type="button" class="custom_btn" id="custom_btn2" value="대형견 OK!">
					<input type="button" class="custom_btn" id="custom_btn3" value="마당 OK!">
					<input type="button" class="custom_btn" id="custom_btn4" value="노견 OK!">
				</div>
			</div>
		</div>
	</div>
</section></form><hr>


<!-- 주소 검색 & 예약날짜 & 맞춤조건 등.. 종료-->      
<!-- top_box 종료 --> 

<!-- middle_box 시작 -->
<!-- 맞춤조건에 의한 펫시터 뷰 시작-->
<section class="middle_box">
	<div class="container">
	
		<div class="row">
			<div class="col">
				<div class="middle_box_title">
					<h1 class="middle_box_text1">모든 펫시터를 만나보세요!</h1>
				</div>
			</div>
			<div class="col">	
				<div class="middle_box_btn">
					<input type="button" class="middle_right_btn" id="newOrder" value="최신순">
					<input type="button" class="middle_right_btn" id="gradeOrder" value="평점순">
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<div class="middle_box_row">
					<div class="middle_box_img"><!--이미지를 background-image로 줌 -->
					</div>	
					<div class="middle_box_view">
						<div class="middle_box_view_start">
							<span class="v_location">서울 서초구 서초1동</span>
							<span class="v_grade"> · 프로 펫시터</span><br>
							<span class="v_title">정성을 다해 사랑으로 돌봐드려요</span>
						</div>
							<div class="middle_box_view_center">
								<span class="v_option" id="option1">반려동물 있어요</span>
								<span class="v_option" id="optionJum"> · </span>
								<span class="v_option" id="option2">마당 있어요</span>
							</div>
							<div class="middle_box_view_end">
								<img class="star" id="star1" src="resources/images/function/star.jpg">
								<img class="star" id="star2" src="resources/images/function/star.jpg">
								<img class="star" id="star3" src="resources/images/function/star.jpg">
								<img class="star" id="star4" src="resources/images/function/star.jpg">
								<img class="starhalf" id="star5" src="resources/images/function/starhalf.jpg">
								<span class="v_review">후기55개</span>
							</div>
						</div>
					</div>
				</div>
			</div><br><br>
			
			<div class="row">
			<div class="col-12">
				<div class="middle_box_row">
					<div class="middle_box_img"><!--이미지를 background-image로 줌 -->
					</div>	
					<div class="middle_box_view">
						<div class="middle_box_view_start">
							<span class="v_location">서울 서초구 서초1동</span>
							<span class="v_grade"> · 프로 펫시터</span><br>
							<span class="v_title">정성을 다해 사랑으로 돌봐드려요</span>
						</div>
							<div class="middle_box_view_center">
								<span class="v_option" id="option1">반려동물 있어요</span>
								<span class="v_option" id="optionJum"> · </span>
								<span class="v_option" id="option2">마당 있어요</span>
							</div>
							<div class="middle_box_view_end">
								<img class="star" id="star1" src="resources/images/function/star.jpg">
								<img class="star" id="star2" src="resources/images/function/star.jpg">
								<img class="star" id="star3" src="resources/images/function/star.jpg">
								<img class="star" id="star4" src="resources/images/function/star.jpg">
								<img class="starhalf" id="star5" src="resources/images/function/starhalf.jpg">
								<span class="v_review">후기55개</span>
							</div>
						</div>
					</div>
				</div>
			</div><br><br>
			
			<div class="row">
			<div class="col-12">
				<div class="middle_box_row">
					<div class="middle_box_img"><!--이미지를 background-image로 줌 -->
					</div>	
					<div class="middle_box_view">
						<div class="middle_box_view_start">
							<span class="v_location">서울 서초구 서초1동</span>
							<span class="v_grade"> · 프로 펫시터</span><br>
							<span class="v_title">정성을 다해 사랑으로 돌봐드려요</span>
						</div>
							<div class="middle_box_view_center">
								<span class="v_option" id="option1">반려동물 있어요</span>
								<span class="v_option" id="optionJum"> · </span>
								<span class="v_option" id="option2">마당 있어요</span>
							</div>
							<div class="middle_box_view_end">
								<img class="star" id="star1" src="resources/images/function/star.jpg">
								<img class="star" id="star2" src="resources/images/function/star.jpg">
								<img class="star" id="star3" src="resources/images/function/star.jpg">
								<img class="star" id="star4" src="resources/images/function/star.jpg">
								<img class="starhalf" id="star5" src="resources/images/function/starhalf.jpg">
								<span class="v_review">후기55개</span>
							</div>
						</div>
					</div>
				</div>
			</div><br><br>
			
			
			
		</div>
</section>

     
<!-- 맞춤조건에 의한 펫시터 뷰 종료-->     
<!-- middle_box 종료 -->





<!-- 본 기능 추가 종료 -->
      
      

      
      <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-7">
                <h2 class="footer-heading mb-4" id="main_grayfont1">About Us</h2>
                <p id="main_grayfont2" style = "font-size : 14px;">반려동물들을 위한 고객과 펫시터와 연결시켜주는 매칭 플렛폼입니다. 신뢰와 안전을 위해 최선을 다하겠습니다.</p>
              </div>
              <div class="col-md-4 ml-auto">
                <h2 class="footer-heading mb-4" id="main_grayfont1">CONTANTS</h2>
                <ul class="list-unstyled">
                  <li><a href="#" id="main_grayfont2" style = "font-size : 14px;">방문 돌봄</a></li>
                  <li><a href="#" id="main_grayfont2" style = "font-size : 14px;">위탁 돌봄</a></li>
                  <li><a href="#" id="main_grayfont2" style = "font-size : 14px;">반려동물 전문가 상담</a></li>
                  <li><a href="#" id="main_grayfont2" style = "font-size : 14px;">후기 게시판</a></li>
                  <li><a href="#" id="main_grayfont2" style = "font-size : 14px;">공지사항</a></li>
                </ul>
              </div>

            </div>
          </div>
          <div class="col-md-4 ml-auto">

            


            <h2 class="footer-heading mb-4" id="main_grayfont1">Follow Us</h2>
            <a href="https://www.facebook.com/" class="smoothscroll pl-0 pr-3" target="_blank"><span class="icon-facebook" id="main_grayfont2" ></span></a>
            <a href="https://twitter.com/" class="pl-3 pr-3" target="_blank"><span class="icon-twitter" id="main_grayfont2" ></span></a>
            <a href="https://www.instagram.com/" class="pl-3 pr-3" target="_blank"><span class="icon-instagram" id="main_grayfont2" ></span></a>
            <a href="https://www.linkedin.com/" class="pl-3 pr-3" target="_blank"><span class="icon-linkedin" id="main_grayfont2" ></span></a>
            </form>
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <div class="border-top pt-5">
              <p id="main_grayfont2">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true" id="main_grayfont2"></i> <a href="https://colorlib.com" target="_blank" id="main_grayfont2">by Colorlib</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
          </div>

        </div>
      </div>
    </footer>
      
      
 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	

    <script src="<c:url value="./resources/js/aos.js"/>"></script><!-- nav 상단바 반응형웹 적용1 -->

    <script src="<c:url value="/resources/js/main.js"/>"></script><!-- nav 상단바 반응형웹 적용2 -->
    
    <!-- 추가!! -->
    <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.sticky.js"/>"></script>  
    
    
    
    <!-- 다음 도로명 주소 -->
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cae553f70e30f760c188181ffee2356d&libraries=services"></script>
		<script>
		    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		        mapOption = {
		            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		            level: 5 // 지도의 확대 레벨
		        };
		
		    //지도를 미리 생성
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //주소-좌표 변환 객체를 생성
		    var geocoder = new daum.maps.services.Geocoder();
		    //마커를 미리 생성
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
		
		
		    function sample5_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수
		
		                // 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("sample5_address").value = addr;
		                // 주소로 상세 정보를 검색
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //첫번째 결과의 값을 활용
		
		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // 지도를 보여준다.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // 지도 중심을 변경한다.
		                        map.setCenter(coords);
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        marker.setPosition(coords)
		                    }
		                });
		            }
		        }).open();
		    }
		</script>

<!-- 데이트피커 ver.1 -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

		<script type="text/javascript">

		$(function(){
    	$("#date1").datepicker();
		});
		</script> -->



<!-- 데이트피커 ver.2 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<!-- 달력(한국어버젼_) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
	
	<!-- 데이트피커 자스코드 -->
	<script type="text/javascript">
		$('#datePicker_start').datepicker({
				format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
				language : "kr", // 언어(<ㅡ js추가필요해서 했음.)
				orientation: "bottom auto"
				
		});
		
		$('#click-btn').on('click', function() { 
				var date = $('#dateRangePicker').val(); //클릭이벤
				alert(date);
		});
	</script>
  
  <script type="text/javascript">
		$('#datePicker_end').datepicker({
				format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
				language : "kr", // 언어(<ㅡ js추가필요해서 했음.)
				orientation: "bottom auto"
		});
		
		$('#click-btn').on('click', function() { 
				var date = $('#dateRangePicker').val(); //클릭이벤
				alert(date);
		});
	</script>    
	
	

	

<!-- 타임피커 ver.1 -->
<script src="${pageContext.servletContext.contextPath}/resources/js//jquery-1.8.3.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/jquery/jquery-ui.js?version=1.3"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<!-- 타임피커 자스코드 -->
	<script type="text/javascript">
	$('.timepicker').timepicker({
	    timeFormat: 'p h:mm',
	    interval: 60,
	    minTime: '09',
	    maxTime: '11:00pm',
	    defaultTime: '14',
	    startTime: '00:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	</script>

<!-- 아이콘 -->   
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>  


<!-- 원하는 조건 선택시 버튼 색상 변화-->
<script>
       var btn1 = document.getElementById("custom_btn1");
      		 btn1.addEventListener("click", function() {
       			
	       			if(btn1.style.background === "rgb(83, 220, 152)"){
	       				btn1.style.background = "rgb(0, 200, 83)";
	       			} else if(btn1.style.background === "rgb(0, 200, 83)") {
	       				btn1.style.background = "rgb(83, 220, 152)";
	       			} else {
	       				btn1.style.background = "rgb(0, 200, 83)";
	       			}
       			});
      		 
      		 
             var btn2 = document.getElementById("custom_btn2");
      					 btn2.addEventListener("click", function() {
       			
	       			if(btn2.style.background === "rgb(83, 220, 152)"){
	       				btn2.style.background = "rgb(0, 200, 83)";
	       			} else if(btn2.style.background === "rgb(0, 200, 83)") {
	       				btn2.style.background = "rgb(83, 220, 152)";
	       			} else {
	       				btn2.style.background = "rgb(0, 200, 83)";
	       			}
       			});
      		 
             var btn3 = document.getElementById("custom_btn3");
      		 			 btn3.addEventListener("click", function() {
       			
	       			if(btn3.style.background === "rgb(83, 220, 152)"){
	       				btn3.style.background = "rgb(0, 200, 83)";
	       			} else if(btn3.style.background === "rgb(0, 200, 83)") {
	       				btn3.style.background = "rgb(83, 220, 152)";
	       			} else {
	       				btn3.style.background = "rgb(0, 200, 83)";
	       			}
       			});
      		 
             var btn4 = document.getElementById("custom_btn4");
      		 			 btn4.addEventListener("click", function() {
       			
	       			if(btn4.style.background === "rgb(83, 220, 152)"){
	       				btn4.style.background = "rgb(0, 200, 83)";
	       			} else if(btn4.style.background === "rgb(0, 200, 83)") {
	       				btn4.style.background = "rgb(83, 220, 152)";
	       			} else {
	       				btn4.style.background = "rgb(0, 200, 83)";
	       			}
       			});
</script>

<!-- 최신순, 평점순 -->
<script>
	
	var btn5 = document.getElementById("newOrder");
		 btn5.addEventListener("click", function() {
	
	if(btn5.style.background === "rgb(83, 220, 152)"){
		btn5.style.background = "rgb(0, 200, 83)";
	} else if(btn5.style.background === "rgb(0, 200, 83)") {
		btn5.style.background = "rgb(83, 220, 152)";
	} else {
		btn5.style.background = "rgb(0, 200, 83)";
	}
	});
		 
		 var btn6 = document.getElementById("gradeOrder");
		 btn6.addEventListener("click", function() {
	
	if(btn6.style.background === "rgb(83, 220, 152)"){
		btn6.style.background = "rgb(0, 200, 83)";
	} else if(btn6.style.background === "rgb(0, 200, 83)") {
		btn6.style.background = "rgb(83, 220, 152)";
	} else {
		btn6.style.background = "rgb(0, 200, 83)";
	}
	});	 
	
</script>


   
      
      
      
      



</body>
</html>