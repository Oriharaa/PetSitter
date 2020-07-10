<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.PetsitterVO" %>
<%@ page import="java.util.*" %>


<%
	ArrayList<PetsitterVO> petsitterList = (ArrayList<PetsitterVO>)request.getAttribute("petsitter_list");
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


	


</style>


  <head>
    <title>위탁 돌봄 예약 페이지</title>
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
		<link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/reservation.css?after">
		 

    
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
                <a href="loginform.me" ><span class = "font-size-14" >로그인 & 회원가입</span></a>
                <span class="mx-md-2 d-inline-block"></span>
                <%} else { %>
                <a href="memberinfo.me?id=${id}"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
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
                  <li><a href="reservation2.br" class="nav-link" id="main_whitefont2" style = "font-size:15px">펫시터 찾기</a></li>
                  <li><a href="reservation1.br" class="nav-link" id="main_whitefont2" style = "font-size:15px">위탁 돌봄</a></li>
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
					<h1 class="top_box_text1">위탁 돌봄</h1>
					<p class="top_box_text2">시터 집에 맡길 수 있어요!</p>	
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
					<i class="fas fa-arrow-right"></i>
					<input type="text" id="datePicker_end" class="form-control" placeholder="종료 날짜">	
					
				</div>
			</div>
			<div class="col">	
				<div class="time">
					<h1 class="top_box_text3">시간을 설정해주세요!</h1>
					<input type="text" name="time" class="timepicker" id="timePicker_start" value="00:00">
					<i class="fas fa-arrow-right"></i>
  				<input type="text" name="time" class="timepicker" id="timePicker_end" value="00:00">
				</div>
			</div>
		</div>
	
		<!-- 추가 작업시작 -->
		<div class="row">
			<div class="col">
				<div class="area_1">
					<h1 class="top_box_text4">지역을 선택해주세요!</h1>
					<input type="button" class="area_btn" id="area_btn1" value="서울/경기">
					<input type="button" class="area_btn" id="area_btn2" value="인천/부천">
					<input type="button" class="area_btn" id="area_btn3" value="춘천/강원">
					<input type="button" class="area_btn" id="area_btn4" value="부산/울산/경남">
					<input type="button" class="area_btn" id="area_btn5" value="대구/경북">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="area_2">
					<input type="button" class="area_btn" id="area_btn6" value="전주/전북">
					<input type="button" class="area_btn" id="area_btn7" value="광주/전남">
					<input type="button" class="area_btn" id="area_btn8" value="청주/충북">
					<input type="button" class="area_btn" id="area_btn9" value="대전/충남">
					<input type="button" class="area_btn" id="area_btn10" value="제주">				
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<div class="custom">
					<h1 class="top_box_text4">원하는 조건을 선택해주세요!</h1>
					<input type="button" class="custom_btn" id="custom_btn1" value="픽업">
					<input type="button" class="custom_btn" id="custom_btn2" value="대형견">
					<input type="button" class="custom_btn" id="custom_btn3" value="마당">
					<input type="button" class="custom_btn" id="custom_btn4" value="노견">
				</div>
			</div>
		</div>
		
			
	</div>
</section></form>




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
		
		<div class="row" id="petsitter_middle_box">
			<div class="row">
				<div class="col">
					<div class="middle_box_row">
						<div class="middle_room_img">
							<img class="room" src="./resources/images/room/bang1.jpg">
						</div>
						
						<a href ="call_view.me" class="go_view">
							<div class="view_top">
								<p class="v_location">서울 은평구 xx동
									<span class="v_i"> · </span>
									<span class="v_grade">프로펫시터</span>
								</p>
								
								<p class="v_introduce">가족처럼 행복과 사랑으로 돌보겠습니다.^^진짜임</p>
							</div>
							<div class="view_middle_left">
								<div class="view_middle_left1">
									<span class="v_option" id ="option1">아파트 ·</span>
									<span class="v_option" id ="option2">산책로 있어요</span>
									<span class="v_option" id ="option3">반려동물있어요</span>
									<div class="view_middle_left2">
										<img class="star" src="./resources/images/function/star.png">
										<img class="star" src="./resources/images/function/star.png">
										<img class="star" src="./resources/images/function/star.png">
										<img class="star" src="./resources/images/function/star.png">
										<img class="star" src="./resources/images/function/starhalf.png">
										<p class="v_review">후기 · 99개</p>
									</div>
								</div>
								<div class="view_middle_right">
									<div class="view_middle_right1">
										<p class="v_money1">₩45,000</p>
										<div class="v_1bak">
											<p class="oneNight">데이케어</p>
										</div>
									</div>
									<div class="view_middle_right2">
										<p class="v_money2">₩45,000</p>
										<div class="v_1bak">
											<p class="oneDay">1박 케어	</p>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="middle_box_row">
						<div class="middle_room_img">
							<img class="room" src="./resources/images/room/bang1.jpg">
						</div>
						
						<a href ="call_view.me" class="go_view">
							<div class="view_top">
								<p class="v_location">서울 은평구 xx동
									<span class="v_i"> · </span>
									<span class="v_grade">프로펫시터</span>
								</p>
								
								<p class="v_introduce">가족처럼 행복과 사랑으로 돌보겠습니다.^^진짜임</p>
							</div>
							<div class="view_middle_left">
								<div class="view_middle_left1">
									<p class="v_option">아파트 · 산책로 있어요 · 반려동물 없어요</p>
									<span class="view_middle_left2">
										<img class="star" src="./resources/images/function/star.png">
										<img class="star" src="./resources/images/function/star.png">
										<img class="star" src="./resources/images/function/star.png">
										<img class="star" src="./resources/images/function/star.png">
										<img class="star" src="./resources/images/function/starhalf.png">
										<p class="v_review">후기 · 99개</p>
									</span>
								</div>
								<div class="view_middle_right">
									<div class="view_middle_right1">
										<p class="v_money1">₩45,000</p>
										<div class="v_1bak">
											<p class="oneNight">데이케어</p>
										</div>
									</div>
									<div class="view_middle_right2">
										<p class="v_money2">₩45,000</p>
										<div class="v_1bak">
											<p class="oneDay">1박 케어	</p>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>	
	</div><br><br>
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
  

  
  
<!-- 데이트피커 ver.2 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<!-- 달력(한국어버젼_) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
	
	<!-- 데이트피커 자스코드 -->
	<!-- 시작날짜 -->
	<script type="text/javascript">
		$('#datePicker_start').datepicker({
				format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
				language : "kr", // 언어(<ㅡ js추가필요해서 했음.)
				orientation: "bottom auto"
		});
  </script>
  
  <!-- 종료날짜 -->
  <script type="text/javascript">
		$('#datePicker_end').datepicker({
				format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
				language : "kr", // 언어(<ㅡ js추가필요해서 했음.)
				orientation: "bottom auto"
		});
	</script>    
	
	
<!-- 타임피커 ver.1 -->
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

<!-- 언택 추가 JS!! -->
		<script src="<c:url value="/resources/js/UT_JS/reservation.js"/>"></script>
  	<script src="<c:url value="/resources/js/UT_JS/reservation_area.js"/>"></script>
  	<script src="<c:url value="/resources/js/UT_JS/reservation_term.js"/>"></script>   


   
</body>
</html>