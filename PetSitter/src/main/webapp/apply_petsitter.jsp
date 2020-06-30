<!-- 관리자 메인 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.*" %>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	PetsitterVO petsitter = (PetsitterVO)request.getAttribute("petsitter"); 
	String olddog = "N";
	String yard = "N";
	String big = "N";
	String pickup = "N";
	if(!(petsitter.getPETSITTER_SERVICE_LIST().equals("N"))){
		String[] service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
		for(int i =0;i < service.length;i++){
			if(service[i].equals("olddog")){
				olddog = "Y";
			}
			if(service[i].equals("yard")){
				yard = "Y";
			}
			if(service[i].equals("bigsize")){
				big = "Y";
			}
			if(service[i].equals("pickup")){
				pickup = "Y";
			}
		}
	}
%>
<!doctype html>
<html lang="en">


<style>
	a#prepage, a#denyPetsitter, a#allowPetsitter {
		color:black;
		margin-right: 10px;
	} 

	a#prepage:hover, a#denyPetsitter:hover, a#allowPetsitter:hover {
		border-width : medium;
		border-color : #53dc98!important;
		color : white;
		margin-right: 10px;
	}
	
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
	/* 기본 상단바 끝*/
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
  
<script src = "${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
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


              <div class="float-right">
              	<%
              		if(id == null) {
              	%>
                <a href="loginform.me" ><span class = "font-size-14" >로그인 및 회원가입</span></a>
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

        <div class="container" >
          <div class="row align-items-center position-relative" >


            <div class="site-logo">
              <a href="./home_login.me" ><span class="main_whitefont">보살펴조</span></a>
            </div>

            <div class="col-12">
              <nav class="site-navigation text-right ml-auto " role="navigation" >

                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                  <li><a href="basicform.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">방문 돌봄</a></li>
                  <li><a href="basicform.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">위탁 돌봄</a></li>
                  <li><a href="basicform.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">반려동물 전문가 상담</a></li>
                  <li><a href="basicform.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">후기 게시판</a></li>
                  <li><a href="basicform.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">공지사항</a></li>
                  
                </ul>
              </nav>

            </div>

            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>
        </div>

      </header>
		
		
		<!-- 여백 추가 -->
		<div class="row">
    <div class="col-md-12 p-3"></div>
    </div>
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="container">
  				<div class="row justify-content-center">
						<h1>펫시터 활동 신청서</h1>
					</div>
				</div>	
			</div>

		</div>
		
		<!-- 여백 추가 -->
		<div class="row">
    	<div class="col-md-12 p-3"></div>
    </div>
    
    <div class="row">
    	<style>
    	tr, td, p {
    		color: black;
    	}
    	
    	td:nth-child(1) {
	    		background-color: black;
	  			color: white;
	  			text-align: center;
	    	}
	    	td:nth-child(2) {
	    		text-align: center;
	    	}
	    	td#contents {
	    		text-align: justify;
	    	}
    	    	
    	</style>    
    	
    		<div class="col-md-12">
    			<img src="/filepath/<%=petsitter.getPETSITTER_PHOTO_UPFILE()%>" class = "float-center">
    						<img src="/filepath/<%=petsitter.getPETSITTER_PHOTO_PROFILE_FILE()%>" class = "float-center">
    						<%
    						if(!(petsitter.getPETSITTER_PHOTO_HOME_FILE().equals("N"))){
    							String[] home = petsitter.getPETSITTER_PHOTO_HOME_FILE().split(",");
    							for(int i = 0 ; i < home.length;i++){
    						%>
    						<img src="/filepath/<%=home[i]%>" class = "float-center">
    						<%}} %>
    				<table border="1" width="100%" style="table-layout: fixed">
    			
    					<tbody>
    						<tr>
    							<td colspan="2">아이디</td>
    							<td colspan="6"><%=petsitter.getPETSITTER_ID() %></td>
    						</tr>
    						<tr>
    							<td colspan="2">전화번호</td>
    							<td colspan="6"><%=petsitter.getPETSITTER_TEL() %></td>
    						</tr>
    						<tr>
    							<td colspan="2">이메일</td>
    							<td colspan="6"><%=petsitter.getPETSITTER_EMAIL() %></td>
    						</tr>
    						<tr>
    							<td colspan="2">주소</td>
    							<td colspan="6"><%=petsitter.getPETSITTER_ADDRESS() %></td>
    						</tr>
    						<tr>
    							<td colspan="2">케어 종류</td>
    							<td colspan="6"><%=petsitter.getPETSITTER_TYPE() %></td>
    						</tr>
    						<tr>
    							<td colspan="2">노견케어 가능 여부</td>
    							<td colspan="6"><%=olddog %></td>
    						</tr>
    						<tr>
    							<td colspan="2">픽업 가능 여부</td>
    							<td colspan="6"><%=pickup %></td>
    						</tr>
    						<tr>
    							<td colspan="2">마당유무</td>
    							<td colspan="6"><%=yard %></td>
    						</tr>
    						<tr>
    							<td colspan="2">대형견 케어 가능 여부</td>
    							<td colspan="6"><%=big %></td>
    						</tr>
    						<tr>
    							<td colspan="2">가입날짜</td>
    							<td colspan="6"><%=petsitter.getPETSITTER_DATE().substring(0,10) %></td>
    						</tr>
    						<tr>
    							<td colspan="2">자기소개</td>
    							<td colspan="6">
    							<%=petsitter.getPETSITTER_INTRODUCE() %>
    							</td>
    						</tr>
    					</tbody>
    				</table>
    		</div>    		
    	<div class="col-md-12 p-3">
    		    <div class="col text-center">
				  		<a style="background:#D3D3D3;" class="btn btn-sm" id="prepage" href="javascript:history.go(-1)">이전 화면으로</a>
				  		<a style="background:#D3D3D3;" class="btn btn-sm" id="denyPetsitter" href="petsitter_refusal.me?PETSITTER_ID=<%=petsitter.getPETSITTER_ID()%>">거절</a>
				  		<a style="background:#D3D3D3;" class="btn btn-sm" id="allowPetsitter" href="petsitter_approval.me?PETSITTER_ID=<%=petsitter.getPETSITTER_ID()%>">승인</a>
    			</div>
    		</div>
    </div>
	  
	  </div>
		
		<!-- 하단 넉넉하게 여백 주기 -->
		<div class="row">
    <div class="col-md-12 p-5"></div>
    </div>
    
   
	   

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
                  <li><a href="#" id="main_grayfont2" style = "font-size : 14px;">후기 게시판</a></li>
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
	<!-- 하단 바 종료 -->
    </div>

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
