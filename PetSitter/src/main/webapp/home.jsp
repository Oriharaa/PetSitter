<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">


<style>


.ftco-cover-2 {
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
  position: relative;
  overflow: hidden; }
  .ftco-cover-2, .ftco-cover-2 .container > .row {
    height: 80vh;
    }
  .ftco-cover-2 > .container {
    position: relative; }
  .ftco-cover-2.overlay2 {
    position: relative; }
    .ftco-cover-2.overlay2:before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      opacity: .15;
      background: rgba(55,122,255,0)!important;
      background: -moz-linear-gradient(45deg, #377aff 0%, #00d9ff 100%);
      background: -webkit-gradient(left bottom, right top, color-stop(0%, #377aff), color-stop(100%, #00d9ff));
      background: -webkit-linear-gradient(45deg, #377aff 0%, #00d9ff 100%);
      background: -o-linear-gradient(45deg, #377aff 0%, #00d9ff 100%);
      background: -ms-linear-gradient(45deg, #377aff 0%, #00d9ff 100%);
      background: linear-gradient(45deg, #377aff 0%, #00d9ff 100%);
      filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#377aff', endColorstr='#00d9ff', GradientType=1); }
    .ftco-cover-2.overlay2 h1 {
      color: #fff; }
    .ftco-cover-2.overlay2 p {
      color: #fff; }
      .ftco-cover-2.overlay2 p a {
        color: #fff;
        text-decoration: underline;
        font-weight: 700; }
        .ftco-cover-2.overlay2 p a:hover {
          text-decoration: none; }
    .ftco-cover-2.overlay2 form .form-control,
    .ftco-cover-2.overlay2 form .btn {
      height: 55px;
      border-radius: 4px; }
    .ftco-cover-2.overlay2 form .form-control {
      padding-left: 20px;
      padding-right: 20px;
      border-color: transparent;
      margin-right: 10px; }
    .ftco-cover-2.overlay2 form .btn {
      border-color: transparent; }
   


#main-circle{
background-color:black; 
width : 400px; 
height : 400px; 
margin-right:50px;
border-radius:400px

}

	
</style>
	
	
  <head>
    <title>펫시터 홈페이지</title>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/petsitter-style.css">
  </head>


<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<div class="site-wrap" id="home-section">

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
              <a href="#" class=""><span class="mr-2  icon-envelope-open-o"></span> <span class="d-none d-md-inline-block">petsitter@naver.com</span></a>
              <span class="mx-md-2 d-inline-block"></span>
              <a href="#" class=""><span class="mr-2  icon-phone"></span> <span class="d-none d-md-inline-block">(02).2010.1010</span></a>

              <div class="float-right" style="margin-bottom:8px;">
              	<%
              		if(session.getAttribute("id") == null) {
              	%>
                <a href="loginform.me" ><span class = "font-size-14" >로그인 & 회원가입</span></a>
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
      <header class="site-navbar js-sticky-header site-navbar-target" role="banner" style = "background : rgba(83,220,152,0.86);">
        <div class="container" >
          <div class="row align-items-center position-relative" >
            <div class="site-logo">
              <a href="home.me" ><span class="main_whitefont">PET SITTER</span></a>
            </div>

	            <div class="col-12">
	              <nav class="site-navigation text-right ml-auto " role="navigation" >
	                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
	                  <li><a href="reservation2.br" class="nav-link" id="main_whitefont2" style = "font-size:15px">방문 돌봄</a></li>
	                  <li><a href="reservation1.br" class="nav-link" id="main_whitefont2" style = "font-size:15px">위탁 돌봄</a></li>
	                  <li><a href="home.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">반려동물 전문가 상담</a></li>
	                  <li><a href="postscript_board.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">후기 게시판</a></li>
	                  <li><a href="home.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">공지사항</a></li> 
	                </ul>
	              </nav>
	            </div>
            
            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>
          </div>
        </div>
      </header>
		

<!-- 강아지 이미지 메인 시작 -->	
<div style = "height : 960px;">
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	

  
  <div class="carousel-inner">
    <div class="carousel-item active" style = "background : rgba(254,175,18,0.2); height : 960px;">
    
	    <div class="ftco-blocks-cover-1">
			  <div class="container">
			    <div class = "row">
	        	<div class="col-md-7 ftco-cover-2 overlay2" style="background-image: url('resources/images/maindog2.png');"></div>
	    	      <div class="col-md-5">
	    	        	<img src ="resources/images/dogmark.png"  width = "110px" height = "80px" style = "margin-top : 50%; margin-left:36%; opacity: 0.7;" />
	    	        		
	    	        	<div class="col-12 font-size-14 text-center" id="main_grayfont2">주거하는 곳을 입력하시면 가까운 펫시터를 연결해드립니다!</div>
	                <p/>
	                <p class="col-12 font-size-14 text-center" style = " color : orange!important;">반경 5km내에 펫시터 정보를 알 수 있습니다.</p>
	                <form action="#">
	                <div class="form-group d-flex">
	                	<input class="form-control" type="text"  id="sample5_address"  placeholder="주소를 입력하세요" >
	                  <input type="button" class="btn btn-outline-warning px-4" onclick="sample5_execDaumPostcode(); location.href='#mapgo';" value="주소 검색 " >
	                </div>
	                </form>
	                
	             
	    	      </div>
	    	    </div>
	    	  </div>
	      </div>
		</div>
		
		<div class="carousel-item" style = "background : rgba(209,192,191,1); height : 960px;">
	    <div class="ftco-blocks-cover-1">
			  <div class="container">
			    <div class = "row">
	        	<div class="col-md-7 ftco-cover-2 overlay2" style="background-image: url('resources/images/maindog3.png');"></div>
	    	      <div class="col-md-5">
	    	       			<a href = "#"><p class="col-16 font-size-20 text-center" style = "margin-top : 48%; font-weight : bold; color :  rgba(240,86,30);important;">공지사항 바로가기!</p></a>
										<div class="col-12 font-size-14 text-center font-gray-8" id="" style = "font-weight : bold;">코로나 안전수칙 철저하게 지켜드립니다.</div>
	                  <p/>
	                  <div style = "background : #a0a0a0; border-radius : 10px 10px 50px 10px; width : 100%; height : 220px; margin-left:2%;">
	                    <br/>
	                    <a href = "#">
	                    	<p class="col-12 font-size-20 text-center" style = "font-weight : bold; color : orange!important;">공지사항 : 코로나 관련 규칙 조항.</p>
	                   	  <p class="col-12 font-size-14 text-center" style = " color : white!important;">1.마스크 착용 근무 실시.</p>
	                   		<p class="col-12 font-size-14 text-center" style = " color : white!important;">2.틈틈히 바른 손씻기 및 손세정제 사용.</p>
	                   		<p class="col-12 font-size-14 text-center" style = " color : white!important;">3.감기증상이 있을시 예약 중지 및 조치.</p>
	                    </a>
	                  </div>
	               
	    	      </div>
	    	    </div>
	    	  </div>
	      </div>
		</div>

</div>
	</div>
	
	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span  aria-hidden="true">
    	<img  src="resources/images/leftarrow.png" width = "35px" height = "60px"></img>
    </span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span aria-hidden="true">
    	<img  src="resources/images/rightarrow.png" width = "35px" height = "60px"></img>
    </span>
    <span class="sr-only">Next</span>
  </a>
</div>	

<!-- 강아지 이미지 메인 종료-->

</div>
      	<div id ="mapgo" style = "width : 200px; height : 1px;"></div>       
        <div style = "width : 200px; height : 20px;"></div>
<br/><br/>     
         <!-- Map -->
         
         <div id="map" style="margin:0 auto; text-align:center; width:1110px;height:500px;display:none"></div>
        <!-- END .ftco-cover-1 -->
<!-- 주소 입력 -->
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24e91ec8fe5a3a10070597915f67d6ba&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption); //
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
                geocoder.addressSearch(data.address, function(results, status) { //
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



<!-- 소개부분 시작 -->
<div class="block__73694 site-section border-top  id="why-us-section" style = "margin : 25px 0 0 0;">
        <div class="container">
          <div class="row d-flex no-gutters align-items-stretch">

            <div class="col-12 col-lg-6 block__73422 order-lg-2" style="background-image: url('resources/images/dog02.jpg');" data-aos="fade-left" data-aos-delay=""></div>
            <div class="col-lg-6 mr-auto p-lg-5 mt-4 mt-lg-0 order-lg-1" data-aos="fade-right" data-aos-delay="">
              <h2 class="mb-4 main_mintfont" style = "font-weight : bold">pet ssiter</h2>
              <p class = "text-center main_mintfont" style="font-weight : bold;">저희 보살펴조에서는 신뢰있는 서비스를 위해 펫시터를 선별 및 지원하고 있습니다. 아래 조건들을 약속하겠습니다!</p>

              <ul class="ul-check primary list-unstyled mt-5 font-size-14 text-center">
                <li>보살펴조만의 애완동물 보험제도를 제공합니다.</li>
                <p/>
                <li>자격증을 소유한 펫시터를 선별합니다.</li>
                <p/>
                <li>펫시터의 발전을 위해 1년의 한번 프로그램을 수료해야합니다.</li>
                <p/>
                <li>애완동물은 코로나19의  전염성이거의 없지만 보살펴조만의 여러 조항으로 예방에 힘을 씁니다.</li>
                <p/>
                <li>약 복용법 및 의료 기기 사용법을 숙지합니다.</li>
              </ul>
            </div>
          </div>
        </div>
</div>


<!-- 소개부분 종료 -->



<!-- 게시판 목록부분 시작 -->
<div class="site-section bg-light">
	<div class="container">
		<div class="row mb-6 justify-content-center">
			<div class="col-md-6 text-center">
				<div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
					<h1 style = "background: rgba(83,220,152,0.86); color : white; border-radius : 10px 10px 3px 3px">main service</h1>
					<p>보살펴조 플랫폼 주 컨텐츠입니다. 필요한 서비스를 선택하세요!</p>
				</div>
			</div>
		</div>
	</div>
</div>
		   
        <div class=" ftco-service-image-1 pb-5 bg-light">
          <div class="container">
            <div class="owl-carousel owl-all">
              <div class="service text-center">
                <a href="#"><img src="resources/images/petsitter-find.jpg" alt="Image" class="img-fluid"></a>
                <div class="px-md-3">
                  <h3><a href="#" style = "color : rgba(83,220,152)!important; font-weight : bold; " >펫시터 찾기.</a></h3>
                  <p style = "font-size:14px;">고객과 가깝고 적합한 펫시터를 찾을 수 있어요!</p>
                </div>
              </div>
              <div class="service text-center">
                <a href="#"><img src="resources/images/dog-doctor.png" alt="Image" class="img-fluid"></a>
                <div class="px-md-3">
                  <h3><a href="#" style = "color : rgba(83,220,152)!important; font-weight : bold;" >반려동물 전문가 상담.</a></h3>
                  <p style = "font-size:14px;">전문적인 수의사, 훈련사 님들이 실시간으로 상담해주는 커뮤니티 공간입니다.!</p>
                  
                </div>
              </div>
              <div class="service text-center">
                <a href="#"><img src="resources/images/petsitter-com.jpg" alt="Image" class="img-fluid"></a>
                <div class="px-md-3">
                  <h3><a href="#" style = "color : rgba(83,220,152)!important; font-weight : bold;" >생생한 펫시터 이용후기.</a></h3>
                  <p style = "font-size:14px;">솔직하고 담백한 실시간 이용후기!</p>
                </div>
              </div>
            </div>
          </div>
        </div>
<!-- 게시판 목록부분 끝 -->

<!-- 이달의 추천 펫시터 부분 시작 -->
		<div class="site-section" id="team-section" style ="height : 1080px;">
        <div class="container">
          <div class="row mb-5 justify-content-center">
            <div class="col-md-7 text-center">
              <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
                <h1 class="main_violetfont2" style = "border-bottom:thick double;">이달의 펫시터 추천.</h1>
                <p>달마다 신뢰가는 펫시터분들을 추천 해드립니다. 가까운 펫시터분이있는지 확인해보세요!</p>
              </div>
            </div>
          </div>

          <div class="owl-carousel owl-all mb-5">
            <div class="block-team-member-1 text-center rounded h-100">
              <figure>
               <a href="#"><img src="resources/images/dog01.jpg" alt="Image" class="img-fluid rounded-circle"></a>
              </figure>
              <a href="#"><h3 class="font-size-20 text-black">이름</h3></a>
              <span class="d-block font-gray-9 letter-spacing-1 text-uppercase font-size-14 mb-3">지역</span>
              <a href="#"><p class="mb-4" style = "color : #949494!important;">자기소개 자유롭게</p></a>
              <div class=" main_whitefont" style = "background : rgba(134,127,160); border-radius : 7px 7px 7px 7px">추천 신규 펫시터.</div>
            </div>
            
            <div class="block-team-member-1 text-center rounded h-100">
              <figure>
               <a href="#"><img src="resources/images/dog01.jpg" alt="Image" class="img-fluid rounded-circle"></a>
              </figure>
              <a href="#"><h3 class="font-size-20 text-black">이름</h3></a>
              <span class="d-block font-gray-9 letter-spacing-1 text-uppercase font-size-14 mb-3">지역</span>
              <a href="#"><p class="mb-4" style = "color : #949494!important;">자기소개 자유롭게</p></a>
              <div class=" main_whitefont" style = "background : rgba(134,127,160); border-radius : 7px 7px 7px 7px;">추천 신규 펫시터.</div>
            </div>

            <div class="block-team-member-1 text-center rounded h-100">
              <figure>
               <a href="#"><img src="resources/images/dog01.jpg" alt="Image" class="img-fluid rounded-circle"></a>
              </figure>
              <a href="#"><h3 class="font-size-20 text-black">이름</h3></a>
              <span class="d-block font-gray-9 letter-spacing-1 text-uppercase font-size-14 mb-3">지역</span>
              <a href="#"><p class="mb-4" style = "color : #949494!important;">자기소개 자유롭게</p></a>
              <div class=" main_whitefont" style = "background : rgba(134,127,160); border-radius : 7px 7px 7px 7px">이달의 추천  펫시터.</div>
            </div>

            <div class="block-team-member-1 text-center rounded h-100">
              <figure>
               <a href="#"><img src="resources/images/dog01.jpg" alt="Image" class="img-fluid rounded-circle"></a>
              </figure>
              <a href="#"><h3 class="font-size-20 text-black">이름</h3></a>
              <span class="d-block font-gray-9 letter-spacing-1 text-uppercase font-size-14 mb-3">지역</span>
              <a href="#"><p class="mb-4" style = "color : #949494!important;">자기소개 자유롭게</p></a>
              <div class=" main_whitefont" style = "background : rgba(134,127,160); border-radius : 7px 7px 7px 7px">이달의 추천 펫시터.</div>
            </div>
            
            <div class="block-team-member-1 text-center rounded h-100">
              <figure>
               <a href="#"><img src="resources/images/dog01.jpg" alt="Image" class="img-fluid rounded-circle"></a>
              </figure>
              <a href="#"><h3 class="font-size-20 text-black">이름</h3></a>
              <span class="d-block font-gray-9 letter-spacing-1 text-uppercase font-size-14 mb-3">지역</span>
              <a href="#"><p class="mb-4" style = "color : #949494!important;">자기소개 자유롭게</p></a>
              <div class=" main_whitefont" style = "background : rgba(134,127,160); border-radius : 7px 7px 7px 7px">이달의 평점왕 .</div>
            </div>
            
            <div class="block-team-member-1 text-center rounded h-100">
              <figure>
               <a href="#"><img src="resources/images/dog01.jpg" alt="Image" class="img-fluid rounded-circle"></a>
              </figure>
              <a href="#"><h3 class="font-size-20 text-black">이름</h3></a>
              <span class="d-block font-gray-9 letter-spacing-1 text-uppercase font-size-14 mb-3">지역</span>
              <a href="#"><p class="mb-4" style = "color : #949494!important;">자기소개 자유롭게</p></a>
              <div class=" main_whitefont" style = "background : rgba(134,127,160); border-radius : 7px 7px 7px 7px">이달의 실적 왕 .</div>
            </div>
            
          
            
            
            
        </div>
      </div>
    </div>
<!-- 추천 펫시터 부분 종료 -->


<!-- 영상부분 시작 -->
      <div class="site-section bg-light" id="about-section" style = "margin : 0 0 0 0">
 
        <div class="site-section" style = "padding : 50px;">
					<div class="container">
						<div class="row mb-6 justify-content-center">
							<div class="col-md-6 text-center">
								<div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
									<h2 class="footer-heading" style = "background: rgba(83,220,152,0.86); color : white; border-radius : 10px 10px 3px 3px">About Us</h2>
									<p>petsitter 소개 영상입니다!</p>
								</div>
							</div>
						</div>
					</div>
				</div>

      </div>



      <div class="site-section bg-light" id="about-section" style ="height : 1000px;">
        <div class="container">
          <div class="row justify-content-center mb-4 block-img-video-1-wrap">
            <div class="col-md-12 mb-5">
              <figure class="block-img-video-1" data-aos="fade">
                <a href="https://www.youtube.com/watch?v=oXynEv6lYGE" data-fancybox data-ratio="2">
                <span class="icon"><span class="icon-play"></span></span>
                <img src="resources/images/petsitter-video.jpg" alt="Image" class="img-fluid">
              </a>
              </figure>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="row">
                <div class="col-6 col-md-6 mb-4 col-lg-0 col-lg-3" data-aos="fade-up" data-aos-delay="">
                  <div class="block-counter-1">
                    <span class="number main_mintfont"><span data-number="140">0</span>+</span>
                    <span class="caption">이달의 펫시터 연결</span>
                  </div>
                </div>
                <!-- data-number 부분에 DB로 업데이트 되게 설정 -->
                <div class="col-6 col-md-6 mb-4 col-lg-0 col-lg-3" data-aos="fade-up" data-aos-delay="100">
                  <div class="block-counter-1">
                    <span class="number main_mintfont"><span data-number="322">0</span>+</span>
                    <span class="caption">등록된 신뢰가는 펫시터</span>
                  </div>
                </div>
                <div class="col-6 col-md-6 mb-4 col-lg-0 col-lg-3" data-aos="fade-up" data-aos-delay="200">
                  <div class="block-counter-1">
                    <span class="number main_mintfont"><span data-number="1125">0</span>+</span>
                    <span class="caption">올해의 펫시터 연결</span>
                  </div>
                </div>
                <div class="col-6 col-md-6 mb-4 col-lg-0 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                  <div class="block-counter-1">
                    <span class="number main_mintfont"><span data-number="1452">0</span>+</span>
                    <span class="caption">총 누적 펫시터 연결</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
<!-- 영상부분 종료 -->
      


	<!-- 하단 바 시작 -->
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-7">
                <h2 class="footer-heading mb-4" id="main_grayfont1">About Us</h2>
                <p id="main_grayfont2" style = "font-size : 14px;">반려동물들을 위해 고객과 펫시터와를 연결시켜주는 매칭 플렛폼입니다. 신뢰와 안전을 위해 최선을 다하겠습니다.</p>
              </div>
              <div class="col-md-4 ml-auto">
                <h2 class="footer-heading mb-4" id="main_grayfont1">CONTANTS</h2>
                <ul class="list-unstyled">
                  <li><a href="#" id="main_grayfont2" style = "font-size : 14px;">방문 돌봄</a></li>
                  <li><a href="#" id="main_grayfont2" style = "font-size : 14px;">위탁 돌봄</a></li>
                  <li><a href="#" id="main_grayfont2" style = "font-size : 14px;">반려동물 전문가 상담</a></li>
                  <li><a href="/review_board.bo" id="main_grayfont2" style = "font-size : 14px;">후기 게시판</a></li>
                  <li><a href="#" id="main_grayfont2" style = "font-size : 14px;">공지사항</a></li>
                </ul>
              </div>

            </div>
          </div>
          <div class="col-md-4 ml-auto">

            


            <h2 class="footer-heading mb-4" id="main_grayfont1" >Follow Us</h2>
            <a href="https://www.facebook.com/" class="smoothscroll pl-0 pr-3" target="_blank"><span class="icon-facebook" id="main_grayfont2"></span></a>
            <a href="https://twitter.com/" class="pl-3 pr-3" target="_blank"><span class="icon-twitter" id="main_grayfont2"></span></a>
            <a href="https://www.instagram.com/" class="pl-3 pr-3" target="_blank"><span class="icon-instagram" id="main_grayfont2" ></span></a>
            <a href="https://www.linkedin.com/" class="pl-3 pr-3" target="_blank"><span class="icon-linkedin" id="main_grayfont2" ></span></a>
           
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
	<!-- 하단 바 종료 -->
    

    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/popper.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.sticky.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.fancybox.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
    <script src="<c:url value="./resources/js/aos.js"/>"></script>

    <script src="<c:url value="/resources/js/main.js"/>"></script>


</body>

</html>
