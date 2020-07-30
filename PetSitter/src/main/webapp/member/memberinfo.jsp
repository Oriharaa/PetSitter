<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.pay.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.spring.petsitter.MemberController.*" %>
<%
	List<PayVO> pvo = (List<PayVO>)request.getAttribute("pvolist");
	MemberVO membervo = (MemberVO)request.getAttribute("membervo");
	ArrayList<PetsitterVO> petsitterlist = (ArrayList<PetsitterVO>)request.getAttribute("petsitterlist");
	ArrayList<UsinglistVO> usinglist = (ArrayList<UsinglistVO>)request.getAttribute("usinglist");
	int review_count = ((Integer)request.getAttribute("review_count")).intValue();
	String tel = (String)request.getAttribute("tel");
	String[] address = (String[])request.getAttribute("address");
	if(address[0].equals("N")){
		address[0] = "";
	}
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	String gender = membervo.getMEMBER_GENDER();
	String man = "";
	String woman = "";
	if(gender.equals("남")){
		man = "checked";
	}
	if(gender.equals("여")){
		woman = "checked";
	}
	String nickname = "";
	if(!membervo.getMEMBER_NICKNAME().equals("N")){
		nickname = membervo.getMEMBER_NICKNAME();
	}
	
%>
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

	  
	.profile {
    width: 183px;
    height: 183px; 
    border-radius: 70%;
    overflow: hidden;
    margin-bottom : 10%;
	}  

	.profile_sm1{
		width: 100px;
    height: 100px; 
    border-radius: 70%;
    overflow: hidden;
    margin : 10px auto;
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
	
	
	.list {
	margin:0 0  200px 0 ;}
	
	.review_write {
	font-size : 15px;
	border:0;
	color : white;
	background-color:rgb(83,220,152);
	}
	.review_write:hover {
	font-weight : bold;
	}
	
	
	.review_complete {
	font-size : 15px;
	border:0;
	color : #707070;
	background-color:rgb(224, 224, 224);
	border-radius : 3px;
	width : 90px;
	margin : 0 0 0 17px;
	}
	
	.pet_talk {
	font-size : 15px;
	border:0;
	color:#ffffff; 
	background-color:rgba(83,220,152);
	}
	
	.pet_talk:hover {
	font-weight : bold;
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
	
	.modalprofileimg {
	widht : 100px;
	height : 100px;
	border-radius : 5px;
	}
	
	.tleft {
	text-align : left;
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
	
	choiceS{ 
	text-align : center; 
	font-size : 15px;
	border : 0px solid #ffffff;
}
	
	
	/*모달 버튼 시작*/
	.modalbt01 {
	background : rgb(224, 224, 224)!important;
	}
	
	.modalbt02 {
	background : rgb(83,220,152)!important;
	color : #ffffff!important;
	}

	.modalbt03 {
	background : rgb(83,220,152)!important;
	color : #ffffff!important;
	width : 100px;
	text-align : center;
	}
	/*모달 버튼 종료*/
	
		/*테이블 css 시작*/
	th, td {
	color : #5e5e5e!important;
	font-size : 15px;
	}
			
	/*nth-child(1) 칼럼 순서 불러서 css 입혀준다.*/
	th:nth-child(1), th:nth-child(2), th:nth-child(3), th:nth-child(4), th:nth-child(5) {
	}
		
	td:nth-child(1), td:nth-child(2), td:nth-child(4), td:nth-child(5) {
	}
	
	.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
	background-color: #F8F8F8;
	}
	/*테이블 css 종료*/
	
	/*파일 선택 css 시작*/
	.filebox input[type="file"] { 
	position: absolute;
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); border: 0; 
	} 
	
	.filebox label { 
	display: inline-block; 
	padding: .5em .75em; 
	margin : 0;
	color: #ffffff; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: rgb(83,220,152); 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em; 
	} 
	/*파일 선택 css 종료*/
	
	/* named upload */ 
	.filebox .upload-name { 
	display: inline-block; 
	padding: .5em .75em; 
	/* label의 패딩값과 일치 */ 
	font-size: inherit; 
  line-height: normal; 
  vertical-align: middle; 
  background-color: #f5f5f5; 
  border: 1px solid #ebebeb; 
  border-bottom-color: #e2e2e2; 
  border-radius: .25em; 
  -webkit-appearance: none; 
  /* 네이티브 외형 감추기 */ 
  -moz-appearance: none; 
  appearance: none; 
  }
	/*파일 선택 css 종료*/

	
	/*ajax 에서 사진 가운데 와 크기(규격)지정 css 시작*/
	.thumbnail-wrappper { 
	width: 25%;
	} 
	.thumbnail { 
	position: relative; 
	padding-top: 100%; /*한번 만져보기 전에 max-width 먼저 수정 */ 
	overflow: hidden;
	} 
	.thumbnail .centered { 
	position: absolute; 
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0; 
	-webkit-transform: translate(50%,50%); 
	-ms-transform: translate(50%,50%); 
	transform: translate(50%,50%); } 
	.thumbnail .centered img { 
	position: absolute; 
	top: 0; 
	left: 0; 
	max-width: 100px; /*사이즈 비율 조정*/
	height: auto; 
	-webkit-transform: translate(-50%,-50%); 
	-ms-transform: translate(-50%,-50%);
	 transform: translate(-50%,-50%); }
	/*ajax 에서 사진 가운데 와 크기(규격) 지정 css 종료*/
	
	/*메인 버튼 css 시작*/
	.mybtn {
	background : rgba(83,220,152)!important;
	border : 0;
	outline : 0;
	border-radius: 3px;
	}
	.mybtn:hover { 
	font-weight : bold;
	}
	
	.mybtn:focus { 
	border : 0;
	outline : none;
	}
	/*메인 버튼  css종료*/
	
	/*a테그 호버 css */
	a:hover {
	font-weight : bold;
	}
	  
</style>

<style>
	.img_wrap {
		overflow: hidden;
		display: flex;
		align-items: center;
		justify-content: center;
		width: 130px;
		height: 100px;
  }

  .img_wrap profile_img{
  	max-width:100%;
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
    <title>회원 정보</title>
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
  
  	<!-- 데이트피커ver.2(bootstrap_design) -->  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">

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
                <a href="memberinfo.me"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
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

<!-- 상세정보 시작!! -->
<section class="myinfo">
  <div class="container" style="margin-top: 60px;">
    <div class="row">
	  <div class="col-md-7" style="padding: 0;">
	    <div class="box1">
		    <div class="row">
		      <div class="col-5" style="margin: 3.5% 0 0 0;">  
			    <div class="roundimg">
				  <div class="profile aspect_1_1" style="background: #BDBDBD;">
				  <%
				  	if(membervo.getMEMBER_PHOTO_FILE().equals("N")) {
				  %>
				  	<img src="resources/images/defaultprofile.jpg.jpg">
				  <%} else { %>
						<img src="/filepath/${membervo.MEMBER_PHOTO_FILE }" >
					<%} %>

				  </div>
				</div>
			  </div> 
			  <div class="col-7" style = "padding : 0;">
			  	 <h3 class="mypage font-size-24">MY PAGE</h3>
			    <div class="mpbody">
				  <div class="row" style = "margin-to">
				  <div class = "col-04" style = "padding : 0 15px;">
				  	<%
				  		if(nickname.equals("")) {
				  	%>
				  	<h2 class="mpname float-left">닉네임</h2>
				  	<%
				  		} else {
				  	%>
				    <h2 class="mpname float-left"><%=nickname %></h2>
				    <%
				  		}
				    %>
				    <%
				    	if(membervo.getMEMBER_RANK().equals("Green")) {
				    %>
				    	<h3 class="mpnick" style="margin-top: 60px;">${name } &nbsp;<img src="resources/images/rank_green.png" style="width: 25px; height: 25px;"></h3>
				    <%
				    	} else if(membervo.getMEMBER_RANK().equals("Gold")) {
				    %>
				   		<h3 class="mpnick" style="margin-top: 60px;">${name } &nbsp;<img src="resources/images/rank_gold.png" style="width: 25px; height: 25px;"></h3>
				    <%
				    	} else if(membervo.getMEMBER_RANK().equals("VIP")) { 
				    %>
				    	<h3 class="mpnick" style="margin-top: 60px;">${name } &nbsp;<img src="resources/images/rank_vip.png" style="width: 25px; height: 25px;"></h3>
				    <%
				    	} 
				    %>
				    <h5 class="mpdate font-size-16" id="memberdate">가입일 &nbsp;<%=membervo.getMEMBER_DATE().substring(0,10) %></h5>
				  </div>
				  <div class = "col-md-5" style = "margin-top : 50px;">
				  	<!-- <a href="petRegister.me" class="font-size-16 main_whitefont">마이펫 현황</a> -->
				  	<a href="myPet.me" class="font-size-16 main_whitefont">마이펫 현황</a>
				  	<button type="button" style = "padding : 0;" class="font-size-16 main_whitefont mybtn" data-toggle="modal" data-target="#staticBackdrop">
						회원정보 변경
						</button>
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
				<h5 class="font-size-15">이용 횟수 : <%=membervo.getMEMBER_COUNT() %></h5>
				</div>
				<div class = "col-6">
				<h5 class="font-size-15">후기 작성 : <%=review_count %></h5>
				</div>
				<div class = "col-12">
				<hr class ="line" color="#949494" width="100%">
				</div>
				<div class = "col-6">
				<h5 class="font-size-15">할인 쿠폰 : 0</h5>
				</div>
				<div class = "col-6">
				<h5 class="font-size-15">포인트 : 0</h5>
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
		<input type="button" class="middle_bt1" id="middle_bt1" value="1개월" onclick="usinglistfunc(1, 1)">
		<input type="button" class="middle_bt1" id="middle_bt2" value="3개월" onclick="usinglistfunc(3, 1)">
		<input type="button" class="middle_bt1" id="middle_bt3" value="6개월" onclick="usinglistfunc(6, 1)">
		<input type="button" class="middle_bt1" id="middle_bt4" value="전체 시기" onclick="selectData(1)" >
			
		<input type="text" class="middle_bt2_date" id="datePicker_start" placeholder="시작일" size="10px" style="text-align: center;" readonly>
		<input type="text" class="middle_bt2_date" id="datePicker_end" placeholder="종료일" size="10px" style="text-align: center;" readonly>
		<input type="button" class="middle_bt2" id="middle_bt7" value="조회" onclick="calendarUsinglist(1);">

	  </div>
	</div>
		
			
  <table style="width:100%;">
 	<colgroup>
	  <col style="width: 15%;">
	  <col style="width: 15%;">
	  <col style="width: 15%;">
	  <col style="width: 15%;">
	  <col style="width: 12%;">
	  <col style="width: 12%;">
	  <col style="width: 16%;">
	</colgroup> 
      <thead>
		<tr class="table_headRow" style="color: #5e5e5e;">
		  <td>진행 현황</td>
		  <td id="td1">펫시터 사진</td>
		  <td>펫시터 정보</td>
		  <td>이용 일자</td>
		  <td>주문 번호</td>
		  <td>이용 금액</td>
		  <td>소통 게시판</td>
		</tr>	
	  </thead>
	  <tbody id="petsitterList">
	  	<input type="hidden" id="id" value=${id } >
	  </tbody>
	</table>
  </div>
  <table id="pagenum_table" class="col-md-12 text-center">
	  
  </table>
</section>
<!-- 이용현황 및 내역 끝!!-->


<!-- Modal 회원정보변경시작-->
<form name="updateMember" action="./memberUpdate.me" method="post" enctype="multipart/form-data">
<input type="hidden" name="MEMBER_ID" id="session_id" value=${id }> 
<div class="modal fade" id="staticBackdrop" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title main_mintfont" id="staticBackdropLabel">회원정보변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-12">
      			<table class="table table-sm table-hover table-striped" style="font-size: 15px;">
      				<tr>
      					<th width="200px">닉네임</th>
      					<td colspan="2" >
      						<input type="text" value="<%=nickname %>" size="12" name="MEMBER_NICKNAME" class="float-left">
      					</td>
      				</tr>
      				<tr>
      					<th width="200px">성별</th>
      					<td colspan="2" >
      						<label for="man" class="float-left" style="margin: 0;">남&nbsp;</label>
      						<input type="radio" value="남" id="man" name="MEMBER_GENDER" class="float-left" style="margin-top: 6px;" <%=man %>>
      						<label for="woman" class="float-left" style="margin: 0;">&emsp;여&nbsp;</label>
      						<input type="radio" value="여" id="woman" name="MEMBER_GENDER" class="float-left" style="margin-top: 6px;" <%=woman%>>
      					</td>
      				</tr>
      				<tr>
      					<th width="200px">비밀번호</th>
      					<td colspan="2">
      						<input type="password" name="MEMBER_PW" id="pw1" value=<%=membervo.getMEMBER_PW() %> size="20" class="float-left">
      					</td>
      				</tr>
      				<tr>
      					<th width="200px">비밀번호 확인</th>
      					<td colspan="2">
	      					<input type="password" size ="20" id="pw2" value = <%=membervo.getMEMBER_PW() %> class="float-left">
	      					<input class="alert alert-danger" value="비밀 번호가 일치하지 않습니다." style="padding: 4px; margin-bottom: 0; width: 250px; height: 31px; text-align: center;">
      					</td>
      				</tr>
							<tr>
      					<th width="200px">주소</th>
      					<td colspan="2">
      						<input type="text" placeholder="우편 번호 검색" size="15" name="MEMBER_ADDRESS" class="float-left" id="sample4_postcode" value="${address[0] }" readonly>
      						
      						<input type="button" class="btn modalbt03 float-left" onclick="sample4_execDaumPostcode();" value="우편 번호 검색" style="width: 130px; padding: 2.5px;" >
      					</td>
      				</tr>
      				<tr>
      					<th width="200px"></th>
      					<td colspan="2">
      						<input type="text" placeholder="도로명 주소" size="30" name="MEMBER_ADDRESS" id="sample4_roadAddress" class="float-left" value="${address[1] }" readonly>
      						<input type="hidden" id="guide" style="color:#999;display:none">
      					<input type="hidden" id="sample4_extraAddress" class="inpt" placeholder="참고항목" readonly>
      					<input type="hidden" id="sample4_jibunAddress" class="inpt" placeholder="지번주소" readonly>
      					</td>
      				</tr>
      				<tr>
      					<th width="200px"></th>
      					<td colspan="2">
      						<input type="text" placeholder="상세 주소" size="30" name="MEMBER_ADDRESS" class="float-left" value="${address[2] }">
      					</td>
      				</tr>
      				<tr>
      					<th width="200px">전화 번호</th>
      					<td colspan="2" class="float-left">
      						<input type="text" size="11" name="MEMBER_TEL" value="${tel}">
      					</td>
      				</tr>
      				<tr>
      					<th width="200px">프로필 사진</th>
      					<td colspan="2">
									<div class="img_wrap">
										<%
											if(membervo.getMEMBER_PHOTO_FILE().equals("N")) {
										%>
											<img src="resources/images/defaultprofile.jpg.jpg" id="profile_img" class="profile_img" style="display: none; width: 130px;"/>
										<%} else { %>
											<img src="/filepath/${membervo.MEMBER_PHOTO_FILE }" id="profile_img" class="profile_img" style="width: 130px;"/>
										<%} %>
									</div>
	      					<div class="filebox float-left"> 
		      					<input type="text" class="upload-name" value="파일선택" disabled="disabled" > 
		      					<label for="ex_filename">업로드</label><input type="file" id="ex_filename" class="upload-hidden" name="MEMBER_PHOTO" style="padding: 2.5px;">
		      					<img src="resources/images/deleteimage.jpg" id="deleteimg" onclick="deleteImage()" style="position: absolute; width: 20px; margin-top: 16px; opacity: 0.5;" 
		      							onmouseover="this.style.opacity='1'" onmouseout="this.style.opacity='0.5'"/>
	      					</div>
      					</td>
      				</tr>      				
       			</table>
      		</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn modalbt01" data-dismiss="modal" style="padding: 2.5px;">닫기</button>
        <button type="submit" class="btn modalbt02" id="updatebutton" style="padding: 2.5px;">확인</button>
      </div>
    </div>
  </div>
</div>
</form>
<!-- Modal 회원정보변경종료-->



<!-- Modal 후기 남기기 시작-->
<form name="insertReview" action="./insertReview.me" method="post" enctype="multipart/form-data">
<div class="modal fade" id="staticBackdrop02" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title main_mintfont" id="staticBackdropLabel">후기 남기기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-3">
      			<div class="float-left" style="margin: 2px 0 0 10%;"><img src="" class="modalprofileimg"></div>
      		</div>
      		<div class="col-7">
						<div class="float-left" style="padding: 3px 0 0 3px; margin-left: 10px;">
							<table>
								<tr>
									<td colspan="2" class="font-size-15 main_grayfont3 mybold tleft" id="petsitter_nickname" style="font-weight: bold;">
										<input type="hidden" name="PETSITTER_NICKNAME" id="petsitter_nickname_input">
									</td>
								</tr>
								<tr>
									<td colspan="2" class="font-size-15 main_grayfont3 mybold tleft" id="petsitter_address">
										<input type="hidden" name="PETSITTER_ADDRESS" id="petsitter_address_input">
									</td>
								</tr>
								<tr>
									<td id="modal_star" >
									</td>
									<td id="modal_score" style="padding: 0 0 5px 10px;"></td>
								</tr>
							</table>
						</div>	
      		</div>
      		<div class="col-12" style="padding : 0;">
      			<hr/>
      		</div>
      		<div class="col-12">
      			<table style="margin-bottom: 10px;">
      				<tr>
      					<th width="80px">아이디 </th>
      					<td class="tleft">${id }
      						<input type="hidden" name="MEMBER_ID" value="${id }">
      						<input type="hidden" name="PETSITTER_ID" value="">
      						<input type="hidden" name="USINGLIST_NUM" value="">
      					</td>
      				</tr>
      				<tr>
      					<th>평점 </th>
								<td>
									<input type="hidden" name="REVIEW_SCORE" value=5>
									<div style="width: 144px;" class="tzSelect">
										<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown" style="float: left; padding: 6px 0px;">
											<div id="starmenu" style="float: left; display: flex;">
												<img src="resources/images/star.png" width="18px" height="18px">
							        	<img src="resources/images/star.png" width="18px" height="18px">
							        	<img src="resources/images/star.png" width="18px" height="18px">
							        	<img src="resources/images/star.png" width="18px" height="18px">
							        	<img src="resources/images/star.png" width="18px" height="18px">
						        	</div>
  										<span class="caret"></span>
  									</button>
								    <ul class="dropdown-menu" aria-labelledby="menu1" style="list-style: none; padding: 0px; float: left;">
								        <li id="starstar5" style="display: flex; padding-bottom: 5px;" onclick="insertstar5()">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								       	</li>
								        <li id="starstar4_5" style="display: flex; padding-bottom: 5px;" onclick="insertstar4_5()">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/starhalf.png" width="18px" height="18px">
								        </li>
								        <li id="starstar4" style="display: flex; padding-bottom: 5px;" onclick="insertstar4()">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        </li>
								        <li id="starstar3_5" style="display: flex; padding-bottom: 5px;" onclick="insertstar3_5()">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/starhalf.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        </li>
								        <li id="starstar3" style="display: flex; padding-bottom: 5px;" onclick="insertstar3()">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        </li>
								        <li id="starstar2_5" style="display: flex; padding-bottom: 5px;" onclick="insertstar2_5()">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/starhalf.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        </li>
								        <li id="starstar2" style="display: flex; padding-bottom: 5px;" onclick="insertstar2()">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        </li>
								        <li id="starstar1_5" style="display: flex; padding-bottom: 5px;" onclick="insertstar1_5()">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/starhalf.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        </li>
								        <li id="starstar1" style="display: flex; padding-bottom: 5px;" onclick="insertstar1()">
								        	<img src="resources/images/star.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        </li>
								        <li id="starstar0_5" style="display: flex; padding-bottom: 5px;" onclick="insertstar0_5()">
								        	<img src="resources/images/starhalf.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        	<img src="resources/images/star_empty.png" width="18px" height="18px">
								        </li>
								    </ul>
								</div>
								</td>
      				</tr>
							<tr>
								<th>후기 </th>
								<td><textarea name="REVIEW_CONTENT" style="width: 380px; height: 100px; font-size: 12px;"></textarea></td>
							</tr>
							<tr>
								<th colspan="2" class="font-size-13" style="padding-top: 10px;">자신의 강아지 사진을 어필해보세요(후기 게시판에서 확인할 수 있어요!)</th>
							</tr>
							<tr>
      					<th>메인 사진 </th>
      					<td class = "tleft">
	      					<div class="filebox"> 
		      					<div class="img_wrap">
													<img id="profile_img02" class="profile_img02" style="display: none; width: 130px;"/>
										</div>
		      					<input class="upload-name02" value="파일선택" disabled="disabled"> 
		      					<label for="ex_filename02">업로드</label><input type="file" name="REVIEW_PHOTO" id="ex_filename02" class="upload-hidden">
		      					<img src="resources/images/deleteimage.jpg" id="deleteimg2" onclick="deleteImage2()" 
		      							style="position: absolute; width: 20px; margin-top: 16px; opacity: 0.5;" onmouseover="this.style.opacity='1'" onmouseout="this.style.opacity='0.5'"/> 
	      					</div>
      					</td>
      				</tr>
      				<tr>
      					<th>사진 1 </th>
      					<td class = "tleft">
	      					<div class="filebox">
		      					<div class="img_wrap">
													<img id="profile_img03" class="profile_img03" style="display: none; width: 130px;"/>
										</div> 
		      					<input class="upload-name03" value="파일선택" disabled="disabled"> 
		      					<label for="ex_filename03">업로드</label><input type="file" name="REVIEW_PHOTO" id="ex_filename03" class="upload-hidden">
		      					<img src="resources/images/deleteimage.jpg" id="deleteimg3" onclick="deleteImage3()" 
		      							style="position: absolute; width: 20px; margin-top: 16px; opacity: 0.5;" onmouseover="this.style.opacity='1'" onmouseout="this.style.opacity='0.5'"/>
	      					</div>
      					</td>
      				</tr>
      				<tr>
      					<th>사진 2 </th>
      					<td class = "tleft">
	      					<div class="filebox">
		      					<div class="img_wrap">
													<img id="profile_img04" class="profile_img04" style="display: none; width: 130px;"/>
										</div>
		      					<input class="upload-name04" value="파일선택" disabled="disabled"> 
		      					<label for="ex_filename04">업로드</label><input type="file" name="REVIEW_PHOTO" id="ex_filename04" class="upload-hidden">
		      					<img src="resources/images/deleteimage.jpg" id="deleteimg4" onclick="deleteImage4()" 
		      							style="position: absolute; width: 20px; margin-top: 16px; opacity: 0.5;" onmouseover="this.style.opacity='1'" onmouseout="this.style.opacity='0.5'"/>
	      					</div>
      					</td>
      				</tr>
      							
      			</table>
      		</div>
      		
        </div>
      </div>
     
      <div class="modal-footer">
        <button type="button" class="btn modalbt01" data-dismiss="modal">닫기</button>
        <button type="submit" class="btn modalbt02">확인</button>
      </div>
    </div>
  </div>
</div>
</form>
<!-- Modal 후기 남기기종료-->

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
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
	
		<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.sticky.js"/>"></script>	

    <script src="<c:url value="./resources/js/aos.js"/>"></script><!-- nav 상단바 반응형웹 적용1 -->

    <script src="<c:url value="/resources/js/main.js"/>"></script><!-- nav 상단바 반응형웹 적용2 -->
      
		<!-- 모달 구현 제이쿼리(부트스트랩용) 회원정보 수정 시작-->
    <script type="text/javascript">
    $('#myModal').on('shown.bs.modal', function () {
    	  $('#myInput').trigger('focus')
    	})
    </script>
    <!-- 모달 구현 제이쿼리(부트스트랩용) 회원정보 수정 종료-->
    
    <!-- 모달 구현 제이쿼리(부트스트랩용) 후기 남기기 시작-->
    <script type="text/javascript">
    $('#myModal').on('shown.bs.modal', function () {
    	  $('#myInput').trigger('focus')
    	})
    </script>
    <!-- 모달 구현 제이쿼리(부트스트랩용) 후기 남기기 종료-->
    
		<!-- 주소 창 불러오기 api 시작-->    
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("sample4_extraAddress").value = '';
	                }

	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
		</script>
		<!-- 주소 창 불러오기 api 종료-->
		
		<!-- 파일 업로드1 (회원정보관리용)시작  -->
		<script type="text/javascript">
		$(document).ready(function() { 
			var fileTarget = $('.filebox .upload-hidden'); 
			fileTarget.on('change', function() { // 값이 변경되면
				if(window.FileReader) { // modern browser 
				var filename = $(this)[0].files[0].name;
				console.log(filename);
				} else { 
				// old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			  } 
			
				// 추출한 파일명 삽입
				$(this).siblings('.upload-name').val(filename); 
		  }); 
		});
		</script>
		<!-- 파일 업로드 -->
		

		<script type="text/javascript">
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
			  
			  /* var btn = document.querySelector('#btnToggleOverflow');
			  btn.click(function() {
			    var val = divs[0].style.overflow == 'hidden' ? 'visible' : 'hidden';
			    for (var i = 0; i < divs.length; ++i)
			      divs[i].style.overflow = val;
			  }); */
			};
			/*사진 가로 세로 이미지 크기 맞추고 가운데 위치로 보이게 하기  종료*/ 
	  </script>
		
		<script>
		/* 비밀번호와 비밀번호 확인 불일치 수정 버튼 잠금 함수 */
			$(function() {
				$(".alert-danger").hide();
				
				$("#pw2").on("keyup", function() {
					let pw1 = $("#pw1").val();
					let pw2 = $("#pw2").val();
					if(pw1 !== pw2) {
						$(".alert-danger").show();
						$("#updatebutton").attr("disabled", true);
					} else {
						$(".alert-danger").hide();
						$("#updatebutton").attr("disabled", false);
					}
				});
				
			});
		</script>
	
	<!-- 데이트피커 코드 -->
	<script>
	$(function() {
			$('#datePicker_start').datepicker({
				format: "yyyy-mm-dd", // 날짜 형식 포맷
				language: "ko", // 언어
				autoclose: true, // 날짜 선택하면 자동으로 닫힘
				orientation: "bottom auto",
				todayHighlight: true,
				disableTouchKeyboard: false //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			});
			
			$('#datePicker_end').datepicker({
				format: "yyyy-mm-dd", // 날짜 형식 포맷
				language: "ko", // 언어
				autoclose: true, // 날짜 선택하면 자동으로 닫힘
				orientation: "bottom auto",
				todayHighlight: true,
				disableTouchKeyboard: false //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			});
	});
	</script>
		
		<script>
		/* 전체 목록 출력 함수 */
			function selectData(page) {
				$('#petsitterList').empty();
				$('#pagenum_table').empty();
				
				let listcount = <%=listcount %>;
				
				$.ajax({
					url: '/petsitter/getUsingList.bo',
					type: 'post',
					data: {
						id : '${id}',
						page: page
					},
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						let nowpage = page;
						let maxpage = parseInt(listcount / 5 + 0.95);
						let startpage = (parseInt((page / 10 + 0.9)) - 1) * 10 + 1;
						let endpage = maxpage;
						if(endpage > startpage + 10 - 1) {
							endpage = startpage + 10 - 1;
						}
						
						$.each(data, function(index, item) {
							let ing1 = '현재 이용중';
							let ing2 = '펫시터와의 소통';
							let ing3 = '리뷰 남기기';
							
							var output = '';
							if(index >= 5 * (page - 1) && index <= 4 + 5 * (page - 1)) {
								output += '<tr style="color: #5e5e5e; border-top: 1px dashed gray;">';
								output += '<td>' + item.list_TYPE + '</td>';
								output += '<td rowspan="3">';
								output += '<div class="thumbnail-wrapper profile_sm1"> <div class="thumbnail"> <div class="centered">';
								if(item.petsitter_PHOTO_PROFILE_FILE === 'N') {
									output += '<img src="resources/images/defaultprofile02.png.png">';
								} else {
									output += '<img src="/filepath/' + item.petsitter_PHOTO_PROFILE_FILE +'">';
								}
								output += '</div></div></div>';
								output += '</td>';
								output += '<td>' + item.petsitter_NICKNAME + '</td>';
								output += '<td>' + item.list_START_DATE + '</td>';
								output += '<td rowspan="3">' + item.list_NUM + '</td>';
								output += '<td rowspan="3">' + item.list_PRICE + '</td>';
								if(item.list_COMPLETE === ing2) {
									output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" onclick="location.href=\'communication_member.bo?usinglist_num=' + item.list_NUM + '\';" ></td>';
								} else if(item.list_COMPLETE === ing3) {
									output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" id="review_modal'+index+'" value="' + item.list_COMPLETE + '" data-toggle="modal" data-target="#staticBackdrop02" onclick="showing('+index+')">';
									output += '<input type="hidden" id="review_petsitter'+index+'" value="' + item.petsitter_NICKNAME + '">';
									output += '<input type="hidden" id="review_petsitter_address'+index+'" value="' + item.petsitter_ADDRESS1 + '">';
									output += '<input type="hidden" id="review_petsitter_photo'+index+'" value="' + item.petsitter_PHOTO_PROFILE_FILE + '">';
									output += '<input type="hidden" id="review_petsitter_score'+index+'" value="' + item.petsitter_SCORE + '">';
									output += '<input type="hidden" id="review_petsitter_id'+index+'" value="' + item.petsitter_ID + '">';
									output += '<input type="hidden" id="review_usinglist_num'+index+'" value="' + item.list_NUM + '">';
									output += '</td>';
								} else if(item.list_COMPLETE === '예약 취소') {
									if(item.list_ING === '예약 취소') {
										output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" disabled="disabled" style="opacity: 0.5;"></td>';
									} else {
										output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" style="background: #03adfc !important;" onclick="location.href=\'cancel.br?merchant_uid=' + item.merchant_UID + '\'"></td>';
									}
								} else {
									output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" disabled="disabled" style="opacity: 0.5;"></td>';
								}
								
								output += '<tr style="color: #5e5e5e;">';
								if(item.list_ING === ing1) {
									output += '<td><b style="color: #0d47a1;">' + item.list_ING + '</b></td>';
								} else if(item.list_ING === '위탁 대기 중' || item.list_ING === '방문 대기 중') {
									output += '<td><b style="color: #03adfc;">' + item.list_ING + '</b></td>';
								} else if(item.list_ING === '예약 취소') {
									output += '<td><b>' + item.list_ING + '</b></td>';
								} 
								else {
									output += '<td><b>' + item.list_ING + '</b></td>';
								}
								output += '<td><b>' + item.petsitter_NAME + '</b></td>';
								output += '<td>~</td>';
								output += '</tr>';
								output += '<tr style="color: #5e5e5e;">';
								output += '<td class="grade" style="margin-bottom: 5px;">신고</td>';
								output += '<td>' + item.petsitter_TEL + '</td>';
								output += '<td>' + item.list_END_DATE + '</td>';
								output += '</tr>';
								
								if(item.list_ING === ing1) {
									$('#petsitterList').prepend(output);
								} else {
									$('#petsitterList').append(output);
								}
							} else {
								return true;
							}
						});
						
						pagenum = '';
						pagenum += '<tr class="table_page_number">';
						pagenum += '<td colspan=7 style="font-family:Tahoma;font-size:10pt;">';
						if(nowpage <= 1) {
							pagenum += '<&nbsp;&nbsp;';
						} else {
							pagenum += '<a href="javascript:selectData(' + (nowpage - 1) + ')" >' + '<&nbsp;&nbsp;' + '</a>';
						}
						for(let a = startpage; a <= endpage; a++) {
							if(a === nowpage) {
								pagenum += a + '&nbsp;&nbsp';
							} else {
								pagenum += '<a href="javascript:selectData(' + a + ')" >' + a + '&nbsp;&nbsp;</a>';
							}
						}
						if(nowpage >= maxpage) {
							pagenum += '>';
						} else {
							pagenum += '<a href="javascript:selectData(' + (nowpage + 1) + ')" >' + '>' + '</a>';
						}
						pagenum += '</td>';
						pagenum += '</tr>';
						
						$('#pagenum_table').append(pagenum);
					},
					error: function(request,status,error) {
						alert("ajax 통신 실패!");
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				});
			}
			
			/* n개월 버튼 클릭 함수 */
			function usinglistfunc(month, page) {
				$('#petsitterList').empty();
				$('#pagenum_table').empty();
				
				$.ajax({
					url: '/petsitter/getUsingList_month.bo',
					type: 'post',
					data: {
						id : '${id}', 
						month: month, 
						page: page
					},
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						let listcount = data.length;
						let nowpage = page;
						let maxpage = parseInt(listcount / 5 + 0.95);
						let startpage = (parseInt((page / 10 + 0.9)) - 1) * 10 + 1;
						let endpage = maxpage;
						if(endpage > startpage + 10 - 1) {
							endpage = startpage + 10 - 1;
						}
						
						$.each(data, function(index, item) {
							if(index >= 5 * (page - 1) && index <= 4 + 5 * (page - 1)) {
								let ing1 = '현재 이용중';
								let ing2 = '펫시터와의 소통';
								let ing3 = '리뷰 남기기';
								var output = '';
								output += '<tr style="color: #5e5e5e; border-top: 1px dashed gray;">';
								output += '<td>' + item.list_TYPE + '</td>';
								output += '<td rowspan="3">';
								output += '<div class="thumbnail-wrapper profile_sm1"> <div class="thumbnail"> <div class="centered">';
								if(item.petsitter_PHOTO_PROFILE_FILE === 'N') {
									output += '<img src="resources/images/defaultprofile02.png.png">';
								} else {
									output += '<img src="/filepath/' + item.petsitter_PHOTO_PROFILE_FILE +'">';
								}
								output += '</div></div></div>';
								output += '</td>';
								output += '<td>' + item.petsitter_NICKNAME + '</td>';
								output += '<td>' + item.list_START_DATE + '</td>';
								output += '<td rowspan="3">' + item.list_NUM + '</td>';
								output += '<td rowspan="3">' + item.list_PRICE + '</td>';
								if(item.list_COMPLETE === ing2) {
									output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" onclick="location.href=\'communication_member.bo?usinglist_num=' + item.list_NUM + '\';" ></td>';
								} else if(item.list_COMPLETE === ing3) {
									output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" id="review_modal'+index+'" value="' + item.list_COMPLETE + '" data-toggle="modal" data-target="#staticBackdrop02" onclick="showing('+index+')">';
									output += '<input type="hidden" id="review_petsitter'+index+'" value="' + item.petsitter_NICKNAME + '">';
									output += '<input type="hidden" id="review_petsitter_address'+index+'" value="' + item.petsitter_ADDRESS1 + '">';
									output += '<input type="hidden" id="review_petsitter_photo'+index+'" value="' + item.petsitter_PHOTO_PROFILE_FILE + '">';
									output += '<input type="hidden" id="review_petsitter_score'+index+'" value="' + item.petsitter_SCORE + '">';
									output += '<input type="hidden" id="review_petsitter_id'+index+'" value="' + item.petsitter_ID + '">';
									output += '<input type="hidden" id="review_usinglist_num'+index+'" value="' + item.list_NUM + '">';
									output += '</td>';
								} else if(item.list_COMPLETE === '예약 취소') {
									if(item.list_ING === '예약 취소') {
										output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" disabled="disabled" style="opacity: 0.5;"></td>';
									} else {
										output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" style="background: #03adfc !important;" onclick="location.href=\'cancel.br?merchant_uid=' + item.merchant_UID + '\'"></td>';
									}
								} else {
									output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" disabled="disabled" style="opacity: 0.5;"></td>';
								}
								
								output += '<tr style="color: #5e5e5e;">';
								if(item.list_ING === ing1) {
									output += '<td><b style="color: #0d47a1;">' + item.list_ING + '</b></td>';
								} else if(item.list_ING === '위탁 대기 중' || item.list_ING === '방문 대기 중') {
									output += '<td><b style="color: #03adfc;">' + item.list_ING + '</b></td>';
								} else if(item.list_ING === '예약 취소') {
									output += '<td><b>' + item.list_ING + '</b></td>';
								} 
								else {
									output += '<td><b>' + item.list_ING + '</b></td>';
								}
								output += '<td><b>' + item.petsitter_NAME + '</b></td>';
								output += '<td>~</td>';
								output += '</tr>';
								output += '<tr style="color: #5e5e5e;">';
								output += '<td class="grade" style="margin-bottom: 5px;">신고</td>';
								output += '<td>' + item.petsitter_TEL + '</td>';
								output += '<td>' + item.list_END_DATE + '</td>';
								output += '</tr>';
								
								if(item.list_ING === ing1) {
									$('#petsitterList').prepend(output);
								} else {
									$('#petsitterList').append(output);
								}
							} else {
								return true;
							}
						});
						
						pagenum = '';
						pagenum += '<tr class="table_page_number">';
						pagenum += '<td colspan=7 style="font-family:Tahoma;font-size:10pt;">';
						if(nowpage <= 1) {
							pagenum += '<&nbsp;&nbsp;';
						} else {
							pagenum += '<a href="javascript:usinglistfunc(' + month + ', ' + (nowpage - 1) + ')" >' + '<&nbsp;&nbsp;' + '</a>';
						}
						for(let a = startpage; a <= endpage; a++) {
							if(a === nowpage) {
								pagenum += a + '&nbsp;&nbsp';
							} else {
								pagenum += '<a href="javascript:usinglistfunc(' + month + ', ' + a + ')" >' + a + '&nbsp;&nbsp;</a>';
							}
						}
						if(nowpage >= maxpage) {
							pagenum += '>';
						} else {
							pagenum += '<a href="javascript:usinglistfunc(' + month + ', ' + (nowpage + 1) + ')" >' + '>' + '</a>';
						}
						pagenum += '</td>';
						pagenum += '</tr>';
						
						$('#pagenum_table').append(pagenum);
					},
					error: function() {
						alert("ajax 통신 실패!");
					}
				});
			}
		
			/* 날짜 선택 후 목록 출력 */
			function calendarUsinglist(page) {
				$('#petsitterList').empty();
				$('#pagenum_table').empty();
				
				let start_date = $("#datePicker_start").val();
				let end_date = $("#datePicker_end").val();
				
				$.ajax({
					url: '/petsitter/getUsingList_calendar.bo',
					type: 'post',
					data: {
						id : '${id}', 
						startdate: start_date,
						enddate: end_date,
						page: page
					},
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						let listcount = data.length;
						let nowpage = page;
						let maxpage = parseInt(listcount / 5 + 0.95);
						let startpage = (parseInt((page / 10 + 0.9)) - 1) * 10 + 1;
						let endpage = maxpage;
						if(endpage > startpage + 10 - 1) {
							endpage = startpage + 10 - 1;
						}
						let num = listcount - ((nowpage - 1) * 5);
						
						$.each(data, function(index, item) {
							if(index >= 5*(page - 1) && index <= 4 + 5*(page - 1)) {
								let ing1 = '현재 이용중';
								let ing2 = '펫시터와의 소통';
								let ing3 = '리뷰 남기기';
								var output = '';
								output += '<tr style="color: #5e5e5e; border-top: 1px dashed gray;">';
								output += '<td>' + item.list_TYPE + '</td>';
								output += '<td rowspan="3">';
								output += '<div class="thumbnail-wrapper profile_sm1"> <div class="thumbnail"> <div class="centered">';
								if(item.petsitter_PHOTO_PROFILE_FILE === 'N') {
									output += '<img src="resources/images/defaultprofile02.png.png">';
								} else {
									output += '<img src="/filepath/' + item.petsitter_PHOTO_PROFILE_FILE +'">';
								}
								output += '</div></div></div>';
								output += '</td>';
								output += '<td>' + item.petsitter_NICKNAME + '</td>';
								output += '<td>' + item.list_START_DATE + '</td>';
								output += '<td rowspan="3">' + item.list_NUM + '</td>';
								output += '<td rowspan="3">' + item.list_PRICE + '</td>';
								if(item.list_COMPLETE === ing2) {
									output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" onclick="location.href=\'communication_member.bo?usinglist_num=' + item.list_NUM + '\';" ></td>';
								} else if(item.list_COMPLETE === ing3) {
									output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" id="review_modal'+index+'" value="' + item.list_COMPLETE + '" data-toggle="modal" data-target="#staticBackdrop02" onclick="showing('+index+')">';
									output += '<input type="hidden" id="review_petsitter'+index+'" value="' + item.petsitter_NICKNAME + '">';
									output += '<input type="hidden" id="review_petsitter_address'+index+'" value="' + item.petsitter_ADDRESS1 + '">';
									output += '<input type="hidden" id="review_petsitter_photo'+index+'" value="' + item.petsitter_PHOTO_PROFILE_FILE + '">';
									output += '<input type="hidden" id="review_petsitter_score'+index+'" value="' + item.petsitter_SCORE + '">';
									output += '<input type="hidden" id="review_petsitter_id'+index+'" value="' + item.petsitter_ID + '">';
									output += '<input type="hidden" id="review_usinglist_num'+index+'" value="' + item.list_NUM + '">';
									output += '</td>';
								} else if(item.list_COMPLETE === '예약 취소') {
									if(item.list_ING === '예약 취소') {
										output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" disabled="disabled" style="opacity: 0.5;"></td>';
									} else {
										output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" style="background: #03adfc !important;" onclick="location.href=\'cancel.br?merchant_uid=' + item.merchant_UID + '\'"></td>';
									}
								} else {
									output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" disabled="disabled" style="opacity: 0.5;"></td>';
								}
								
								output += '<tr style="color: #5e5e5e;">';
								if(item.list_ING === ing1) {
									output += '<td><b style="color: #0d47a1;">' + item.list_ING + '</b></td>';
								} else if(item.list_ING === '위탁 대기 중' || item.list_ING === '방문 대기 중') {
									output += '<td><b style="color: #03adfc;">' + item.list_ING + '</b></td>';
								} else if(item.list_ING === '예약 취소') {
									output += '<td><b>' + item.list_ING + '</b></td>';
								} 
								else {
									output += '<td><b>' + item.list_ING + '</b></td>';
								}
								output += '<td><b>' + item.petsitter_NAME + '</b></td>';
								output += '<td>~</td>';
								output += '</tr>';
								output += '<tr style="color: #5e5e5e;">';
								output += '<td class="grade" style="margin-bottom: 5px;">신고</td>';
								output += '<td>' + item.petsitter_TEL + '</td>';
								output += '<td>' + item.list_END_DATE + '</td>';
								output += '</tr>';
								
								if(item.list_ING === ing1) {
									$('#petsitterList').prepend(output);
								} else {
									$('#petsitterList').append(output);
								}
							} else {
								return true;
							}
						});
						
						pagenum = '';
						pagenum += '<tr class="table_page_number">';
						pagenum += '<td colspan=7 style="font-family:Tahoma;font-size:10pt;">';
						if(nowpage <= 1) {
							pagenum += '<&nbsp;&nbsp;';
						} else {
							pagenum += '<a href="javascript:calendarUsinglist(' + (nowpage - 1) + ')" >' + '<&nbsp;&nbsp;' + '</a>';
						}
						for(let a = startpage; a <= endpage; a++) {
							if(a === nowpage) {
								pagenum += a + '&nbsp;&nbsp';
							} else {
								pagenum += '<a href="javascript:calendarUsinglist(' + a + ')" >' + a + '&nbsp;&nbsp;</a>';
							}
						}
						if(nowpage >= maxpage) {
							pagenum += '>';
						} else {
							pagenum += '<a href="javascript:calendarUsinglist(' + (nowpage + 1) + ')" >' + '>' + '</a>';
						}
						pagenum += '</td>';
						pagenum += '</tr>';
						
						$('#pagenum_table').append(pagenum);
					},
					error: function() {
						alert("ajax 통신 실패!");
					}
				});
			}
			
		
			$(document).ready(function() {
				selectData(1);
				
				let sel_file;
				let sel_file02;
				let sel_file03;
				let sel_file04;
				
				$("#ex_filename").on("change", handleImgFileSelect);
				$("#ex_filename02").on("change", handleImgFileSelect02);
				$("#ex_filename03").on("change", handleImgFileSelect03);
				$("#ex_filename04").on("change", handleImgFileSelect04);
				
				
				
			});
			
			/* 회원정보 수정 모달창에서 미리보기 이미지 파일 삭제 */
			function deleteImage() {
				let profile_file = '<%=membervo.getMEMBER_PHOTO_FILE() %>';
				if(profile_file !== "N") {
					$("#profile_img").attr("src", "/filepath/" + profile_file);
					$("#ex_filename").val($("#ex_filename").prop("defaultValue"));
					$(".upload-name").val($(".upload-name").prop("defaultValue"));
				} else {
					$("#profile_img").attr("src", "resources/images/defaultprofile.jpg.jpg");
					$("#ex_filename").val($("#ex_filename").prop("defaultValue"));
					$(".upload-name").val($(".upload-name").prop("defaultValue"));
				}
			}
			
			/* 리뷰 남기기 모달창에서 미리보기 이미지 파일 삭제 */
			function deleteImage2() {
				$("#profile_img02").attr("src", "");
				$("#ex_filename02").val($("#ex_filename02").prop("defaultValue"));
				$(".upload-name02").val($(".upload-name02").prop("defaultValue"));
			}
			/* 리뷰 남기기 모달창에서 미리보기 이미지 파일 삭제 */
			function deleteImage3() {
				$("#profile_img03").attr("src", "");
				$("#ex_filename03").val($("#ex_filename03").prop("defaultValue"));
				$(".upload-name03").val($(".upload-name03").prop("defaultValue"));
			}
			/* 리뷰 남기기 모달창에서 미리보기 이미지 파일 삭제 */
			function deleteImage4() {
				$("#profile_img04").attr("src", "");
				$("#ex_filename04").val($("#ex_filename04").prop("defaultValue"));
				$(".upload-name04").val($(".upload-name04").prop("defaultValue"));
			}
			
			function handleImgFileSelect(e){
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f) {
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					
					var reader = new FileReader();
					
					reader.onload = function(e){
						$(".profile_img").attr("src",e.target.result);
						$("#profile_img").show();
					}
					reader.readAsDataURL(f);
				});
			}
			
			function handleImgFileSelect02(e){
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f) {
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					
					var reader = new FileReader();
					reader.onload = function(e){
						$(".profile_img02").attr("src",e.target.result);
						$("#profile_img02").show();
					}
					reader.readAsDataURL(f);
				});
			}
			
			function handleImgFileSelect03(e){
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f) {
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					
					var reader = new FileReader();
					reader.onload = function(e){
						$(".profile_img03").attr("src",e.target.result);
						$("#profile_img03").show();
					}
					reader.readAsDataURL(f);
				});
			}
			
			function handleImgFileSelect04(e){
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f) {
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					
					var reader = new FileReader();
					reader.onload = function(e){
						$(".profile_img04").attr("src",e.target.result);
						$("#profile_img04").show();
					}
					reader.readAsDataURL(f);
				});
			}
			
		
		</script>
		
		<script>
			// 리뷰 남기기 모달창으로 데이터 보내기 함수
				function showing(num) {
					let usinglist_num_ = $("#review_usinglist_num" + num).val();
					let petsitter_id_ = $("#review_petsitter_id" + num).val();
					let nickname_ = $("#review_petsitter" + num).val();
					let address_ = $("#review_petsitter_address" + num).val();
					let photo_ = $("#review_petsitter_photo" + num).val();
					let score_ = $("#review_petsitter_score" + num).val();
					
			    $("input[name=USINGLIST_NUM]").val(usinglist_num_);
		      $("input[name=PETSITTER_ID]").val(petsitter_id_);
		      
					$("#petsitter_nickname").text(nickname_);
					$("#petsitter_nickname_input").val(nickname_);
					$("#petsitter_address").text(address_);
					$("#petsitter_address_input").val(address_);
					if(photo_ === 'N') {
						$(".modalprofileimg").attr("src", "resources/images/defaultprofile02.png.png");
					} else {
						$(".modalprofileimg").attr("src", "/filepath/" + photo_);
					}
					
					var staroutput = '';
					if(score_ == 5) {
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					} else if(score_ > 4 && score_ < 5) {
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/starhalf.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					} else if(score_ == 4) {
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					} else if(score_ > 3 && score_ < 4) {
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/starhalf.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					} else if(score_ == 3) {
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					} else if(score_ > 2 && score_ < 3) {
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/starhalf.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					} else if(score_ == 2) {
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					} else if(score_ > 1 && score_ < 2) {
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/starhalf.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					} else if(score_ == 1) {
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/star.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					} else if(score_ > 0 && score_ < 1){
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/starhalf.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					} else {
						$("#modal_star").empty();
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						staroutput += '<img src="resources/images/star_empty.png" width="20px" height="20px" style="margin-bottom: 8px;">';
						$("#modal_star").append(staroutput);
					}
					
					$("#modal_score").text(score_);
					
					$("#starmenu").empty();
					$("#starstar5 img").clone().appendTo($("#starmenu"));
					
					$("#staticBackdrop02").modal("show");
				};
		</script>
		<script>
			/* 별점 부여 함수 */
			
			function insertstar5() {
				$("#starmenu").empty();
       	$("#starstar5 img").clone().appendTo($("#starmenu"));
       	$("input[name=REVIEW_SCORE]").val(5);
			};
			
			function insertstar4_5() {
				$("#starmenu").empty();
       	$("#starstar4_5 img").clone().appendTo($("#starmenu"));
    		$("input[name=REVIEW_SCORE]").val(4.5);
      };
       
      function insertstar4() {
				$("#starmenu").empty();
		  	$("#starstar4 img").clone().appendTo($("#starmenu"));
				$("input[name=REVIEW_SCORE]").val(4);
			};
				
			function insertstar3_5() {
				$("#starmenu").empty();
		  	$("#starstar3_5 img").clone().appendTo($("#starmenu"));
				$("input[name=REVIEW_SCORE]").val(3.5);
		  };
		  
		  function insertstar3() {
				$("#starmenu").empty();
		  	$("#starstar3 img").clone().appendTo($("#starmenu"));
				$("input[name=REVIEW_SCORE]").val(3);
			};
				
			function insertstar2_5() {
				$("#starmenu").empty();
		  	$("#starstar2_5 img").clone().appendTo($("#starmenu"));
				$("input[name=REVIEW_SCORE]").val(2.5);
		  };
		  function insertstar2() {
				$("#starmenu").empty();
		  	$("#starstar2 img").clone().appendTo($("#starmenu"));
				$("input[name=REVIEW_SCORE]").val(2);
			};
				
			function insertstar1_5() {
				$("#starmenu").empty();
		  	$("#starstar1_5 img").clone().appendTo($("#starmenu"));
				$("input[name=REVIEW_SCORE]").val(1.5);
		  };
		  function insertstar1() {
				$("#starmenu").empty();
		  	$("#starstar1 img").clone().appendTo($("#starmenu"));
				$("input[name=REVIEW_SCORE]").val(1);
			};
				
			function insertstar0_5() {
				$("#starmenu").empty();
		  	$("#starstar0_5 img").clone().appendTo($("#starmenu"));
				$("input[name=REVIEW_SCORE]").val(0.5);
		  };
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