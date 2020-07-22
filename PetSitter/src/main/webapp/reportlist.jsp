<!-- 관리자 신고 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<div class="row">
    <div class="col-md-12 p-3"> 
      </div>
     </div>

    <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-2">
    <button type="button" class="btn btn-warning btn-lg">관리자 페이지</button>
        </div>
    <div class="col-md-1"></div>
    <div class="col-md-1"></div>
    <div class="col-md-1"></div>
    <div class="col-md-1"></div>    
    <div class="col-md-1"></div>
    <div class="col-md-1">
    <button type="button" class="btn btn-success btn-lg">회원 관리</button>
    </div>
    <div class="col-md-1">
    <button type="button" class="btn btn-success btn-lg">신고 관리</button>
    </div>
    <div class="col-md-1">
    <button type="button" class="btn btn-success btn-lg">회계 관리</button>
    </div>
    <div class="col-md-1"></div>        
    </div>  
    
    <div class="row">
    <div class="col-md-12 p-3"> 
      </div>
     </div>
     
     		<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
    <h3 class="text-left">일반회원이 신고한 펫시터 목록</h3>
    </div>
    <div class="col-md-1"></div>
    </div>
      
    <div class="row">
    	<div class="col-md-1"></div>
    	<div class="col-md-10">  
		
		<!-- 일반회원이 신고한 펫시터 목록 -->
		<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
				<tr>
					<th>글 번호</th>
					<th>펫시터 아이디</th>
					<th>닉네임</th>
					<th>신고 사항</th>
					<th>신고자</th>
					<th>처리상태</th>
					<th>신고횟수</th>
				</tr>
			</thead>
			<tbody>
		<% for (int i = 1 ; i <= 10 ; i++) {%>
			<tr>
					<td><%= 10 - i %></td>
					<td>abc123</td>
					<td>강아지돌봄12</td>
					<td>거짓정보, 서비스 불만족</td>
					<td>BBC12</td>
					<td>대기중</td>
					<td>2</td>
					</tr>
					
		<% } %>
		</tbody>
		</table>
		
		</div>
		
		<div class="col-md-1"></div>
		
		</div>
		
		<dlv class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<h3 class="text-center">1 2 3 4 5 6 7 8 9 10</h3>
		</div>
		<div class="col-md-3"></div>
		</dlv>
		
		
		
		
		<div class="row">
    <div class="col-md-12 p-3"> 
      </div>
     </div>
     
    <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
    <h3 class="text-left">펫시터가 신고한 일반회원 목록</h3>
    </div>
    <div class="col-md-1"></div>
    </div>
     
      <div class="row">
    	<div class="col-md-1"></div>
    	<div class="col-md-10">
    	
    	<!-- 펫시터가 신고한 일반회원 목록 -->
    		<table class="table table-bordered table-hover table-condensed">
		<thead>
				<tr>
					<th>글 번호</th>
					<th>회원 아이디</th>
					<th>닉네임</th>
					<th>신고 사항</th>
					<th>신고자</th>
					<th>처리상태</th>
					<th>신고횟수</th>
				</tr>
			</thead>
			<tbody>
		<% for (int i = 1 ; i <= 10 ; i++) {%>
			<tr>
					<td><%= 10 - i %></td>
					<td>abc123</td>
					<td>강아지돌봄12</td>
					<td>거짓정보, 서비스 불만족</td>
					<td>BBC12</td>
					<td>대기중</td>
					<td>2</td>
					</tr>
					
		<% } %>
		</tbody>
		</table>
    </div>
    
    <div class="col-md-1"></div>
    </div>
		
				<dlv class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<h3 class="text-center">1 2 3 4 5 6 7 8 9 10</h3>
		</div>
		<div class="col-md-3"></div>
		</dlv>
		
				<div class="row">
    <div class="col-md-12 p-3"> 
      </div>
     </div>
     
		<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
    <h3 class="text-left">댓글 신고 목록</h3>
    </div>
    <div class="col-md-1"></div>
    </div>
		
		 <div class="row">
    	<div class="col-md-1"></div>
    	<div class="col-md-10">
    	
    	<!-- 댓글 신고 목록 -->
    		<table class="table table-dark table-bordered table-hover table-condensed">
		<thead>
				<tr>
					<th>글 번호</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>신고 사항</th>
					<th>신고자</th>
					<th>처리상태</th>
					<th>신고횟수</th>
				</tr>
			</thead>
			<tbody>
		<% for (int i = 1 ; i <= 10 ; i++) {%>
			<tr>
					<td><%= 10 - i %></td>
					<td>abc123</td>
					<td>강아지돌봄12</td>
					<td>거짓정보, 서비스 불만족</td>
					<td>BBC12</td>
					<td>대기중</td>
					<td>2</td>
					</tr>
					
		<% } %>
		</tbody>
		</table>
    </div>
    
    <div class="col-md-1"></div>
    </div>
		
		<dlv class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<h3 class="text-center">1 2 3 4 5 6 7 8 9 10</h3>
		</div>
		<div class="col-md-3"></div>
		</dlv>
		
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
