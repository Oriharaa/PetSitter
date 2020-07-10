<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>

<!doctype html>
<html lang="en">


<style>
	
	
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
  transition: .3s all ease-in-out; 
 }
	  
.site-mobile-menu .site-mobile-menu-body {
	background: #d3d3d3!important;
	overflow-y: scroll;
	-webkit-overflow-scrolling: touch;
	position: relative;
	padding: 0 20px 20px 20px;
	height: calc(100vh - 52px);
	padding-bottom: 150px; 
}
  /* 기본 상단바 끝*/
	  
	/*최하단바 시작*/
.site-footer {
  padding: 4em 0;
  background: #e9e9e9!important; 
}
	/*최하단바 종료*/
	
.my-hr1 {
	border: 0;
  height: 1.7px;
  width : 97%;
  background: #ccc;    
}		
	
.my-hr2 {
	border: 0;
  height: 1.5px;
  width : 97%;
  background: #ccc;
}	 

	.my-hr3 {
	border: 0;
  height: 1.5px;
  width : 100%;
  background: #ccc;   
}	 
	
.petup {
	height : 52px; 
	margin : 8px 0 0 0; 
	padding : 8px 0 0 0;
}

.dateP{ 
	text-align : center; 
	font-size : 15px;
}
	
choiceP{ 
	text-align : center; 
	font-size : 15px;
}
.postscript {
	width : 100%; 
	height : 40px; 
	font-weight : bold;
	padding : 3px 0 0 10px; 
	margin-left : 3.3%;
	border-radius : 5px;	
}
.ui-datepicker{
    margin-top: 300px;
}	  	   

.mybold {
	font-weight : bold;
}

.main_redfont0{
	color : rgba(211,84,0)!important;
}

.postscriptimg { 
	width : 130px; 
	height: 130px; 
	border-radius : 5px;
}

.postscriptimg02 {
	margin : 0 5px 0 0; 
	width : 80px; 
	height: 80px; 
	border-radius : 3px;
}


.circleprofileimg {
	width : 70px; 
	height : 70px; 
	border-radius : 35px; 
	background : gray;	
	}
	
.circleprofileimg02 {
	width : 60px; 
	height : 60px; 
	border-radius : 30px; 
	background : gray;	
	}

	
/*테이블 css 시작*/
th, td {
			color : #5e5e5e!important;
			font-size : 15px;
	}
		
		/*nth-child(1) 칼럼 순서 불러서 css 입혀준다.*/
th:nth-child(1), th:nth-child(2), th:nth-child(3), th:nth-child(4), th:nth-child(5) {
	text-align: center;
 }
	
td:nth-child(1), td:nth-child(2), td:nth-child(4), td:nth-child(5) {
	text-align: center;
}
.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
	background-color: #F8F8F8;
}
		/*테이블 css 종료*/
	
</style>



  <head>
    <title>Depot &mdash;Website Template by Colorlib</title>
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
    
    <!-- 데이트피커 ver.2(bootstrap) -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
		<!-- 데이트피커ver.2(bootstrap_design) -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
    
		<!-- 타임피커 -->
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
		<link href="${pageContext.servletContext.contextPath}/resources/jquery/jquery-ui.css?version=1.3" rel="stylesheet" type="text/css" media="screen">
    
    
    <title>pet sitter foster view</title>
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
              		if(id == null) {
              	%>
                <a href="loginform.me" ><span class = "font-size-14" >로그인 & 회원가입</span></a>
                <span class="mx-md-2 d-inline-block"></span>
                <%} else { %>
                <a href="profile.me?id=<%=id %>"><span class="font-size-14" ><%=name %>님</span></a>&nbsp;&nbsp;&nbsp;
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
      
    <!--이미지와 메인 예약 폼 시작 -->
		<body>
		  <!-- 이미지 폼 -->
    	<div class = "container">
      	<div class = "row justify-content-center">
      		<div class = "col-md-5" style = "margin-top : 50px;">
 
      			<div>
      				<hr class ="my-hr1" style = "margin-top : 8%" />
      			
							<div class = "row justify-content-center">				
								<div class ="col-10">
								<!--선택된 큰 이미지  -->
									<div class = "row">
										<div class ="col-12">
											<img src = "resources/images/dog01.jpg" id ="choiceimage" width ="100%">
										</div>
									</div>
								</div>	
							</div>
						
							<p/>
							
							<div>
      				<hr class ="my-hr1" />
      			</div>
      			
							<div class = "row justify-content-center">
								<div class = "col-10">
									<div class = "row">
									
										<!-- 집 사진  3장-->
										<div class = "col-3" style ="padding : 7px;">
											<a href = "#" onclick ="toggleImg1()"><img src = "resources/images/dog02.jpg" width ="100%"></a>
										</div>
										<div class = "col-3" style ="padding : 7px;">
											<a href = "#" onclick ="toggleImg2()"><img src = "resources/images/dog01.jpg" width ="100%"></a>
										</div>
										<div class = "col-3" style ="padding : 7px;">
											<a href = "#" onclick ="toggleImg3()"><img src = "resources/images/dog02.jpg" width ="100%"></a>
										</div>
										<!-- 집 사진 1장 끝-->
										
										<!-- 자격증 사진 1장-->
										<div class = "col-3" style ="padding : 7px;">
											<img src = "resources/images/dog01.jpg" width ="100%">
										</div>
										<!-- 자격증 사진 1장 끝-->

									</div>
								</div>	
							</div>
							
      	
      			</div>	
      		</div>
      				
  			 	<!-- 예약 폼 -->
      		<div class = "col-md-5" style = "margin-top : 50px;">
      			<div class ="row justify-content-center">
      				<!-- 본작업 시 height 지우고 하기 -->
      				<div class = "col-10" style = "background : rgba(224, 224, 224, 0.65);  height : 100%;">
      					<div class = "row justify-content-center">
      						<div class = "col-12 font-size-18 main_grayfont3 text-center mybold" style = "margin : 24px 0 3px 0;">
      							<div>예약하기</div>
      						</div>
      						<div class = "col-12 font-size-13 main_grayfont3 text-center">
      							<div>자신의 애견정보를 기입하지 않으신 분은</div>
      							<span class = "mybold">나의 반려동물 등록하기</span><span>를 누르세요 </span>
      						</div>
      						<div class = "col-12 main_mint text-center petup">
      							<a class = "font-size-21 main_whitefont mybold" href = "#">나의 반려동물 등록하기 GO!</a>
      						</div>
      						<div class = "col-12 text-center">
										<button type="button" style="background:#53dc98; color :white; width : 70px; height : 27px; margin : 8px 5px 0 0" class="btn btn-sm font-size-12">위탁</button>
										<button type="button" style="background:#bebebe; color :white; width : 70px; height : 27px; margin : 8px 0 0 0" class="btn btn-sm font-size-12">방문</button>
									</div>
									<div class = "col-12 text-center font-size-15 main_grayfont3 mybold" style = "margin-top : 8px;">
									펫시터 이용 날짜
									</div>
									<div class = "col-11 text-center">
										<div class ="row justify-content-center">
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;">
												<input type="text" id="datePicker_start" class="form-control dateP" placeholder="시작 날짜" style = "height : 41px;">
											</div>
											<div class = "col-1" style = "padding : 0 0">
												<svg class="bi bi-chevron-compact-right main_grayfont4" width="30px" height="30px" style = "margin-top : 11px;"viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
												</svg>
											</div>
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;">
												<input type="text" id="datePicker_end" class="form-control dateP" placeholder="종료 날짜" style = "height : 41px;">
											</div>
										</div>
									</div>
									
									<div class = "col-11 text-center">
										<div class ="row justify-content-center">
											<div class = "col-5 main_grayfont2 font-size-14" style = "padding : 0; margin : 4px 0 0 0;">
												체크인 시간
											</div>
											<div class = "col-1">
											</div>
											<div class = "col-5 main_grayfont2 font-size-14" style = "padding : 0; margin : 4px 0 0 0;">
												체크아웃 시간
											</div>
										</div>
									</div>
									
									
									<div class = "col-11 text-center">
										<div class ="row justify-content-center">
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;">
												<input type="text" name="time" class="form-control timepicker dateP" id="timePicker_start" value="00:00" style = "height : 41px;">
											</div>
											<div class = "col-1" style = "padding : 0 0">
												<svg class="bi bi-chevron-compact-right main_grayfont4" width="30px" height="30px" style = "margin-top : 11px;"viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
												</svg>
											</div>
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;">
												<input type="text" name="time" class="form-control timepicker dateP" id="timePicker_end" value="00:00" style = "height : 41px;">
											</div>
										</div>
									</div>
									<div class = "col-12 text-center font-size-15 main_grayfont3 mybold" style = "margin-top : 8px;">
									나의 반려동물 정하기
									</div>
									<div class = "col-10 text-center font-size-15 main_grayfont3 mybold float-left" style = "margin-top : 8px;">
										<div class ="row">
											<div class = "col-10" style = "padding : 0; margin : 4px 0 0 0;">
											  <select id="choicepet" name="choicepet" class="form-control choiceP" style = "height : 37px; width : 95%">
										    <option value="초코">초코</option>
										    <option value="두부">두부</option>
										    <option value="핑핑이">핑핑이</option>
										    <option value="아지">아지</option>
										 		</select>
											</div>
											<div class = "col-2" style = "padding : 0; margin : 4px 0 0 0;">
												<button type="button" style="background:#53dc98; color :white; width : 100%; height : 30px; margin : 4px 0 0 0;" class="btn btn-sm font-size-12">추가</button>
											</div>
										</div>
									</div>
									
									<div class = "col-11 text-center font-size-12 main_grayfont3" style = "margin : 5px 0 0 0;">
										<div class = "petcost">
											<div>초코, 대형, 2박 3일, 총 55시간, 비용 : 70,000원</div>
											<div>두부, 소형, 2박 3일, 총 55시간, 비용 : 40,000원</div>
											<div>브라우니, 대형, 2박 3일, 총 55시간, 비용 : 70,000원</div>
										</div>
										<hr class = "my-hr3" style = "margin : 8px 0;">
										<p>예상 총 비용 : </p>
										<button type="button" style="background:#53dc98; color :white; width : 60%; height : 38px; margin : 4px 0 31px 0;" class="btn btn-sm font-size-14">예약 신청</button>
									</div>
			
									
      					</div>
      				</div>
      			</div>
      		</div>
     		</div>
     	</div>	
<!--이미지와 메인 예약 폼 종료 -->


<br/><br/>



<!--펫시터 소개 프로필 자격증부분 시작  -->
			<div class = "container">
				<div class = "row justify-content-center">
					<div class = "col-12"><hr class ="my-hr2" /><br/><br/></div>
					<div class = "col-md-5">
						<div class = "row align-items-center">
							<div class = "col-4">
								<!--profileimg01 는 petsitter-style.css 안에 기입 -->
								<div class ="profileimg01" style = "margin : 2px 0;"><img src="resources/images/dog01.jpg" width ="100%" height ="100%"/></div>
							</div>
								<div class = "col-8 text-center main_grayfont3 font-size-14">
									<!-- vo로 받아와서 수정해야할 부분 -->
											<p>서울 강남구 펫시터 : 닉네임12 님</p>
											<p>등급 : A등급(활동 수 : 25회, 자격증 보유)</p>
								</div>
						</div>
					</div>
					
					<div class = "col-md-5">
						<div class = "row align-items-center">
							<div class = "col-6">
								<!--profileimg01 는 petsitter-style.css 안에 기입 -->
								<div class ="profileimg02" style = "margin : 2px 0;"><img src="resources/images/dog03.jpg" width ="100%" height ="100%"/></div>
							</div>
								<div class = "col-6 text-center main_grayfont3 font-size-14">
									<!-- vo로 받아와서 수정해야할 부분 -->
											<p>K.S.D 자격증 보유</p>
											<p>등급 : A등급(활동 수 : 25회, 자격증 보유)
								</div>
						</div>
					</div>
					
					<div class = "col-8 text-center main_grayfont3">
						<br/>
						<p class = "font-size-16" style = "font-weight : bold;"><br/>닉네임12 펫시터 님을 소개합니다!</p>
						<p class = "font-size-14">어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필<br>어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필 어필</p>
						<br/>
					</div>
			</div>
		</div>
<!--펫시터 소개 프로필 자격증부분 종료  -->		
		
<br/>    	
     	 
     	 
<!--펫시터 이용가능 서비스 요금 정보 시작 -->		
			<!--펫시터 이용가능 서비스 -->	
			<div class = "container">
				<div class = "row justify-content-center">
				
					<div class = "col-md-4">
						<div class = "row main_grayfont3">
							
							<div class ="col-12 font-size-16 text-center"><p style = "font-weight : bold;"><br/>이용 가능한 서비스입니다.</p><br/><br/></div>
							<!--int num은 임의로 지정, 실제는 vo로 받을 수있게  -->
							<div class="row justify-content-center font-size-14">
								<% int num = 1;
									if(num == 1){ %>
								<div class ="col-5">
									<div class = "float-left serviceimg01"><img src =""/></div>
									<div class = "float-right" style = "margin : 8px 0 0 0;">대형견 가능&nbsp;</div>									
								</div>
								<% } %>
								
								<% int num2 = 1;
									if(num2 == 1){ %>
								<div class ="col-5">
									<div class = "float-left serviceimg01"><img src =""/></div>
									<div class = "float-right" style = "margin : 8px 0 0 0;">마당 있음 &nbsp;&nbsp;</div>
								</div>
								<% } %>
						
								<% int num3 = 1;
									if(num3 == 1){ %>		
								<div class ="col-5">
									<div class = "float-left serviceimg01"><img src =""/></div>
									<div class = "float-right" style = "margin : 8px 0 0 0;">노견케어 가능</div>
								</div>
								<% } %>
								
								<% int num4 = 1;
									if(num4 == 1){ %>		
								<div class ="col-5">
									<div class = "float-left serviceimg01"><img src =""/></div>
									<div class = "float-right" style = "margin : 8px 0 0 0;">집앞 픽업가능</div>
								</div>
								<% } %>
								
								<div class ="col-5">
									<div class = "float-left serviceimg01"><img src =""/></div>
									<div class = "float-right" style = "margin : 8px 0 0 0;">매일 산책 &nbsp;&nbsp;</div>
								</div>
								
								<div class ="col-5">
									<div class = "float-left serviceimg01"><img src =""/></div>
									<div class = "float-right" style = "margin : 8px 0 0 0;">목욕 가능 &nbsp;&nbsp;</div>
								</div>
								
								<div class ="col-5">
									<div class = "float-left serviceimg01"><img src =""/></div>
									<div class = "float-right" style = "margin : 8px 0 0 0;">모발 관리 &nbsp;&nbsp;</div>
								</div>
								
								<div class ="col-5">
									<div class = "float-left serviceimg01"><img src =""/></div>
									<div class = "float-right" style = "margin : 8px 0 0 0;">실내 놀이 &nbsp;&nbsp;</div>
								</div>
								
								<div class ="col-5">
									<div class = "float-left serviceimg01"><img src =""/></div>
									<div class = "float-right" style = "margin : 8px 0 0 0;">응급 처치 &nbsp;&nbsp;</div>
								</div>
								
								<div class ="col-5">
									<div class = "float-left serviceimg01"><img src =""/></div>
									<div class = "float-right" style = "margin : 8px 0 0 0;">약물 투여 &nbsp;&nbsp;</div>
								</div>
								
							</div>			
						</div>
					</div>
					
					<!--펫시터 요금 정보  -->	
					<div class = "col-md-5">
						<div class = "row justify-content-center">
						 <div class = "col-10 text-center">
						 	<div class ="row align-items-center">
						 		<div class = "col-12 font-size-14 main_grayfont3" style = "background : rgba(224, 224, 224, 0.65);  height : 450px;">
						 			<div class = "col-12 font-size-16 main_grayfont3" style = "font-weight : bold;"><br/>요금정보 사항.<br/></div>
						 			<!-- svg 아이콘  -->
								 	<svg class="bi bi-book" width="22px" height="22px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style = "margin-top : 10%;">
						  			<path fill-rule="evenodd" d="M3.214 1.072C4.813.752 6.916.71 8.354 2.146A.5.5 0 0 1 8.5 2.5v11a.5.5 0 0 1-.854.354c-.843-.844-2.115-1.059-3.47-.92-1.344.14-2.66.617-3.452 1.013A.5.5 0 0 1 0 13.5v-11a.5.5 0 0 1 .276-.447L.5 2.5l-.224-.447.002-.001.004-.002.013-.006a5.017 5.017 0 0 1 .22-.103 12.958 12.958 0 0 1 2.7-.869zM1 2.82v9.908c.846-.343 1.944-.672 3.074-.788 1.143-.118 2.387-.023 3.426.56V2.718c-1.063-.929-2.631-.956-4.09-.664A11.958 11.958 0 0 0 1 2.82z"/>
						 		  	<path fill-rule="evenodd" d="M12.786 1.072C11.188.752 9.084.71 7.646 2.146A.5.5 0 0 0 7.5 2.5v11a.5.5 0 0 0 .854.354c.843-.844 2.115-1.059 3.47-.92 1.344.14 2.66.617 3.452 1.013A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.276-.447L15.5 2.5l.224-.447-.002-.001-.004-.002-.013-.006-.047-.023a12.582 12.582 0 0 0-.799-.34 12.96 12.96 0 0 0-2.073-.609zM15 2.82v9.908c-.846-.343-1.944-.672-3.074-.788-1.143-.118-2.387-.023-3.426.56V2.718c1.063-.929 2.631-.956 4.09-.664A11.956 11.956 0 0 1 15 2.82z"/>
									</svg>
								 	<div >위탁 기본 1박 24,000 원</div>
								 	<div>대형견 추가요금 12000원</div>
								 	<div>시간당 1000원 추가 (대형견 1500원)</div>	
								 	
								 	<svg class="bi bi-book" width="22px" height="22px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style = "margin-top : 5%;">
						  			<path fill-rule="evenodd" d="M3.214 1.072C4.813.752 6.916.71 8.354 2.146A.5.5 0 0 1 8.5 2.5v11a.5.5 0 0 1-.854.354c-.843-.844-2.115-1.059-3.47-.92-1.344.14-2.66.617-3.452 1.013A.5.5 0 0 1 0 13.5v-11a.5.5 0 0 1 .276-.447L.5 2.5l-.224-.447.002-.001.004-.002.013-.006a5.017 5.017 0 0 1 .22-.103 12.958 12.958 0 0 1 2.7-.869zM1 2.82v9.908c.846-.343 1.944-.672 3.074-.788 1.143-.118 2.387-.023 3.426.56V2.718c-1.063-.929-2.631-.956-4.09-.664A11.958 11.958 0 0 0 1 2.82z"/>
						 		  	<path fill-rule="evenodd" d="M12.786 1.072C11.188.752 9.084.71 7.646 2.146A.5.5 0 0 0 7.5 2.5v11a.5.5 0 0 0 .854.354c.843-.844 2.115-1.059 3.47-.92 1.344.14 2.66.617 3.452 1.013A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.276-.447L15.5 2.5l.224-.447-.002-.001-.004-.002-.013-.006-.047-.023a12.582 12.582 0 0 0-.799-.34 12.96 12.96 0 0 0-2.073-.609zM15 2.82v9.908c-.846-.343-1.944-.672-3.074-.788-1.143-.118-2.387-.023-3.426.56V2.718c1.063-.929 2.631-.956 4.09-.664A11.956 11.956 0 0 1 15 2.82z"/>
									</svg>
								 	<div >방문 기본 1시간 : 15,000원  (대형견 17,000)</div>
								 	<div>추가시간 30분 5,000원 (대형견 7,000)</div>
								 	<div>추가산책 30분 10,000원(대형견 12,000)</div>	 	
								 	
								 	<svg class="bi bi-book" width="22px" height="22px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style = "margin-top : 5%;">
						  			<path fill-rule="evenodd" d="M3.214 1.072C4.813.752 6.916.71 8.354 2.146A.5.5 0 0 1 8.5 2.5v11a.5.5 0 0 1-.854.354c-.843-.844-2.115-1.059-3.47-.92-1.344.14-2.66.617-3.452 1.013A.5.5 0 0 1 0 13.5v-11a.5.5 0 0 1 .276-.447L.5 2.5l-.224-.447.002-.001.004-.002.013-.006a5.017 5.017 0 0 1 .22-.103 12.958 12.958 0 0 1 2.7-.869zM1 2.82v9.908c.846-.343 1.944-.672 3.074-.788 1.143-.118 2.387-.023 3.426.56V2.718c-1.063-.929-2.631-.956-4.09-.664A11.958 11.958 0 0 0 1 2.82z"/>
						 		  	<path fill-rule="evenodd" d="M12.786 1.072C11.188.752 9.084.71 7.646 2.146A.5.5 0 0 0 7.5 2.5v11a.5.5 0 0 0 .854.354c.843-.844 2.115-1.059 3.47-.92 1.344.14 2.66.617 3.452 1.013A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.276-.447L15.5 2.5l.224-.447-.002-.001-.004-.002-.013-.006-.047-.023a12.582 12.582 0 0 0-.799-.34 12.96 12.96 0 0 0-2.073-.609zM15 2.82v9.908c-.846-.343-1.944-.672-3.074-.788-1.143-.118-2.387-.023-3.426.56V2.718c1.063-.929 2.631-.956 4.09-.664A11.956 11.956 0 0 1 15 2.82z"/>
									</svg>
								 	<div >방문 산책 기본 30분 : 15,000원 (대형견 17,000)</div>
								 	<div>추가시간 30분 5,000원(대형견 7,000)</div>
								 	<div>추가산책 30분 10,000원(대형견 12,000)</div>
								 	
							 	</div>
							</div>
						 </div> 
						</div>
					</div>				
<!--펫시터 이용가능 서비스 요금 정보 종료-->	


<!--펫시터 스케쥴과 펫시터 지역 시작-->	
					<!--펫시터 스케쥴-->	
					<div class = "col-md-5">
						<div class = "row justify-content-center">
							<div class = "col-10 font-size-14 main_grayfont3">
								<div class = "row justify-content-center">
									<div class = "col-12">
										<p class = "font-size-16 main_grayfont3 text-center" style = "font-weight : bold;"><br/><br/><br/>펫시터 스케줄</p>
									</div>
									<div class = "col-11" style = "height :363px; background : rgba(224, 224, 224, 0.65); overflow : hidden;"></div>
								</div>
							</div>	
						</div>
					</div>
					
					<!--펫시터 지역-->	
					<div class = "col-md-5">
						<div class = "row justify-content-center">
							<div class = "col-12">
									<p class = "font-size-16 main_grayfont3 text-center" style = "font-weight : bold;"><br/><br/><br/>펫시터 주거지역</p>
							</div>				
							<div class = "col-12 font-size-14 main_grayfont3 text-center">
								<p>신논현 5번출구에서 5분거리.</p>
							</div>
							<div class = "col-8" style = "height : 326px; background : rgba(224, 224, 224, 0.65); overflow : hidden;"></div>
						</div>
					</div>
<!--펫시터 스케쥴과 펫시터 지역 종료-->								
					
				</div>		
			</div>				
	
					
<!-- 갤러리 시작 -->
			<div class = "container">
				<div class = "row justify-content-center">
					<div class ="col-9">
						<div class ="col-12 font-size-16 main_grayfont3 text-center" style = "font-weight : bold;"><br/><br/><br/>펫시터 갤러리<br/><br/>
						</div>
							<div class ="row">
							<%
								int[] i_array = new int[30];
								//얼레이리스트로 가져와서 6개 먼저 뿌려주는 방식으로 예정
								if(i_array[0] != 1){
									for(int i=0; i < 3; i++ ) {
							%>
								<div class ="col-lg-4" style = "margin-top : 10px">
									<div class ="row justify-content-center">
										<div class = "col-5" style ="height : 110%; margin : 12px 24px 0 0; padding : 0;">
										<img src = "resources/images/dog02.jpg" width = "100%" height = "100%" style ="border-radius : 5px;">
										</div>
										<div class = "col-5" style ="height : 110%; margin-top : 12px;  padding : 0;">
										<img src = "resources/images/dog02.jpg" width = "100%" height = "100%" style ="border-radius : 5px;">
										</div>
									</div>
								</div>
							<%}  %>	
							<%	} %>
							<%//여기서 6개 이후로 더있으면 뿌려줌 그후 더보기 로 뿌릴지 결정
								if(i_array[6] != 1){
									for(int i=0; i < 3; i++ ) {
							%>
								<div class ="col-lg-4" style = " margin-top : 10px">
									<div class ="row justify-content-center">
										<div class = "col-5" style ="height : 110%; margin : 12px 24px 0 0; padding : 0;">
										<img src = "resources/images/dog02.jpg" width = "100%" height = "100%" style ="border-radius : 5px;">
										</div>
										<div class = "col-5" style ="height : 110%; margin-top : 12px;  padding : 0;">
										<img src = "resources/images/dog02.jpg" width = "100%" height = "100%" style ="border-radius : 5px;">
										</div>
									</div>
								</div>
							<%}  %>	
							<%	} %>	
							</div>
							
					</div>
						<div class = "col-12 text-center">
						<br/>
							<button type="button" style="background:#53dc98; color :white; width : 20%;" class="btn btn-sm">더 보기</button>
						</div>
				</div>
			</div>
<!-- 갤러리 종료 -->    

<!-- 후기 상단 시작 -->
			<div class = "container">
				<div class = "row justify-content-center">
					<div class ="col-11">
					<br/><br/>
					<hr class = "my-hr3" />
						<div class = "row">
							<div class = "col-md-8">		
								<div class = "row">
									<div class = "col-5 main_mint main_whitefont font-size-20 postscript">펫시터 후기
									</div>							
									
									<div class = "col-5 text-right" style = "margin : 4px 0 0 0; padding : 0;">
										<img src = "resources/images/star.jpg" class ="" width = "17px" height = "17px" style = ""/>
										<img src = "resources/images/star.jpg" class ="" width = "17px" height = "17px" style = ""/>
										<img src = "resources/images/star.jpg" class ="" width = "17px" height = "17px" style = ""/>
										<img src = "resources/images/star.jpg" class ="" width = "17px" height = "17px" style = ""/>
										<img src = "resources/images/starhalf.jpg" class ="" width = "17px" height = "17px" style = ""/>
									</div>	
									<div class = "col-1 text-right" style = "margin : 4px 0 0 0; padding : 0;">
										<div class ="main_grayfont3"  class = ""style = "padding-top : 12%; font-size : 72%">평점 : 4.74</div>
									</div>
									
										
									</div>


								<div class = "row justify-content-center">
									<div class = "col-11">
										<div class = "row">
										
											<div class = "col-lg-5" style ="padding :0; margin-top: 17px;">
												<div class = "row justify-content-center">		
													<div class = "col-6" style = "padding : 0 0 0 10px;">
														<div class = "aspect_1_1 postscriptimg">
															<img src = "resources/images/dog03.jpg"/>
														</div>
													</div>
													
													<div class = "col-6" style = "padding : 0;">
														<div class = "aspect_1_1 postscriptimg">
															<img src = "resources/images/dog03.jpg"/>
														</div>
													</div>
												</div>
											</div>
											
											<div class = "col-lg-5" style ="padding :0 0 0 3%; margin-top: 17px;">
												<div class = "row justify-content-center">		
													<div class = "col-6" style = "padding : 0;">
														<div class = "aspect_1_1 postscriptimg">
															<img src = "resources/images/dog03.jpg"/>
														</div>
													</div>
													
													<div class = "col-6" style = "width : 130px; height : 130px; padding : 0;">
														<div class = "aspect_1_1 postscriptimg">
														<a href = "#">
															<img src = "resources/images/dog03.jpg" class="img-responsive" alt="test">
														</a>
														</div>
														<a href = "#" class = "main_whitefont font-size-30">
															<div class="carousel-caption" style = "background: rgba(0,0,0,0.45); border-radius : 5px;">
															+ 40
															</div>
														</a>
													</div>
												</div>
											</div>								
										</div>
									</div>					
								</div>
<!-- 후기 상단 종료-->								
								
								
<!-- 후기작성 하나 시작  (여기서 부터 if 문과 for문으로 반복 5회 적영후 더보기시 전부 생성)-->	
								<%
									int[] postscript_array = new int[30];
									if(postscript_array[0] != 1){
										for(int j=0; j < 3; j++ ) {
								%>
								<hr class ="my-hr3"/>
								<div class ="col-12">
									<div class = "row justify-content-center">
										<div class = "col-md-8">
											<div class = "float-left circleprofileimg"></div>
											<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">
											
												<table>
													<tr>
														<td class = "font-size-18 main_grayfont3 mybold"  align = "center">닉네임<td>
														<td style = "padding: 6px 0 0 10px; font-size: 12px;"><a class ="main_redfont0" href="#">신고</a><td>
													<tr>
													<tr>
														<td style = "padding: 0 0 7px 0;">
															<% 
																int star = 5;
																for(int i = 0; i < star; i++) {
															%>
															<img src = "resources/images/star.jpg" width = "17px" height = "17px">
															<%} %>
														<td>
														<td style = "padding: 0 0 0 10px;"> 10점<td>
													<tr>
												</table>
												
											</div>	
										</div>
										<div class = "col-md-4">	
											<div class = "float-right font-size-12" style = "margin : 20px 0 0 0;">기입날짜 : 2020.06.24</div>
											<div class ="float-none"><br/><br/><br/></div>
										</div>
									
									
										<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">
											<p>따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다</p>
										</div>
									
									
										<div class = "col-12">
										
											<%
												String[] checkimg = new String[3];
												if(checkimg[0] == null){
													for(int i = 0; i < 3; i++) {
											%>
											
											<div class = "aspect_1_1 postscriptimg02 float-left">
												<img src = "resources/images/dog03.jpg"/>
											</div>
											
											<%}  %>	
											<%	} %>
										
										</div>							
									</div>
	
									<!-- 후기작성의 펫시터 답 출력  시작  (if 문 이용 펫시터 답 있을 시 출력)-->
									<%
										String petsittercomment = null;
										if(petsittercomment == null) {
									%>
									<div class = "col-12" style = "width : 100%; background :rgba(224, 224, 224, 0.65)!important; padding : 13px 50px 1px 50px; margin : 17px 0 0 0;">
										<div class = "row">
											<div class = "col-md-8" style = "height : 100%; margin-bottom : 6px;">
												<div class = "float-left circleprofileimg02"></div>
												<div class = "float-left" style= "padding : 17px 0 0 3px; margin-left : 10px; height : 100%">
													<table>
														<tr>
															<td class = "font-size-16 main_grayfont3 mybold"  align = "center">닉네임<td>
															<td style = "padding: 3px 0 0 10px; font-size: 12px;"><a class ="main_redfont0" href="#">신고</a><td>
														<tr>									
													</table>
												</div>
											</div>
											<div class = "col-md-4" style = "height : 100%">
												<div class = "float-right font-size-12" style = "margin : 23px 0 0 0;">기입날짜 : 2020.06.24</div>
												<div class ="float-none" style = "height : 100%"><br/><br/></div>
											</div>
												<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">
													<p>따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다</p>
												</div>
										</div>			
									</div>
									<%} %>
									<!-- 후기작성의 펫시터 답  출력 종료  (if 문 이용 펫시터 답 있을 시 출력)-->
									<!-- 후기작성의 펫시터 답  쓰기 시작  (if 문 이용 펫시터 없고 펫시터 일시 출력)-->
									<%
										String petsitter = "y";
										if(petsittercomment != null && petsitter == "y") {
									%>
									
									<div class = "col-12" style = "background :rgba(224, 224, 224, 0.65)!important; height : 100px; margin : 10px 0 0 0; ">
										<div class = "row  justify-content-center">
											<div class = "col-11" style = "padding : 11px 0 0 0;">
											<table style = "width : 100%">
												<tr>
													<td style ="font-size : 1%; width : 11%">답변 :</td><td><textarea name="inputstr2" style = "width : 89%; height : 70px; font-size : 12px;"></textarea></td>
												</tr>
											</table>
											</div>
										</div>
									</div>
									<div class = "col-12 text-right" style ="margin-top : 10px;">
										<button type="button" style="background:#53dc98; color :white; width : 150px;" class="btn btn-sm">펫시터 답글 남기기</button>
									</div>			
									<%} %>
									<!-- 후기작성의 펫시터 답  쓰기 종료  (if 문 이용 펫시터 없고 펫시터 일시 출력)-->
								</div>
								<%	} %>
								<%} %>
								<hr class ="my-hr3"/>
								<div class = "col-12 text-center" style ="margin-top : 15px;">
									<button type="button" style="background:#53dc98; color :white; width : 100px;" class="btn btn-sm">더 보기</button>
								</div>
<!-- 후기작성 하나 종료  (여기서 부터 if 문과 for문으로 반복 5회 적영후 더보기시 전부 생성)-->	
														
								
							</div>	
<!-- 후기 종료 -->


<!-- Q&A 시작 -->
					<div class = "container">
						<div class = "row">
							<div class = "col-12 font-size-23 main_grayfont3" style = "margin-top : 50px;">펫시터 Q&A</div>
							<div class = "col-12" style = "margin-top : 20px;">
								<table class="table table-sm table-hover table-striped">
								<thead>
										<tr>
											<th width="50px">번호</th>
											
											<th width="100px">답변여부</th>
											<th width="180px">구분</th>
											
											<th width="100px">작성자</th>
											<th width="100px">등록일자</th>
										</tr>
									</thead>
									<tbody>
								<c:forEach var="i" begin="1" end="10">
									<tr>
											<td><c:out value="${16-i}"></c:out></td>
											
											<td>답변예정/완료</td>
											<td>위탁 중 5월 20일 저녁에 잠시 들리려해요!</td>
											
											<td>닉네임123</td>
											<td>2020-05-11</td>
											</tr>
								</c:forEach>
								</tbody>
								</table>
							</div>
							<div class="col-md-12 text-center">
							<h6>< 1 2 3 4 5 6 7 8 9 10 ></h6>
							</div>
							<br/><br/><br/>
						</div>
					</div>

						
					
								
							
							
							
							
							<div class ="col-md-4">
								
							</div>
						</div>
					</div>
				</div>
			</div>

</body>
      
      
      
      <!-- 본 기능 추가 종료 -->
      
      
      
      <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-7">
                <h2 class="footer-heading mb-4" id="main_grayfont1">About Us</h2>
                <p id="main_grayfont2" style = "font-size : 14px;">반려동물들을 위해 고객과 펫시터와를 연결시켜주는 매칭 플렛폼입니다.. 신뢰와 안전을 위해 최선을 다하겠습니다.</p>
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
	
		<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.sticky.js"/>"></script>
    
    
    <script src="<c:url value="./resources/js/aos.js"/>"></script><!-- nav 상단바 반응형웹 적용1 -->

    <script src="<c:url value="/resources/js/main.js"/>"></script><!-- nav 상단바 반응형웹 적용2 -->
      
    
  <script>
  /*css 적인 script는 하단인 이위치에 기입*/
 
	/*상단 사진 정보 클릭시 선택 시작*/
    function toggleImg1() {
      document.getElementById("choiceimage").src = "resources/images/dog02.jpg";
    }
    
    function toggleImg2() {
        document.getElementById("choiceimage").src = "resources/images/dog01.jpg";
      }
    
    function toggleImg3() {
        document.getElementById("choiceimage").src = "resources/images/dog02.jpg";
      }
	/*상단 사진 정보 클릭시 선택 시작*/ 
	
  /*사진 가로 세로 이미지 크기 맞추고 가운데 위치로 보이게 하기  시작*/ 
	window.onload = function() {
		  var divs = document.querySelectorAll('.aspect_1_1');
		  for (var i = 0; i < divs.length; ++i) {
		    var div = divs[i];
		    var divAspect = div.offsetHeight / div.offsetWidth;
		    div.style.overflow = 'hidden';
		    
		    var img = div.querySelector('img');
		    var imgAspect = img.height / img.width;
	
		    if (imgAspect <= divAspect) {
		      // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
		      var imgWidthActual = div.offsetHeight / imgAspect;
		      var imgWidthToBe = div.offsetHeight / divAspect;
		      var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
		      img.style.cssText = 'width: auto; height: 100%; margin-left: '
		                      + marginLeft + 'px;'
		    } else {
		      // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
		      img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
		    }
		  }
		  
		  var btn = document.querySelector('#btnToggleOverflow');
		  btn.onclick = function() {
		    var val = divs[0].style.overflow == 'hidden' ? 'visible' : 'hidden';
		    for (var i = 0; i < divs.length; ++i)
		      divs[i].style.overflow = val;
		  };
		};
		/*사진 가로 세로 이미지 크기 맞추고 가운데 위치로 보이게 하기  종료*/ 
    
    
  </script>  
      
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
	    minTime: '00',
	    maxTime: '11:00pm',
	    defaultTime: '24',
	    startTime: '00:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	</script>
	
	<script type="text/javascript">
	$('.timepicker2').timepicker({
	    timeFormat: 'p h:mm',
	    interval: 60,
	    minTime: '07',
	    maxTime: '11:00pm',
	    defaultTime: '12',
	    startTime: '07:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	</script>	 


</body>
</html>