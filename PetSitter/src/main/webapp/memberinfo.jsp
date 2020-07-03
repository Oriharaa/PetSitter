<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	MemberVO membervo = (MemberVO)request.getAttribute("membervo");
	ArrayList<PetsitterVO> petsitterlist = (ArrayList<PetsitterVO>)request.getAttribute("petsitterlist");
	ArrayList<UsinglistVO> usinglist = (ArrayList<UsinglistVO>)request.getAttribute("usinglist");
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
    margin : 6px 0 6px 20%;
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


  <head>
    <title>마이 페이지</title>
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
                <a href="memberinfo.me?id=${id}"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
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
				  <div class="profile aspect_1_1" style="background: #BDBDBD;">
					<img src="resources/images/person_1.jpg">
				  </div>
				</div>
			  </div> 
			  <div class="col-7" style = "padding : 0;">
			  	 <h3 class="mypage font-size-24">MY PAGE</h3>
			    <div class="mpbody">
				  <div class="row" style = "margin-to">
				  <div class = "col-04" style = "padding : 0 15px;">
				    <h2 class="mpname float-left">${membervo.MEMBER_NICKNAME }</h2>
						<h5 class="mpneem float-none">&nbsp;&nbsp;</h5>
				    <h3 class="mpnick">${name }</h3>
				    <h5 class="mpgrade">등급 : &nbsp;${membervo.MEMBER_RANK }</h5>
				    <h5 class="mpdate font-size-16" id="memberdate"><%=membervo.getMEMBER_DATE().substring(0,10) %></h5>
				  </div>
				  <div class = "col-md-5" style = "margin-top : 50px;">
				  	<a href = "#" class="font-size-16 main_whitefont">반려견 등록하기</a>
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
				<h5 class="font-size-15">이용 횟수 : 0</h5>
				</div>
				<div class = "col-6">
				<h5 class="font-size-15">후기 작성 : 0</h5>
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
		<input type="button" class="middle_bt1" id="middle_bt1" value="1개월" onclick="usinglistfunc(num = 1)">
		<input type="button" class="middle_bt1" id="middle_bt2" value="3개월" onclick="usinglistfunc(num = 3)">
		<input type="button" class="middle_bt1" id="middle_bt3" value="6개월" onclick="usinglistfunc(num = 6)">
		<input type="button" class="middle_bt1" id="middle_bt4" value="전체 시기" onclick="selectData()" >
			
		<input type="text" class="middle_bt2_date" id="datePicker_start" placeholder="시작일" size="10px" style="text-align: center;" readonly>
		<input type="text" class="middle_bt2_date" id="datePicker_end" placeholder="종료일" size="10px" style="text-align: center;" readonly>
		<input type="button" class="middle_bt2" id="middle_bt7" value="조회" onclick="calendarUsinglist()">

	  </div>
	</div>
		
			
  <table>
 	<colgroup>
	  <col style="width: 15%;">
	  <col style="width: 20%;">
	  <col style="width: 20%;">
	  <col style="width: 20%;">
	  <col style="width: 15%;">
	  <col style="width: 15%;">
	  <col style="width: 15%;">
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
	  	<input type="hidden" id="id" value=${id } />
	  </tbody>
	  
	</table>	
  </div>
</section>
<!-- 이용현황 및 내역 끝!!-->


<!-- Modal 회원정보변경시작-->
<form name="updateMember" action="./memberUpdate.me" method="post">
<input type="hidden" name="MEMBER_ID" id="session_id" value=${id }> 
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
      					<th width="150px">닉네임</th>
      					<td colspan="2" >
      						<input type="text" placeholder="${membervo.MEMBER_NICKNAME }" size="12" name="MEMBER_NICKNAME" class="float-left">
      					</td>
      				</tr>
      				<tr>
      					<th width="150px">비밀번호</th>
      					<td colspan="2">
      						<input type="password" name="MEMBER_PW" id="pw1" value="" size="20" class="float-left">
      					</td>
      				</tr>
      				<tr>
      					<th width="150px">비밀번호 확인</th>
      					<td colspan="2">
	      					<input type="password" size ="20" id="pw2" class="float-left">
	      					<input class="alert alert-danger" value="비밀 번호가 일치하지 않습니다." style="padding: 4px; margin-bottom: 0; width: 250px; height: 31px; text-align: center;">
      					</td>
      				</tr>
							<tr>
      					<th width="150px">주소</th>
      					<td width="270px">
      						<input type="text" placeholder="주소 버튼을 누르세요." size="30" name="MEMBER_ADDRESS" class="float-left" id="sample5_address" readonly>
      					</td>
      					<td>
      						<input type="button" class="btn modalbt03 float-left" onclick="sample5_execDaumPostcode();" value="주소 검색 " style="height: 31px;" >
      					</td>
      				</tr>
      				<tr>
      					<th width="200px"></th>
      					<td colspan="2">
      						<input type="text" placeholder="상세 주소" size="30" name="MEMBER_ADDRESS" class="float-left">
      					</td>
      				</tr>
      				<tr>
      					<th width="200px">전화 번호</th>
      					<td colspan="2" class="float-left">
      						<select style="height: 31px;" name="MEMBER_TEL">
      							<option>010
      							<option>011
      							<option>02
      							<option>031
      							<option>032
      							<option>033
      						</select>
      						&nbsp;-&nbsp;
      						<input type="text" size="6" name="MEMBER_TEL">
      						&nbsp;-&nbsp;
      						<input type="text" size="6" name="MEMBER_TEL">
      					</td>
      				</tr>
      				<tr>
      					<th width="200px">프로필 사진</th>
      					<td colspan="2">
	      					<div class="filebox float-left"> 
		      					<input class="upload-name" value="파일선택" disabled="disabled" name="MEMBER_PHOTO"> 
		      					<label for="ex_filename">업로드</label><input type="file" id="ex_filename" class="upload-hidden">
	      					</div>
      					</td>
      				</tr>      				
       			</table>
      		</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn modalbt01" data-dismiss="modal">닫기</button>
        <button type="submit" class="btn modalbt02" id="updatebutton" >확인</button>
      </div>
    </div>
  </div>
</div>
</form>
<!-- Modal 회원정보변경종료-->



<!-- Modal 후기 남기기 시작-->
<div class="modal fade" id="staticBackdrop02" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title main_mintfont" id="staticBackdropLabel">후기 남기기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class = "row">
      		<div class = "col-3">
      			<div class = "float-left" style = "margin : 2px 0 0 10%;"><img src = "resources/images/person_2.jpg" class = "modalprofileimg"></div>
      		</div>
      		<div class = "col-7">
						<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">
							<table>
								<tr>
									<td colspan = "2" class = "font-size-15 main_grayfont3 mybold tleft">닉네임<td>
								<tr>
								<tr>
									<td colspan = "2" class = "font-size-15 main_grayfont3 mybold tleft">서울시 서초구<td>
								<tr>
								<tr>
									<td style = "padding: 0 0 7px 0;">
										<% 
											int star = 5;
											for(int i = 0; i < star; i++) {
										%>
										<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-bottom : 8px;">
										<%} %>
									</td>
									<td style = "padding: 0 0 5px 10px;"> 10점</td>
								<tr>
							</table>
						</div>	
      		</div>
      		<div class = "col-12" style = "padding : 0;">
      			<hr/>
      		</div>
      		<div class = "col-12">
      			<table>
      				<tr>
      					<th width = "80px">아이디 </th>
      					<td class = "tleft">${id }</td>
      				</tr>
      				<tr>
      					<th>점수 </th>
								<td>
									<select class="choiceS float-left" style = "height : 35px; width : 100px">
								    <option value="5">5점</option>
								    <option value="4">4점</option>
								    <option value="3">3점</option>
								    <option value="2">2점</option>
								    <option value="1">1점</option>
									</select>
								</td>
      				</tr>
							<tr>
								<th>후기 </th>
								<td><textarea name="inputstr2" style = "width : 380px; height : 100px; font-size : 12px;"></textarea></td>
							</tr>
							<tr>
								<th colspan = "2" class = "font-size-13">자신의 강아지 사진을 어필해보세요(후기 게시판에서 확인할 수 있어요!)</th>
							</tr>
							<tr>
      					<th>메인 사진 </th>
      					<td class = "tleft">
      					<div class="filebox"> 
      					<input class="upload-name" value="파일선택" disabled="disabled"> 
      					<label for="ex_filename02">업로드</label> <input type="file" id="ex_filename02" class="upload-hidden"> </div>
      					</td>
      				</tr>
      				<tr>
      					<th>사진 1 </th>
      					<td class = "tleft">
      					<div class="filebox"> 
      					<input class="upload-name" value="파일선택" disabled="disabled"> 
      					<label for="ex_filename03">업로드</label> <input type="file" id="ex_filename03" class="upload-hidden"> </div>
      					</td>
      				</tr>
      				<tr>
      					<th>사진 2 </th>
      					<td class = "tleft">
      					<div class="filebox"> 
      					<input class="upload-name" value="파일선택" disabled="disabled"> 
      					<label for="ex_filename04">업로드</label> <input type="file" id="ex_filename04" class="upload-hidden"> </div>
      					</td>
      				</tr>
      							
      			</table>
      		</div>
      		
        </div>
      </div>
     
      <div class="modal-footer">
        <button type="button" class="btn modalbt01" data-dismiss="modal">닫기</button>
        <button type="button" class="btn modalbt02">확인</button>
      </div>
    </div>
  </div>
</div>
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
		function sample5_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	var addr = data.address; // 최종 주소 변수
        	document.getElementById("sample5_address").value = addr;
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
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
	<script type="text/javascript">
	$(function() {
			$('#datePicker_start').datepicker({
				format: "yyyy-mm-dd", // 날짜 형식 포맷
				language: "ko", // 언어
				autoclose: true, // 날짜 선택하면 자동으로 닫힘
				todayHighlight: true,
				disableTouchKeyboard: false //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			});
			
			$('#datePicker_end').datepicker({
				format: "yyyy-mm-dd", // 날짜 형식 포맷
				language: "ko", // 언어
				autoclose: true, // 날짜 선택하면 자동으로 닫힘
				todayHighlight: true,
				disableTouchKeyboard: false //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			});
	});
		
	</script>
		
		<script>
		/* 전체 목록 출력 함수 */
			function selectData() {
				$('#petsitterList').empty();
				
				$.ajax({
					url: '/petsitter/getUsingList.bo',
					type: 'post',
					data: {id : '${id}'},
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						$.each(data, function(index, item) {
							let ing1 = '현재 이용중';
							let ing2 = '펫시터와의 소통';
							var output = '';
							output += '<tr style="color: #5e5e5e; border-top: 1px dashed gray;">';
							output += '<td>' + item.list_TYPE + '</td>';
							output += '<td rowspan="3">';
							output += '<div class="thumbnail-wrapper profile_sm1"> <div class="thumbnail"> <div class="centered">';
							output += '<img src="resources/images/person_1.jpg">';
							output += '</div></div></div>';
							output += '</td>';
							output += '<td>' + item.petsitter_NICKNAME + '</td>';
							output += '<td>' + item.list_START_DATE + '</td>';
							output += '<td rowspan="3">' + item.list_NUM + '</td>';
							output += '<td rowspan="3">' + item.list_PRICE + '</td>';
							if(item.list_COMPLETE === ing2) {
								output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '"></td>';
							} else {
								output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" data-toggle="modal" data-target="#staticBackdrop02"></td>';
							}
							output += '<tr style="color: #5e5e5e;">';
							if(item.list_ING === ing1) {
								output += '<td><b style="color: #0d47a1;">' + item.list_ING + '</b></td>';
							} else {
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
							
							console.log("output: " + output);
							$('#petsitterList').append(output);
						});
					},
					error: function() {
						alert("ajax 통신 실패!");
					}
				});
			}
			
			/* n개월 버튼 클릭 함수 */
			function usinglistfunc(num) {
				$('#petsitterList').empty();
				
				$.ajax({
					url: '/petsitter/getUsingList_month.bo',
					type: 'post',
					data: {
						id : '${id}', 
						month: num
					},
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						$.each(data, function(index, item) {
							let ing1 = '현재 이용중';
							let ing2 = '펫시터와의 소통';
							var output = '';
							output += '<tr style="color: #5e5e5e; border-top: 1px dashed gray;">';
							output += '<td>' + item.list_TYPE + '</td>';
							output += '<td rowspan="3">';
							output += '<div class="thumbnail-wrapper profile_sm1"> <div class="thumbnail"> <div class="centered">';
							output += '<img src = "resources/images/person_1.jpg">';
							output += '</div></div></div>';
							output += '</td>';
							output += '<td>' + item.petsitter_NICKNAME + '</td>';
							output += '<td>' + item.list_START_DATE + '</td>';
							output += '<td rowspan="3">' + item.list_NUM + '</td>';
							output += '<td rowspan="3">' + item.list_PRICE + '</td>';
							if(item.list_COMPLETE === ing2) {
								output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '"></td>';
							} else {
								output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" data-toggle="modal" data-target="#staticBackdrop02"></td>';
							}
							output += '<tr style="color: #5e5e5e;">';
							if(item.list_ING === ing1) {
								output += '<td><b style="color: #0d47a1;">' + item.list_ING + '</b></td>';
							} else {
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
							
							console.log("output: " + output);
							$('#petsitterList').append(output);
						});
					},
					error: function() {
						alert("ajax 통신 실패!");
					}
				});
			}
		
			/* 날짜 선택 후 목록 출력 */
			function calendarUsinglist() {
				$('#petsitterList').empty();
				
				let start_date = $("#datePicker_start").val();
				let end_date = $("#datePicker_end").val();
				
				$.ajax({
					url: '/petsitter/getUsingList_calendar.bo',
					type: 'post',
					data: {
						id : '${id}', 
						startdate: start_date,
						enddate: end_date
					},
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						$.each(data, function(index, item) {
							let ing1 = '현재 이용중';
							let ing2 = '펫시터와의 소통';
							var output = '';
							output += '<tr style="color: #5e5e5e; border-top: 1px dashed gray;">';
							output += '<td>' + item.list_TYPE + '</td>';
							output += '<td rowspan="3">';
							output += '<div class="thumbnail-wrapper profile_sm1"> <div class="thumbnail"> <div class="centered">';
							output += '<img src = "resources/images/person_1.jpg">';
							output += '</div></div></div>';
							output += '</td>';
							output += '<td>' + item.petsitter_NICKNAME + '</td>';
							output += '<td>' + item.list_START_DATE + '</td>';
							output += '<td rowspan="3">' + item.list_NUM + '</td>';
							output += '<td rowspan="3">' + item.list_PRICE + '</td>';
							if(item.list_COMPLETE === ing2) {
								output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '"></td>';
							} else {
								output += '<td rowspan="3"><input type="button" class="pet_talk mybtn" value="' + item.list_COMPLETE + '" data-toggle="modal" data-target="#staticBackdrop02"></td>';
							}
							output += '<tr style="color: #5e5e5e;">';
							if(item.list_ING === ing1) {
								output += '<td><b style="color: #0d47a1;">' + item.list_ING + '</b></td>';
							} else {
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
							
							console.log("output: " + output);
							$('#petsitterList').append(output);
						});
					},
					error: function() {
						alert("ajax 통신 실패!");
					}
				});
			}
			
			
			$(document).ready(function() {

				selectData();
			});
		</script>
</body>
</html>