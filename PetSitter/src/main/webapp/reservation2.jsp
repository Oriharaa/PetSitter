<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.PetsitterVO" %>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	PetsitterVO petsittervo = (PetsitterVO)request.getAttribute("petsittervo");
	ArrayList<PetsitterVO> petsitterlist = (ArrayList<PetsitterVO>)request.getAttribute("petsitterlist");
	ArrayList<UsinglistVO> usinglist = (ArrayList<UsinglistVO>)request.getAttribute("usinglist");

%>


<!-- 위탁 돌봄 -->
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

	/*ajax 에서 사진 가운데 와 크기 지정 css 시작*/
	.thumbnail-wrappper { 
	width: 390px !important; 
	} 
	.thumbnail { 
	position: relative; 
	width : 390px;
	height : 250px;
	background : rgba(94,94,94,0.3);
	overflow: hidden; 
	margin-bottom : 4px;
	border-radius : 3px;
	} 
	.thumbnail .centered { 
	position: absolute; 
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0; 
	-webkit-transform: translate(50%,50%); 
	-ms-transform: translate(50%,50%); 
	transform: translate(50%,50%); 
	} 
	
	.thumbnail .centered img { 
	position: absolute; 
	top: 0; 
	left: 0; 
	max-width: auto; 
	max-height: auto; 
	height: auto; 
	-webkit-transform: translate(-50%,-50%); 
	-ms-transform: translate(-50%,-50%);
	 transform: translate(-50%,-50%); 
	 }
	 
	 
	.thumbnail02 { 
	position: relative; 
	width : 60px;
	height : 60px;
	background : rgba(94,94,94,0.3);
	overflow: hidden; 
	margin-bottom : 4px;
	border-radius : 30px;
	} 
	.thumbnail02 .centered02 { 
	position: relative; 
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0; 
	-webkit-transform: translate(50%,50%); 
	-ms-transform: translate(50%,50%); 
	transform: translate(50%,50%); 
	} 
	
	.thumbnail02 .centered02 img { 
	position: absolute; 
	top: 0; 
	left: 0; 
	max-width: 60px; 
	max-height: auto; 
	height: 60px; 
	-webkit-transform: translate(-50%,-50%); 
	-ms-transform: translate(-50%,-50%);
	 transform: translate(-50%,-50%); 
	 }
	 
	/*ajax 에서 사진 가운데 와 크기 지정 css 종료*/
	
	/*carousel 고정 높이 조정*/
	.slide {
  height: 266px!important;
  min-height: 266px!important;
  background-size: cover;
	}
	
	/*carousel 위치 보여주는 아이콘 바 설정*/
	.carousel-indicators li {
   box-sizing: content-box;
   -ms-flex: 0 1 auto;
   flex: 0 1 auto;
   width: 18px!important;
   height: 3px;
   margin-right: 1.5px!important;
   margin-left: 1.5px!important;
   text-indent: -999px;
   cursor: pointer;
   background-color: #fff;
   background-clip: padding-box;
   border-top: 10px solid transparent;
   border-bottom: 10px solid transparent;
   opacity: .5;
   transition: opacity .6s ease;
   }

	a#MOVE_TOP_BTN {
   	/* position : 화면에 고정
		right, bottom : 버튼의 위치 설정
		display : 화면에서 숨김
		z-index : 다른 태그들보다 위로 오도록 설정(z-index 가 설정된 다른 태그가 있다면 그 태그보다 커야 함)
		*/
		background: rgb(83, 220, 152);
		color : white;
		width : 90px;
		height : 40px;
    position: fixed; 
    padding : 7px 0 0 30.8px;
    border-radius : 22px;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
	}
	
</style>


  <head>
    <title>방문 돌봄 예약 페이지</title>
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
    
    
		<!--  언택 추가 CSS -->
		<link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/reservation2.css?after">
		 

    
    <!-- 데이트피커 ver.2(bootstrap) -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
		<!-- 데이트피커ver.2(bootstrap_design) -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
    
    <!-- 타임피커 -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    
	<style>
		.dropdown:hover {
			background-color: rgb(83, 220, 153);
		}
		
		.dropdown:active {
			background-color: rgb(83, 220, 153);
		}
		.btn-secondary {
			background-color: rgb(83, 220, 153);
			border-color: rgb(83, 220, 153);
			vertical-align: baseline;
			font-weight: bold;
		}
		
		.btn-secondary:hover {
			background-color: rgb(83, 220, 153);
			border-color: rgb(83, 220, 153);
		}
		
		.btn-secondary:active {
			background-color: rgb(83, 220, 153);
			border-color: rgb(83, 220, 153);
		}
		
		.btn-secondary:focus {
			background-color: rgb(83, 220, 153);
			border-color: rgb(83, 220, 153);
			box-shadow: 0 0 0 0 rgb(83, 220, 153);
		}
		
		.dropdown-menu {
			min-width: 60px !important;
		}
	
		.dropdown-item:hover {
			background-color: rgb(83, 220, 153);
			color: rgb(255, 255, 255) !important;
		}
		
		.dropdown-item {
			 color: #53dc99 !important;
			 font-weight: bold;
		}
		
		.main-menu li a {
			font-weight: bold;
		}
	</style>
    
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
                <a href="loginform.me" ><span class = "font-size-14" >로그인 &amp; 회원가입</span></a>
                <span class="mx-md-2 d-inline-block"></span>
                <%} else if(!((String)session.getAttribute("rank")).contains("admin") && ((String)session.getAttribute("id")).contains("@")) { %> <!-- 일반 회원 마이 페이지 -->
                <a href="memberinfo.me"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
                <%} else if(((String)session.getAttribute("id")).contains("admin")) {%>
                <a href="admin.me"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
                <%} else {%> <!-- 펫시터 마이 페이지 -->
                <a href="petsitterinfo.me"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
                <%} %>
              </div>
              
            </div>
          </div>
        </div>
      </div>
      
      <header class="site-navbar js-sticky-header site-navbar-target" role="banner" style = "background : rgba(83,220,152);">

        <div class="container">
          <div class="row align-items-center position-relative">
            <div class="site-logo">
              <a href="./home.me"><span class="main_whitefont">보살펴조</span></a>
            </div>

            <div class="col-12">
              <nav class="site-navigation text-right ml-auto " role="navigation">

                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                  <li class="dropdown" onmousedown="this.style.backgroundColor='rgb(83, 220, 153)'">
									  <button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onmousedown="this.style.backgroundColor='rgb(83, 220, 153)'">
											돌봄
									  </button>
									  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" >
									    <a href="reservation2.br" class="dropdown-item" style="font-size:15px;">방문 돌봄</a>
                  		<a href="reservation1.br" class="dropdown-item" style="font-size:15px;" >위탁 돌봄</a>
									  </div>
									</li>
									<li class="dropdown">
									  <button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
											게시판
									  </button>
									  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" >
									    <a href="proboard.bo" class="dropdown-item" style="font-size:15px;" >전문가 상담 게시판</a>
                  		<a href="mboardlist.me" class="dropdown-item" style="font-size:15px;" >회원 게시판</a>
                  		<a href="pqboardlist.me" class="dropdown-item" style="font-size:15px;" >펫시터 게시판</a>
									  </div>
									</li>
                  <li><a href="review_board.bo" class="nav-link" id="main_whitefont2" style = "font-size:15px">이용 후기</a></li>
                  <li><a href="noticeboardlist.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">공지사항</a></li> 
                </ul>
              </nav>

            </div>

            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>
        </div>
				<!-- 스크롤 위로올라가기 버튼 html-->
        <a id="MOVE_TOP_BTN" href="#">TOP</a>
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
					<p class="top_box_text2">시터가 회원님 집으로 방문하여 돌봐드립니다!</p>	
				</div>
			</div>
			<div class="col-3">
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="col">
				<div class="date">
					<h1 class="top_box_text3">날짜를 설정해주세요!</h1>
					<input type="text" id="datePicker_start" class="form-control" placeholder="시작 날짜">
				</div>
			</div>
			<div class="col">	
				<div class="time">
					<h1 class="top_box_text3">시간을 설정해주세요!</h1>
					<input type="text" name="time" class="timepicker" id="timePicker_start">
					<i class="fas fa-arrow-right"></i>
  				<input type="text" name="time" class="timepicker" id="timePicker_end">
				</div>
			</div>
		</div>
		
		<!-- 지역 선택 필터 -->
		<div class="row">
			<div class="col">
				<div class="address">
					<h1 class="top_box_text4">원하는 지역을 한군데 선택해주세요!</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="fuckyou">
					<label for="area_ck1" class="area_lb" id="area_lb1"> 서울/경기</label>
						<input type="checkbox" name="area" id="area_ck1" value="서울/경기" class="hide" />
					<label for="area_ck2" class="area_lb" id="area_lb2"> 인천</label>
						<input type="checkbox" name="area" id="area_ck2" value="인천" class="hide" />
					<label for="area_ck3" class="area_lb" id="area_lb3"> 강원</label>
						<input type="checkbox" name="area" id="area_ck3" value="강원" class="hide" />
					<label for="area_ck4" class="area_lb" id="area_lb4"> 부산/울산/경남</label>
						<input type="checkbox" name="area" id="area_ck4" value="부산/울산/경남" class="hide" />
					<label for="area_ck5" class="area_lb" id="area_lb5"> 대구/경북</label>
						<input type="checkbox" name="area" id="area_ck5" value="대구/경북" class="hide" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="fuckyou">
					<label for="area_ck6" class="area_lb" id="area_lb6"> 전북</label>
						<input type="checkbox" name="area" id="area_ck6" value="전북" class="hide" />
					<label for="area_ck7" class="area_lb" id="area_lb7"> 광주/전남</label>
						<input type="checkbox" name="area" id="area_ck7" value="광주/전남" class="hide" />
					<label for="area_ck8" class="area_lb" id="area_lb8"> 충북</label>
						<input type="checkbox" name="area" id="area_ck8" value="충북" class="hide" />
					<label for="area_ck9" class="area_lb" id="area_lb9"> 대전/충남</label>
						<input type="checkbox" name="area" id="area_ck9" value="대전/충남" class="hide" />
					<label for="area_ck10" class="area_lb" id="area_lb10"> 제주</label>
						<input type="checkbox" name="area" id="area_ck10" value="제주" class="hide" />
				</div>
			</div>
		</div>
		
		<!-- 픽업, 대형견, 마당, 노견 조건 필터 -->
		<div class ="row">
			<div class="col">
				<div class="custom">
					<h1 class="top_box_text4">원하는 조건을 선택해주세요!</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="fuckyou">
					<label for="custom_ck1" class="custom_lb" id="custom_lb1"> 픽업 </label> 
						<input type="checkbox" name="custom" id="custom_ck1" value="픽업" class="hide"/>
					<label for="custom_ck2" class="custom_lb" id="custom_lb2"> 대형견</label>
						<input type="checkbox" name="custom" id="custom_ck2" value="대형견" class="hide" />
					<label for="custom_ck3" class="custom_lb" id="custom_lb3"> 마당 </label> 
						<input type="checkbox" name="custom" id="custom_ck3" value="마당"  class="hide" />
				  <label for="custom_ck4" class="custom_lb" id="custom_lb4"> 노견 </label> 
				  	<input type="checkbox" name="custom" id="custom_ck4" value="대형견" class="hide"/>
				</div>
			</div>
		</div>
		
			
	</div>
</section></form>




<!-- 예약날짜 & 맞춤조건 등.. 종료-->      
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
		  		<label for="order_ck1" class="order_lb" id="order_lb1">최신순</label>
		  			<input type="radio" name="order" id="order_ck1" value="최신순" class="hide" />
		  		<label for="order_ck2" class="order_lb" id="order_lb2">평점순</label>
						<input type="radio" name="order" id="order_ck2" value="평점순" class="hide" />
				</div>
			</div>
		</div>

		
		
		<div class="row" id="petsitter_middle_box">
			
		</div></div><br><br>
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

            

						<form>
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
    <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
	

    <script src="<c:url value="./resources/js/aos.js"/>"></script><!-- nav 상단바 반응형웹 적용1 -->

    <script src="<c:url value="/resources/js/main.js"/>"></script><!-- nav 상단바 반응형웹 적용2 -->
    
    <!-- 추가!! -->
    <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.sticky.js"/>"></script>  
  

  
<!--
		★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		★★★★★★★★★★★★★★★★★★★★★기능구현 JS★★★★★★★★★★★★★★★★★★★★★
		★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
-->
	<script src="<c:url value="/resources/js/UT_JS/reservation_color.js"/>"></script>
  <script src="<c:url value="/resources/js/UT_JS/reservation_view2.js"/>"></script>
<!--
		★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		★★★★★★★★★★★★★★★★★★★★★기능구현 JS★★★★★★★★★★★★★★★★★★★★★
		★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
--> 

<!-- 아이콘 -->   
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>  
	
<!-- 데이트피커 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<!-- 달력(한국어버젼_) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
	
<!-- 타임피커 -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>	
	
	
	
	
<!-- 데이트피커 자스코드 -->
<!-- 시작날짜 -->
	<script type="text/javascript">
		$('#datePicker_start').datepicker({
				format : "yyyy-mm-dd", 			//달력에서 클릭시 표시할 값 형식
				language : "ko", 						//언어
				orientation: "bottom auto", //아래에 뜨게
				todayHighlight : true,			//오늘날짜 색상표시
				autoclose : true						//날짜누르면 닫힘.
		});
	</script>	
	
	
<!-- 타임피커 자스코드 -->
<!-- 시작시간 -->
	<script type="text/javascript">
		$('#timePicker_start').timepicker({
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
	<script type="text/javascript">
<!-- 종료시간 -->		
		$('#timePicker_end').timepicker({
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

	<script>
		/*스크롤 위로올라가기 버튼 시작 script*/
		  $(function() {
		   $(window).scroll(function() {
		     if ($(this).scrollTop() > 500) {
		         $('#MOVE_TOP_BTN').fadeIn();
		     } else {
		         $('#MOVE_TOP_BTN').fadeOut();
		     }
		   });
		   
		   $("#MOVE_TOP_BTN").click(function() {
		     $('html, body').animate({
		         scrollTop : 0
		     }, 400);
		     return false;
		   });
		  });
		
		  /*
		scroll(function(): scroll 함수를 이용
		첫 if문  : 스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼을 나타내고, 사라지도록 설정
		click(function() : 버튼 클릭 이벤트
		animate({ });: animation 을 걸어서 화면 맨위로 이동하도록 설정
		 
		스크롤 위로올라가기 버튼 종료 script*/
	</script>
	
	<script>
		$(function() {
			$(".btn-secondary").on("click mousedown", function() {
				$(this).css("background-color", "rgb(83, 220, 153)");
				$(this).css("border-color", "rgb(83, 220, 153)");
				$(this).css("box-shadow", "0 0 0 0 rgb(83, 220, 153)");
			});
		});
		
	</script>
</body>
</html>