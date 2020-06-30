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
	  
	  
	  
/* 언택 css */ /* 언택 css */ /* 언택 css */
/* 언택 css */ /* 언택 css */ /* 언택 css */
/* 언택 css */ /* 언택 css */ /* 언택 css */

/*상단 왼쪽 box1 */
	.box1{
	background:rgba(83,220,152);
 	width: 100%;
  height: 100%; 
	}
	
	.mypage{
	color:#ffffff;
	font-weight : bold;
	margin : 8.2% 0 10px 0;
	}

	.profileimg {
	width: 100%;
	height: 100%;
	object-fit: cover;
	}
	  
	.profile {
    width: 80%;
    height: 80%; 
    border-radius: 70%;
    overflow: hidden;
    margin-bottom : 10%;
	}  

	.profile_sm1{
	width: 100px;
    height: 100px; 
    border-radius: 70%;
    overflow: hidden;
    margin : 6px 0;
	}
	
	.roundimg{
	margin:0 0 0 30px;
	}
	
	.mpname {
	font-size : 47px;
	margin : 0;
	}
	
	.mpneem {
	font-size : 15px;
	margin-top : 31px;
	}

	.mpnick {
	font-size : 16px;
	}
	
	
	.mpbody {color:#ffffff;}  
	.mpgrade {
	font-size : 16px;
	}  
	.mpdate {margin:0 60px 0 0 ;}


/*상단 오른쪽 box2 */

	.mptext {
	margin:75px 0 0 0;
	}
	
	
	
	.mptext2_1, .mptext1_1 {
	font-size : 15px;
	margin:0 60px 0 30px;
	} 
	
	.line { 
	color:red; size:120%;
	margin:0 0 20px 0;
	}  
	  
	  
/* 중앙 list*/
	.middle_img {
	align:center;
	}	  
	
	.middle_head {
	margin: 60px 0 0 0 ;
	}  
	  
	.date_row {
	margin:30px 0 0 0 ;
	}  
	
	.middle_bt {
	margin:10px 0 0 0;
	}
	
	#middle_bt4 {
	margin:0 30px 0 0;
	}
	
	.middle_bt1, .middle_bt2 {
	border:0;
	color : #707070;
	background-color:rgb(224, 224, 224);
	}
	
	.date_row {margin:20px 0 10px 10px;}
	
/*table */	
	
	.table_headRow {
	border-top: solid 1px;
	border-bottom: solid 1px;
	}

	td {
	text-align:center;
	}
	
	tbody {
	border-bottom: solid 1px;
	}
	
	
	.list {
	margin:0 0  200px 0 ;}
	
	.review_write {
	font-size : 15px;
	border:0;
	color : white;
	background-color:rgb(83,220,152);
	}
	
	.review_complete {
	font-size : 15px;
	border:0;
	color : #707070;
	background-color:rgb(224, 224, 224);
	}
	
	.pet_talk {
	font-size : 15px;
	border:0;
	color:#ffffff; 
	background-color:rgba(83,220,152);
	}
	
	.grade {
	font-size : 13px;
	color:rgba(211,84,0);
	}
	
	
/* pagination */
	.page {
	text-align: cneter;
	width: 50%;
	height: 50%;
	}
	
	.pagination {
	list-style:none;
	display:inline-block;
	padding:0;
	margin-top:20px;
	}	
	
	.pagination li {
	display:inline;
	text-align:center;
	}
	
/* pagination(number) */
	.pagination a {
	float : left;
	display:block;
	font-size:14px;
	text-decoration:none;
	padding: 5px 12px;
	color: red;
	line-height: 1.5;
	}
	
	.first{ 
	margin-right:15px;
	}
	
	.last{
	margin-left:15px;
	}

	.first:hover, .last:hover, .left:hover, .right:hover{
	color:#2e9cdf;
	}

	.pagination a.active {
	outline:none;
	}

	.modal .num {
	margin-left:3px;
	padding:0;
	width:30px;
	height:30px;
	line-height:30px;
	-moz-border-radius:100%;
	-webkit-border-radius:100%;
	border-radius:100%;
	}	

	.modal .num:hover {
	background-color:#2e9cdf;
	color:#ffffff;
	}

	.modal .num.active, .modal .num:active {
	background-color:#2e9cdf;
	cursor:pointer;
	}

	arrow-left {
	width:0;
	height:0;
	border-top:10px solid transparent;
	border-bottom:10px solid transparent;
	border-right:10px solid blue;
	}


	
	
	
	
	  
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
    
    <title>petssiter basicform</title>
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

                <a href="home.me" class=""><span>로그인</span></a>
                <span class="mx-md-2 d-inline-block"></span>
                <a href="home.me" class=""><span>회원가입</span></a>

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

<!-- 상세정보 시작!! -->
<section class="myinfo">
  <div class="container" style = "margin-top :60px;">
    <div class = "row">
	  <div class="col-md-7" style = "padding : 0;">
	    <div class="box1">
		    <div class="row">
		      <div class="col-5" style = "margin : 3.5% 0 0 0;">  
			    <div class="roundimg">
				  <div class="profile" style="background: #BDBDBD;">
					<img class="profileimg" src="resources/images/person_1.jpg">
				  </div>
				</div>
			  </div> 
			  <div class="col-7" style = "padding : 0;">
			  	 <h3 class="mypage font-size-24">PETSITTER MY PAGE</h3>
			    <div class="mpbody">
				  <div class="row" style = "margin-to">
				  <div class = "col-04" style = "padding : 0 15px;">
				    <h2 class="mpname float-left">홍길동</h2>
						<h5 class="mpneem float-none">님</h5>
				    <h3 class="mpnick">닉네임</h3>
				    <h5 class="mpgrade">등급 : 프로 펫시터</h5>
				    <h5 class="mpdate font-size-16">가입일 : 2020.06.22</h5>
				  </div>
				  <div class = "col-md-5" style = "margin-top : 50px;">
				  	<a href = "#" class="font-size-16 main_whitefont"><div>스케쥴 관리</div></a>
						<a href = "#" class="font-size-16 main_whitefont"><div>회원정보 변경</div></a>
				  </div>
				  </div>
				</div>							
			  </div> 
			</div>
		  </div>
		</div>
			
			
		<div class="col-md-5" style = "color : #5e5e5e;">
			<div class="mptext">
			  <div class="row">
			  <div class = "col-6">
				<h5 class="font-size-15">돌본 횟수 : </h5>
				</div>
				<div class = "col-6">
				<h5 class="font-size-15">이번달 돌본 횟수 : </h5>
				</div>
				<div class = "col-12">
				<hr class ="line" color="#949494" width="100%">
				</div>
				<div class = "col-6">
				<h5 class="font-size-15">총 매출금액 : </h5>
				</div>
				<div class = "col-6">
				<h5 class="font-size-15">이번달 매출 금액: </h5>
				</div>
				<div class = "col-12">
				<hr class ="line" color="#949494" width="100%">
				</div>
			</div>		
		  </div>
	    </div>	
	  </div>
	</div>
</section>
<!-- 상세정보 끝!! -->




<!-- 이용현황 및 내역 시작!!-->
<section class="list">
  <div class="container" style = "margin-top : 25px;">
    <div class="row justify-content-center">
	  <img class ="middle_img" src="resources/images/pet/Cuty_Dog1.png" width="150px" height="150px">
	  <h4 class="middle_head">이용 현황 및 내역</h4> 
	</div>
		
	<div class="row main_grayfont3" style = "margin-top : 25px;">
	  <div class="date_row">
		<input type="button" class="middle_bt1" id="middle_bt1" value="1주일">
		<input type="button" class="middle_bt1" id="middle_bt2" value="1개월">
		<input type="button" class="middle_bt1" id="middle_bt3" value="3개월">
		<input type="button" class="middle_bt1" id="middle_bt4" value="전체 시기">
			
		<input type="button" class="middle_bt2" id="middle_bt5" value="날짜 설정">
		<input type="button" class="middle_bt2" id="middle_bt6" value="날짜 설정">
		<input type="button" class="middle_bt2" id="middle_bt7" value="조회">

	  </div>
	</div>
		
			
  <table>
 	<colgroup>
	  <col style="width:15%">
	  <col style="width:20%">
	  <col style="width:20%">
	  <col style="width:20%">
	  <col style="width:15%">
	  <col style="width:15%">
	  <col style="width:15%">
	</colgroup> 
      <thead>
		<tr class="table_headRow" style = "color : #5e5e5e;">
		  <td>진행 현황</td>
		  <td id="td1">펫시터 사진</td>
		  <td>펫시터 정보</td>
		  <td>이용 일자</td>
		  <td>주문 번호</td>
		  <td>이용 금액</td>
		  <td>소통 게시판</td>
		</tr>	
	  </thead>
	  <!--목록 한묶음  시작-->
	  <tbody>
	    <tr style = "color : #5e5e5e;">
		  <td>위탁</td>
		  <td rowspan="3"><img src="resources/images/person_1.jpg" class="profile_sm1"></td>
		  <td>이기자</td>
		  <td>2020.06.03 11:00</td>
		  <td rowspan="3">3</td>
		  <td rowspan="3">60,000원</td>
		  <td rowspan="3"><input type="button" class="pet_talk" value="고객과의 소통"></td>
		</tr>
			
		<tr style = "color : #5e5e5e;">
		  <td><b>현재 돌봄 중</b></td>
		  <td><b>닉네임12</b></td>
		  <td>~</td>
		</tr>
			
		<tr style = "color : #5e5e5e;">
		  <td class="grade" style = "margin-bottom : 5px;">신고</td>
		  <td>010.1111.1111</td>
		  <td>2020.06.05 14:00</td>
		</tr>		
	  </tbody>
	  <!--목록 한묶음  종료-->
	  
	  <!--목록 한묶음  시작-->
	  <tbody>
	    <tr style = "color : #5e5e5e;">
		  <td>방문</td>
		  <td rowspan="3"><img src="resources/images/person_2.jpg" class="profile_sm1"></td>
		  <td>김기자</td>
		  <td>2020.06.01 11:00</td>
		  <td rowspan="3">2</td>
		  <td rowspan="3">30,000원</td>
		  <td rowspan="3"><input type="button" class="review_write" value="답글 남기기"></td>
		</tr>
		<tr style = "color : #5e5e5e;">
		  <td><b>돌봄 완료</b></td>
		  <td><b>닉네임23</b></td>
		  <td>~</td>
		</tr>
		<tr style = "color : #5e5e5e;">
		  <td class ="grade">신고</td>
		  <td>010.2222.2222</td>
		  <td>2020.06.01 19:00</td>
		</tr>		
	  </tbody>
	  <!--목록 한묶음  종료-->
	  
	  <!--목록 한묶음  시작-->
	  <tbody>
	    <tr style = "color : #5e5e5e;">
		  <td>위탁</td>
		  <td rowspan="3"><img src="resources/images/person_3.jpg" class="profile_sm1"></td>
		  <td>박기자</td>
		  <td>2020.06.01 11:00</td>
		  <td rowspan="3">1</td>
		  <td rowspan="3">30,000원</td>
		  <td rowspan="3"><input type="button" class="review_complete" value="답글 남기기 완료"></td>
		</tr>
			
		<tr style = "color : #5e5e5e;">
		  <td><b>돌봄 완료</b></td>
		  <td><b>닉네임33</b></td>
		  <td>~</td>
		</tr>
			
		<tr style = "color : #5e5e5e;">
		  <td class="grade">신고</td>
		  <td>010.3333.3333</td>
		  <td>2020.06.02 19:00</td>
		</tr>		
	  </tbody>
	  <!--목록 한묶음  종료-->
	</table>	
  </div>
</section>
<!-- 이용현황 및 내역 끝!!-->



<!-- 페이지네이션 시작!!-->
<!-- 페이지네이션 끝!! -->





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
		
		<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.sticky.js"/>"></script>	

    <script src="<c:url value="./resources/js/aos.js"/>"></script><!-- nav 상단바 반응형웹 적용1 -->

    <script src="<c:url value="/resources/js/main.js"/>"></script><!-- nav 상단바 반응형웹 적용2 -->
      
      
      
      
     

 


</body>
</html>