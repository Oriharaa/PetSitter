<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>보살펴조</title>
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
              		if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
              	%>
                <a href="loginform.me" ><span class = "font-size-14" >로그인 &amp; 회원가입</span></a>
                <span class="mx-md-2 d-inline-block"></span>
                <%} else if(((String)session.getAttribute("id")).contains("@")){ %> <!-- 일반 회원 마이 페이지 -->
                <a href="memberinfo.me?id=${id}"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
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
      <header class="site-navbar js-sticky-header site-navbar-target" role="banner" style = "background : rgb(83,220,152);">
        <div class="container" >
          <div class="row align-items-center position-relative" >
            <div class="site-logo">
              <a href="home.me" ><span class="main_whitefont">보살펴조</span></a>
            </div>

	            <div class="col-12">
	              <nav class="site-navigation text-right ml-auto " role="navigation" >
	                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
	                	<li class="dropdown" onmousedown="this.style.backgroundColor='rgb(83, 220, 153)'">
										  <button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
										  </div>
										</li>
	                  <li><a href="review_board.bo" class="nav-link" id="main_whitefont2" style = "font-size:15px">이용 후기</a></li>
	                  <li><a href="home.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">공지사항</a></li> 
	                </ul>
	              </nav>
	            </div>
            
            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>
          </div>
        </div>
        <!-- 스크롤 위로올라가기 버튼 html-->
        <a id="MOVE_TOP_BTN" href="#">TOP</a>
      </header>
      
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제 완료
      
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