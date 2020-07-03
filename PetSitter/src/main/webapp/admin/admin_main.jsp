<!-- 관리자 메인 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<% 
	ArrayList<PetsitterVO> petsitterList = (ArrayList<PetsitterVO>)request.getAttribute("petsitter_list"); 
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<!doctype html>
<html lang="en">


<style>
	h3#notice {
		color: #5e5e5e;
	}
	button#member_manage, button#report_manage, button#acc_manage {
		color:white;
	} 
	
	button#member_manage:hover, button#member_manage:focus, button#report_manage:hover, 
	button#report_manage:focus, button#acc_manage:hover, button#acc_manage:focus {
		border-width : medium;
		border-color : #53dc98!important;
		color : white;
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
      		<div class="container">      
			<div class="row">
    		<div class="col-md-12 p-3"></div>
     </div>
		
	    <div class="row">
	      <div class="col-md-2">
	    		<button type="button" style="color:white; background:#e67e22;" class="btn btn-sm">관리자 페이지</button>
	    	</div>
		    <div class="col-md-7"></div>
	      <div class="col-md-3">
	    		<button type="button" onclick="location.href='member_info_list.me'" style="background:#D3D3D3;" class="btn btn-sm" id="member_manage">회원 관리</button>
	    		<button type="button" style="background:#D3D3D3;" class="btn btn-sm" id="report_manage">신고 관리</button>
	    		<button type="button" style="background:#D3D3D3;" class="btn btn-sm" id="acc_manage">회계 관리</button>
	    	</div>
	    </div>
    </div>  
    
    
    
    <!-- 여백용 row -->
    <div class="row">
    <div class="col-md-12 p-3"></div>
     </div>
      <div class = "container">
		<div class="row">
    
    <div class="col-md-12">
    <h3 class="text-left" id="notice">관리자 공지사항</h3>
    </div>
    </div>
    
    
    <div class="row">
    
    <div class="col-md-12">  
		
		<style>	  	
		th, td {
			color : #5e5e5e!important;
		}
		th {
		 	text-align:center;
			font-weight: bold;
		}
	
   td:nth-child(1), td:nth-child(2), td:nth-child(4), td:nth-child(5) {
			text-align: center;
  	}
  	.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
   	background-color: #F8F8F8;
		}
		</style>
		
		<!-- 관리자 공지사항 -->
		<table class="table table-sm table-hover table-striped">
		<thead>
				<tr>
					<th width="100px">번호</th>
					
					<th width="150px">닉네임</th>
					<th>제목</th>
					
					<th width="100px">작성일자</th>
					<th width="150px">조회수</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach var="i" begin="1" end="15">
			<tr>
					<td><c:out value="${16-i}"></c:out></td>
					
					<td>매니저01</td>
					<td>2020년 공지사항</td>
					
					<td>2020-05-11</td>
					<td>535</td>
					</tr>
		</c:forEach>
		</tbody>
		</table>
		
		</div>
		</div>
		
		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<h3 class="text-center">1 2 3 4 5 6 7 8 9 10</h3>
		</div>
		<div class="col-md-2"></div>
		</div>
		
		
		<!-- 여백용 row -->
		<div class="row">
    <div class="col-md-12 p-3"></div>
    </div>
     
     
    <div class="row">
    <div class="col-md-12">
    <h3 class="text-left">펫시터 신청 목록</h3>
    </div>
    </div>
    
    <div class="row">
    <div class="col-md-12">
    	
    <!-- 펫시터 신청 목록 -->
    <table class="table table-hover table-sm table-striped">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>펫시터 아이디</th>
				<th>닉네임</th>
				<th>주소</th>
				<th>연락처</th>
				<th>가입일자</th>
				<th>승인여부</th>
			</tr>
		</thead>
		<tbody>
			
			<%for(int i = 0; i < petsitterList.size(); i++){
				if(petsitterList.get(i).getPETSITTER_RANK().equals("N")){
					String[] address = petsitterList.get(i).getPETSITTER_ADDRESS().split(",");
					
				%>
			
			<tr onClick="location.href='apply_petsitter.me?PETSITTER_ID=<%=petsitterList.get(i).getPETSITTER_ID()%>'">
				<td><%=i+1 %></td>
				<td><%=petsitterList.get(i).getPETSITTER_ID() %></td>
				<td><%=petsitterList.get(i).getPETSITTER_NICKNAME() %></td>
				<td><%=address[0]+". "+address[1]+" ("+address[2]+")" %></td>
				<td><%=petsitterList.get(i).getPETSITTER_TEL() %></td>
				<td><%=petsitterList.get(i).getPETSITTER_DATE().substring(0,10) %></td>
				<td><%=petsitterList.get(i).getPETSITTER_RANK() %></td>
			</tr>
			<%}} %>

		</tbody>
		</table>
    </div>
    </div>
		
				<div class="row">
					<div class="col-md-2"></div>
						<div class="col-md-8">
							<h3 class="text-center">1 2 3 4 5 6 7 8 9 10</h3>
						</div>
					<div class="col-md-2"></div>
				</div>
		
				<div class="row">
    			<div class="col-md-12 p-3"> 
      </div>
     </div>
		
			   
	  <div class="row">
	  <div class="col-md-1"></div>
	  <div class="col-md-2">
	  	<p>today : 5</p>
	  	</div>
	  	<div class="col-md-2">
	  		<p>month : 15</p>
	  	</div>
	  	<div class="col-md-2">
	  		<p>total : 1115</p>
	  	</div>
	  <div class="col-md-2"></div>
	  <div class="col-md-2"></div>
	  <div class="col-md-1"></div>
	  </div>
	  
	  <div class="row">
    <div class="col-md-12 p-1"></div>
    </div>
    
	  <div class="row">
	 
	  <div class="col-md-12">
	  <h1>월별 연결횟수 그래프</h1>
	  </div>

	  </div>
	  
	  <div class="row">
    
    <div class="col-md-12">
		<canvas id="myChart" width="800px" height="400"></canvas>
		<script>
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
			datasets: [{
				label: '# of Votes',
				data: [12, 19, 3, 5, 2, 3],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
</script>


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
