<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.spring.petsitter.ReservationController.*" %>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>

<%
	ArrayList<PetVO> list = (ArrayList<PetVO>)request.getAttribute("list");
	String memberId = (String)request.getAttribute("memberId");
	String petPhoto = (String)request.getAttribute("petPhoto");
	String petName = (String)request.getAttribute("petName");	
%>

<% 
	 /*분류 (아이디 / 주소 / 닉네임 / 등급 / 후기개수 / 자격증이름 / 자격증여부x2 / 자기소개 / 가능서비스 / 자격증 보유개수)*/
	 String startdate = (String)request.getAttribute("startdate");
	 String enddate = (String)request.getAttribute("enddate");
	 String petsitter_id= (String)request.getAttribute("petsitter_id");
	 String addr = (String)request.getAttribute("addr");
	 String mapaddr1 = "";
	 String mapaddr2 = ""; //상세주소
	 String ad = (String)request.getAttribute("safeaddr");
	 String[] safeaddr = ad.split(",");
	 String address= (String)request.getAttribute("address");
 	 if(safeaddr[0].equals("N")){
 		 mapaddr1 = addr; //도로명
 		 mapaddr2 = address; //경기 안산시
	 }else{
	 	 mapaddr1 = safeaddr[0];
	 	 mapaddr2 = safeaddr[1];
	 }
	 String nickname= (String)request.getAttribute("nickname");
	 String rank= (String)request.getAttribute("rank");
	 int review_count= (int)request.getAttribute("review_count");
	 String cert_list= (String)request.getAttribute("cert_list");
	 String introduce= (String)request.getAttribute("introduce");
	 String service = (String)request.getAttribute("service");

	 
	 String cert_count = (String)request.getAttribute("cert_count");
	 
	 
	 /*분류 (사진 ㅡ 프로필 / 자격증 / 집 / 증명사진)*/
	 String profile= (String)request.getAttribute("profile");	
	 String cert_photo1= (String)request.getAttribute("cert_photo1");
	 String cert_photo2= (String)request.getAttribute("cert_photo2");
	 String cert_photo3= (String)request.getAttribute("cert_photo3");
	 String home_photo1 = (String)request.getAttribute("home_photo1");
	 String home_photo2 = (String)request.getAttribute("home_photo2");
	 String home_photo3 = (String)request.getAttribute("home_photo3");
	 String proof = (String)request.getAttribute("photo_upfile");
	 
	 /*분류 (날짜  / 시간)*/ 
	 String start_date= (String)request.getAttribute("start_date");
	 String end_date= (String)request.getAttribute("end_date");
	 String start_time= (String)request.getAttribute("start_time");
	 String end_time= (String)request.getAttribute("end_time");

	 String radio_basic= (String)request.getAttribute("radio_basic");
	 
	 /*분류  (위탁60분가격 / 방문 3분가격 / 위탁1박가격 / 위탁1박가격(+대형견) / 방문60분가격 / 방문60분가격(+대형견)*/
	 String price = (String)request.getAttribute("price");
	 String price2 = (String)request.getAttribute("price2");
	 int eprice24= (int)request.getAttribute("price24");
	 String price24 = String.valueOf(eprice24);
	 int ebigPrice= (int)request.getAttribute("bigPrice");
	 String bigPrice = String.valueOf(ebigPrice);
	 int eprice60= (int)request.getAttribute("price60");
	 String price60 = String.valueOf(eprice60);
	 int ebigPrice2= (int)request.getAttribute("bigPrice2");
	 String bigPrice2 = String.valueOf(ebigPrice2);
%> 
<%@ include file="jsp_top.jsp" %>
<!doctype html>
<html lang="ko">
<style>
.datepicker table{
	width : 330px!important;
	height : 330px!important;
}
.disabled-date{
	background-color : rgb(83, 220, 152)!important;
}
.datepicker table tr td.active.active.focus, .datepicker table tr td.active.active:focus, .datepicker table tr td.active.active:hover, .datepicker table tr td.active.highlighted.active.focus, .datepicker table tr td.active.highlighted.active:focus, .datepicker table tr td.active.highlighted.active:hover, .datepicker table tr td.active.highlighted:active.focus, .datepicker table tr td.active.highlighted:active:focus, .datepicker table tr td.active.highlighted:active:hover, .datepicker table tr td.active:active.focus, .datepicker table tr td.active:active:focus, .datepicker table tr td.active:active:hover {
    background-color: rgb(83, 220, 152)!important;
    border-color: rgb(83, 220, 152)!important;
}

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
	<title>돌봄 예약 페이지</title>
	<!-- 데이트피커 ver.2(bootstrap) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<!-- 데이트피커ver.2(bootstrap_design) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
	  
	<!-- 타임피커 -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js">
	  
	<!-- 추가CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/UT_CSS/foster_view.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/JH_CSS/foster_view.css?after">
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<!-- 본 기능 추가 시작 -->
	<input type="hidden" value="${id }" id="MEMBER_ID" />
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
										<%
											if(home_photo1.equals("N") || home_photo1.equals("undefined"))
											{
										%>
										<img src = "resources/images/noimg.png"  id ="choiceimage">									
										<%
											} else
											{
										%>
										<img src = "/filepath/<%=home_photo1%>" id ="choiceimage">
										<%
											}
										%>	 
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
									<div class = "col-4">
											<%if(home_photo1.equals("N") || home_photo1.equals("undefined"))
											  {
											%>	<a href = "#" onclick ="toggleImg1()"><img class="home_photo" src = "resources/images/noimg.png"></a>										
											<%}else
												 {
											%>	<a href = "#" onclick ="toggleImg1()"><img class="home_photo" src = "/filepath/<%=home_photo1%>"></a>
											<% } %>		
										</div>
										
										<div class = "col-4">
											<%if(home_photo2.equals("N") || home_photo2.equals("undefined"))
											  {
											%>	<a href = "#" onclick ="toggleImg2()"><img class="home_photo" src = "resources/images/noimg.png"></a>										
											<%}else
												 {
											%>	<a href = "#" onclick ="toggleImg2()"><img class="home_photo" src = "/filepath/<%=home_photo2%>"></a>
											<% } %>		
										</div>
										
										<div class = "col-4">
											<%if(home_photo3.equals("N") || home_photo3.equals("undefined"))
											  {
											%>	<a href = "#" onclick ="toggleImg3()"><img class="home_photo" src = "resources/images/noimg.png"></a>										
											<%}else
												 {
											%>	<a href = "#" onclick ="toggleImg3()"><img class="home_photo" src = "/filepath/<%=home_photo3%>"></a>
											<% } %>	
										</div>
										
									</div>
									
									<hr class ="my-hr1" />
	
								</div>	
							</div>

      			</div>	
      		</div>			
  			 	<!-- 예약 폼 -->
      		<div class = "col-md-5" style = "margin-top : 50px;">
      			<div class ="row justify-content-center">
      				<!-- 본작업 시 height 지우고 하기 -->
      				<div class = "col-10" style = "background : rgba(224, 224, 224, 0.65);  height : 100%; border-radius: 25px;">
      					<div class = "row justify-content-center">
      						<div class = "col-12 font-size-18 main_grayfont3 text-center mybold" style = "margin : 24px 0 3px 0;">
      							<div>예약하기</div>
      						</div>
      						<div class = "col-12 font-size-13 main_grayfont3 text-center">
      							<div>자신의 애견정보를 기입하지 않으신 분은</div>
      							<span class = "mybold">나의 반려동물 등록하기</span><span>를 누르세요 </span>
      						</div>
      						<div class = "col-12 main_mint text-center petup" style="border-radius: 0px 50px 50px 0px;">
      							<a class = "font-size-21 main_whitefont mybold" id="petinsert" href="#">나의 반려동물 등록하기 GO!</a>
      						</div>
      						<div class = "col-12 text-center">
      							<label for="custom_rd1" class="custom_lb" id="custom_lb1"> 위탁</label>
											<input type="radio" name="type" id="custom_rd1" value="위탁" class="hide" 
											
											<%if(radio_basic.equals("we"))
											{
											%>
												checked="checked"/>	
											<% 
											}else if(!radio_basic.equals("we"))
											{
											%>	/>
											<% }  %> <!-- radio default값 설정해주기(위탁으로 들어왔을경우 default값 위탁체크) -->
											
								
      							<label for="custom_rd2" class="custom_lb" id="custom_lb2">방문</label>
      								<input type="radio" name="type" id="custom_rd2" value="방문" class="hide"
      								<%if(radio_basic.equals("bang"))
											{
											%>
												checked="checked"/>	
											<% 
											}else if(!radio_basic.equals("bang"))
											{
											%>	/>
											<% }  %> <!-- radio default값 설정해주기(방문으로 들어왔을경우 default값 방문체크) -->
									</div>

									
									<div class = "col-12 text-center font-size-15 main_grayfont3 mybold" style = "margin-top : 8px;">
									펫시터 이용 날짜
									</div>
									<div class = "col-11 text-center">
										<div class ="row justify-content-center">
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;"id="hide1">

												<input type="text" id="datePicker_start" class="form-control dateP" placeholder ="Check In Date" value="<%=start_date%>" style = "height : 41px;">
											</div>
											<div class = "col-1" id = "hide2" style = "padding : 0 0">
												<svg class="bi bi-chevron-compact-right main_grayfont4" width="30px" height="30px" style = "margin-top : 11px;"viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
												</svg>
											</div>
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;">
												<input type="text" id="datePicker_end" class="form-control dateP" placeholder ="Check Out Date" value="<%=end_date%>" style = "height : 41px;">
											</div>
										</div>
									</div>

									<div class = "col-11 text-center">
										<div class ="row justify-content-center">
											<div class="col" style ="color: #5e5e5e; font-weight: bold; font-size: 15px;">
												펫시터 이용 시간
											</div>

										</div>
									</div>
									
									
									
									
									
									
									<div class = "col-11 text-center">
										<div class ="row justify-content-center">
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;">
												<input type="text" name="time" class="form-control timepicker dateP" id="timePicker_start" placeholder="Check In Time" value="<%=start_time%>" style = "height : 41px;">
											</div>
											<div class = "col-1" style = "padding : 0 0">
												<svg class="bi bi-chevron-compact-right main_grayfont4" width="30px" height="30px" style = "margin-top : 11px;"viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  											<path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
												</svg>
											</div>
											<div class = "col-5" style = "padding : 0; margin : 4px 0 0 0;">
												<input type="text" name="time" class="form-control timepicker dateP" id="timePicker_end" placeholder="Check Out Time" value="<%=end_time%>" style = "height : 41px;">
											</div>
										</div>
									</div>
									<div class = "col-12 text-center font-size-15 main_grayfont3 mybold" style = "margin-top: 15px; margin-bottom: -8px">
									나의 반려동물 정하기
									</div>
									<div class = "col-10 text-center font-size-15 main_grayfont3 mybold float-left" style = "margin-top : 8px;">
										<div class ="row">
											<div class = "col-10" style = "padding : 0; margin : 4px 0 0 0;">
											  <select id="choicepet" name="choicepet" class="form-control choiceP" style = "height : 37px; width : 95%; border-radius: 50px;">
											  <option value="">마이펫을 선택해주세요 :)</option>
												  	<% 
												  		for(int i=0; i<list.size(); i++) {
												  		PetVO pet = list.get(i);
												  	%>
												  		<option value="<%=pet.getPET_NAME()%>(<%=pet.getPET_SIZE()%>)" id="op<%=i%>" class="petOption"><%=pet.getPET_NAME()%></option>
												  	<%	
												  		}
												  	%>
		
										 		</select>
											</div>
											<div class = "col-2" style = "padding : 0; margin : 4px 0 0 0;">
												<button type="button" class="plus" id="plus1">추가</button>
												<input type="hidden" value="<%=price%>" id="price"/>
												<input type="hidden" value="<%=price2%>" id="price2"/>
												
											</div>
										</div>
									</div>
									
									<div class = "col-11 text-center font-size-12 main_grayfont3" style = "margin : 5px 0 0 0;">
										<div class = "petcost1" id="cost1">
											<p class="p_view"> 펫을 추가하시면 견적이나와요! </p>
											<!-- 자바스크립트에서 태그 추가됨 -->
										</div>
										
										<hr class = "my-hr3" style = "margin : 8px 0;">
										<div class="petcost2" id="cost2">
										<p>예상 총 비용 : </p>
										</div>
										<form name="paycheck" action="./paycheck.br" method="post">
											<input type="hidden" name="PAY_ID" id="PAY_ID" value=${id } >
											<input type="hidden" name="PAY_AMOUNT" id="PAY_AMOUNT" >
											<input type="hidden" name="PETSITTER_ID" id="PETSITTER_ID" value=<%=petsitter_id %> >
											<input type="hidden" name="PAY_TYPE" id="PAY_TYPE" value="위탁" >
											<input type="hidden" name="START_DATE" id="START_DATE" value=<%=start_date %>>
											<input type="hidden" name="START_DATE" id="START_TIME">
											<input type="hidden" name="END_DATE" id="END_DATE" value=<%=end_date %>>
											<input type="hidden" name="END_DATE" id="END_TIME">
											<input type="button" id="paycheck" style="background:#53dc98; color :white; width : 60%; height : 38px; margin : 4px 0 31px 0;" class="btn btn-sm font-size-14" value="예약 신청">
										</form>
									</div>
									
      					</div>
      				</div>
      			</div>
      		</div>
     		</div>
     	</div>	
<!--이미지와 메인 예약 폼 종료 -->


<br/><br/><hr class ="my-hr2" />

	
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="aa">
					<div class="a1">
						<span>Profile</span>
					</div>
					<div class="a2">
						<span>Introduce</span>
					</div>
				</div>
				
				<div class="imgDiv">
					<div class="profile">
						<%if( profile.equals("N") || profile.equals("undefined") ){
							%>	<img class="profileImg" src="resources/images/noimg.png" />
							<%
								}else{				
							%>	<img class="profileImg" src="/filepath/<%=profile%>" />
							<% 	
								}
							%>
					</div>
					<div class="introduce">
						<div class="middle_div1">
							<p class="middle_text1">
								<%if(introduce.equals("N")){
								%>	등록된 자기소개가 없습니다.
								<%
									}else{
								%>	<%=introduce%>
								<%  	
									}
								%>
							</p>
						</div>
						
					</div>
				</div>
				
				<div class="bb">
					<div class="b1">
					</div>
				</div>
				
			</div>
		</div>


		<div class="row">	
			<div class="col">
				<div class="sibal1">
					cert
				</div>
			</div>
			
			<div class="col">
					<div class="sibal2">
						info
					</div>
			</div>
		</div>
		
		<div class="row">	
		
			<div class="col">
				<div class="dddd">
					<div class="fuckImg">
							<%if(cert_photo1.equals("N") || cert_photo1.equals("undefined"))
								  {
								%>	<img src = "resources/images/noimg.png"  id ="choiceimage2">									
								<%}else
									 {
								%>	<img src = "/filepath/<%=cert_photo1%>" id ="choiceimage2">
								<% } %>	 
					</div>
					
					<div class="fuckImg2">
						<%if(cert_photo1.equals("N") || cert_photo1.equals("undefined"))
					  {
						%>	<a href = "#none" onclick ="toggleImg4()"><img class="imgfuck" id="cert_photo1" src = "resources/images/noimg.png"></a>										
						<%}else
							 {
						%>	<a href = "#none" onclick ="toggleImg4()"><img class="imgfuck" src = "/filepath/<%=cert_photo1%>"></a>
						<% } %>		
						
						<%if(cert_photo2==null || cert_photo2.equals("undefined"))
					  {
						%>	<a href = "#none" onclick ="toggleImg5()"><img class="imgfuck" id="cert_photo2" src = "resources/images/noimg.png"></a>										
						<%}else
							 {
						%>	<a href = "#none" onclick ="toggleImg5()"><img class="imgfuck" src = "/filepath/<%=cert_photo2%>"></a>
						<% } %>	

						<%if(cert_photo3==null || cert_photo2.equals("undefined"))
					  {
						%>	<a href = "#none" onclick ="toggleImg6()"><img class="imgfuck" id="cert_photo3" src = "resources/images/noimg.png"></a>										
						<%}else
							 {
						%>	<a href = "#none" onclick ="toggleImg6()"><img class="imgfuck" src = "/filepath/<%=cert_photo3%>"></a>
						<% } %>	
					</div>
				</div>
			</div>

			
			<input type="hidden" id="track2" value="<%=radio_basic%>">
			
			<div class="col">
				<div class="ffff">
					<div class="fuckText">
						<p>닉네임 : 
							<span>
							<%if(nickname.equals("N") || nickname.equals("undefined"))
							{
							%>   -
							<%}
								 else
								{
							%>  <%=nickname%>
							<% }	%>
							</span>
						</p>
							
						<p>지역 : <span><%=address%></span></p>
						<p>등급 : <span><%=rank%></span></p>
					  <p>활동수 : <span><%=review_count%>회</span></p>
						<p>자격증 : <span><%=cert_count%>개 보유</span></p>
					</div>
				</div>
		</div>
	</div>   	 
</div>     	 
<!--펫시터 이용가능 서비스 요금 정보 시작 -->		
			<!--펫시터 이용가능 서비스 -->	
			<div class = "container" style="margin-top:-0px;">
				<div class = "row justify-content-center" id="serviceRow">
 					<div class = "col-md-4">
 						<div class="c1">
 							Service
 						</div>
 						
						<div class = "row main_grayfont3" id="serviceDiv">
							<div class ="col-12 font-size-16 text-center">
							</div>
							
							<div class="row justify-content-center font-size-14">
								<div class="col">
									<div class="service">
										<input type="hidden" id="track" value="<%=service%>">
										<p class="serviceList" id="service1">픽업 가능<i class="fas fa-check-circle" id="check1"></i></p>
										<p class="serviceList" id="service2">대형견 가능<i class="fas fa-check-circle" id="check2"></i></p>
										<p class="serviceList" id="service3">마당 존재	<i class="fas fa-check-circle" id="check3"></i></p>
										<p class="serviceList" id="service4">노견 케어 가능<i class="fas fa-check-circle" id="check4"></i>	</p>
									</div>
								</div>
							</div>	

						<div class="c3">
						
						</div>

						</div>	
					</div> 

					
					<!--펫시터 요금 정보  -->	
					<div class = "col-md-5">
						<div class = "row justify-content-center">
						 <div class = "col-10 text-center">
						 	<div class ="row align-items-center">
						 	
						 	<div class="c2">
						 	Price
						 	</div>
						 	
						 		<div class = "col-12 font-size-14 main_grayfont3" style = "background : white;  height : 248px;">
						 			<div class = "col-12 font-size-14 main_grayfont3">
									 <svg class="bi bi-book" width="22px" height="22px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style = "margin-left : 10px; margin-top: 4px;">
					  			 	<path fill-rule="evenodd" d="M3.214 1.072C4.813.752 6.916.71 8.354 2.146A.5.5 0 0 1 8.5 2.5v11a.5.5 0 0 1-.854.354c-.843-.844-2.115-1.059-3.47-.92-1.344.14-2.66.617-3.452 1.013A.5.5 0 0 1 0 13.5v-11a.5.5 0 0 1 .276-.447L.5 2.5l-.224-.447.002-.001.004-.002.013-.006a5.017 5.017 0 0 1 .22-.103 12.958 12.958 0 0 1 2.7-.869zM1 2.82v9.908c.846-.343 1.944-.672 3.074-.788 1.143-.118 2.387-.023 3.426.56V2.718c-1.063-.929-2.631-.956-4.09-.664A11.958 11.958 0 0 0 1 2.82z"/>
					 		  		<path fill-rule="evenodd" d="M12.786 1.072C11.188.752 9.084.71 7.646 2.146A.5.5 0 0 0 7.5 2.5v11a.5.5 0 0 0 .854.354c.843-.844 2.115-1.059 3.47-.92 1.344.14 2.66.617 3.452 1.013A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.276-.447L15.5 2.5l.224-.447-.002-.001-.004-.002-.013-.006-.047-.023a12.582 12.582 0 0 0-.799-.34 12.96 12.96 0 0 0-2.073-.609zM15 2.82v9.908c-.846-.343-1.944-.672-3.074-.788-1.143-.118-2.387-.023-3.426.56V2.718c1.063-.929 2.631-.956 4.09-.664A11.956 11.956 0 0 1 15 2.82z"/>
									 </svg>
									 	<p>위탁 기본 1박 : 
										 	<% if(price24.equals("NaN") || price24.equals("null") || price24.equals("undefined") || price24.equals("N"))
										 		{
										 	%>	(미등록)  
											<%}else {%>
													<%=price24%>원
											<%} %>			
									 	</p>
									 	<p>대형견 추가요금 : 1,000원</p>
									 	
									 	<p>시간당 
									 		<% if(price.equals("NaN") || price.equals("null") || price.equals("undefined") || price.equals("N")) 
									 			{
									 		%>	(미등록)
									 		<%}else { %>
									 			<%=price%>원 추가
									 		<%} %> 
									 		
									 		(대형견	 
									 			<% if(bigPrice.equals("NaN") || bigPrice.equals("null") || bigPrice.equals("undefined") || bigPrice.equals("N")) 
									 			{
									 			%> (미등록))
									 			<%}else { %>
									 			<%=bigPrice%>원)
									 		<%} %>
									 	</p>								 	
									 <svg class="bi bi-book" width="22px" height="22px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style = "margin-left : 10px; margin-top: 4px;">
					  			 	<path fill-rule="evenodd" d="M3.214 1.072C4.813.752 6.916.71 8.354 2.146A.5.5 0 0 1 8.5 2.5v11a.5.5 0 0 1-.854.354c-.843-.844-2.115-1.059-3.47-.92-1.344.14-2.66.617-3.452 1.013A.5.5 0 0 1 0 13.5v-11a.5.5 0 0 1 .276-.447L.5 2.5l-.224-.447.002-.001.004-.002.013-.006a5.017 5.017 0 0 1 .22-.103 12.958 12.958 0 0 1 2.7-.869zM1 2.82v9.908c.846-.343 1.944-.672 3.074-.788 1.143-.118 2.387-.023 3.426.56V2.718c-1.063-.929-2.631-.956-4.09-.664A11.958 11.958 0 0 0 1 2.82z"/>
					 		  		<path fill-rule="evenodd" d="M12.786 1.072C11.188.752 9.084.71 7.646 2.146A.5.5 0 0 0 7.5 2.5v11a.5.5 0 0 0 .854.354c.843-.844 2.115-1.059 3.47-.92 1.344.14 2.66.617 3.452 1.013A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.276-.447L15.5 2.5l.224-.447-.002-.001-.004-.002-.013-.006-.047-.023a12.582 12.582 0 0 0-.799-.34 12.96 12.96 0 0 0-2.073-.609zM15 2.82v9.908c-.846-.343-1.944-.672-3.074-.788-1.143-.118-2.387-.023-3.426.56V2.718c1.063-.929 2.631-.956 4.09-.664A11.956 11.956 0 0 1 15 2.82z"/>
									 </svg>
									 	
									 	<p>방문 기본 1시간 : 
									 		<% if(price60.equals("NaN") || price60.equals("null") || price60.equals("undefined") || price60.equals("N")) 
									 			{
									 		%>	(미등록)
									 		<%}else { %>
									 			<%=price60%>
									 		<%} %> 
									 	</p>
									 	
									 	<p>추가시간 30분 : 
									 		<% if(price2.equals("NaN") || price2.equals("null") || price2.equals("undefined") || price2.equals("N")) 
									 			{	
									 		%>  (미등록)
									 		<%}else { %>
									 			<%=price2%>원 
									 		<%} %>
									 			
									 		(대형견  
									 			<% if(bigPrice2.equals("NaN") || bigPrice2.equals("null") || bigPrice2.equals("undefined") || bigPrice2.equals("N"))
									 				{	
									 			%> (미등록))
									 			<%}else { %>
									 				<%=bigPrice2%>원)
									 			<%} %>
										</p>										
									 </div>
								 	</div>
								 	
								 	<div class="c3">
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
									<div class = "col-11" id = "schedule" style = "height :363px; background : rgba(224, 224, 224, 0.65); overflow : hidden;"></div>
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
								<p><%=mapaddr2 %></p>
							</div>
							<div class = "col-8" id = "map" style = "height : 326px; background : rgba(224, 224, 224, 0.65); overflow : hidden;"></div>
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

								<div class ="col-lg-12" style = "margin-top : 10px">
								
									<!-- galleryList 출력 -->
									<div class ="row" id = "galleryList"></div>
									
								</div>
							</div>
					</div>
						<div class = "col-12 text-center">
						<br/>
									<a href="galleryList.bo"type="button" class= "plus_gallery btn btn-sm" style="background:#53dc98; color :white; width : 20%;">더 보기</a>
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
									
									<div class = "col-5 text-right" id = "reviewStar" style = "font-size : 0px; margin : 11px 0 0 0; padding : 0;">
									</div>	
									<div class = "col-1 text-right" style = "margin : 4px 0 0 0; padding : 0;">
										<div class ="main_grayfont3" id = "reviewRating" style = "padding-top : 12%; font-size : 72%">평점 : 4.74</div>
									</div>
									
										
									</div>


<!-- 후기 상단 종료-->								
								
								
<!-- 후기작성 하나 시작  (여기서 부터 if 문과 for문으로 반복 5회 적영후 더보기시 전부 생성)-->	
								<hr class ="my-hr3"/>
								
								<div class = "row" id = "reviewList"></div>

								<div class = "col-12 text-center" style ="margin-top : 15px;">
									<a href="reviewList.bo"type="button" class= "plus_review btn btn-sm" style="background:#53dc98; color :white; width : 100px;">더 보기</a>
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

    	<!-- Modal 글신고기능 시작-->
		<!-- Modal 창 실행 a테그 -->
		<a href = "#" class = "staticBackdropReport" data-toggle="modal" data-target="#staticBackdropReport"></a>	
		<div id = "reportForm"></div>
		<!-- Modal 글신고기능 종료--> 

</body>
<!-- 본 기능 추가 종료 -->
<%@ include file="jsp_bottom.jsp" %>
 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24e91ec8fe5a3a10070597915f67d6ba&libraries=services"></script>
    
    
  <script>

	var scheduleDate = new Array();
	<%
	if(!startdate.equals("")){
	String[] startdates = startdate.split(",");
	String[] enddates = enddate.split(",");
	String DATE_PATTERN = "yyyy-MM-dd";
	for(int i = 0 ; i < startdates.length; i++){
		String inputStartDate = startdates[i];
		String inputEndDate = enddates[i];
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date startDate = sdf.parse(inputStartDate);
		Date endDate = sdf.parse(inputEndDate);
		
		ArrayList<String> dates = new ArrayList<String>();
		Date currentDate = startDate;
		while(currentDate.compareTo(endDate) <=0){
			dates.add(sdf.format(currentDate));
			Calendar c =Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		for(String date : dates){
			%> scheduleDate.push('<%=date%>');<%
		}
	}
	}
%>
  var geocoder = new kakao.maps.services.Geocoder();
  var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	var coords = new kakao.maps.LatLng(result[0].x, result[0].y);
	    	  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    	  mapOption = { 
	    	      center: new kakao.maps.LatLng(result[0].y, result[0].x), // 지도의 중심좌표
	    	      level: 3 // 지도의 확대 레벨
	    	  };

	    	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	    	//마커가 표시될 위치입니다 
	    	var markerPosition  = new kakao.maps.LatLng(result[0].y, result[0].x); 

	    	//마커를 생성합니다
	    	var marker = new kakao.maps.Marker({
	    	  position: markerPosition
	    	});

	    	//마커가 지도 위에 표시되도록 설정합니다
	    	marker.setMap(map);
	    }
	};
	
	geocoder.addressSearch('<%=mapaddr1%>', callback);
  /*css 적인 script는 하단인 이위치에 기입*/
 
	/*상단 사진 정보 클릭시 선택 시작*/
    function toggleImg1() 
  	{
    	var photo1 = "<%=home_photo1%>";
    	if( (photo1 == "undefined") || (photo1 == "N"))
    	{
    		document.getElementById("choiceimage").src = "resources/images/noimg.png";
    	}
    	else
    	{
    		document.getElementById("choiceimage").src = "/filepath/<%=home_photo1%>";	
    	}
    }
    
    function toggleImg2() 
    {
    	var photo2 = "<%=home_photo2%>";
    	if( (photo2 == "undefined") || (photo2 == "N"))
    	{
    		document.getElementById("choiceimage").src = "resources/images/noimg.png";
    	}
    	else
    	{
    		document.getElementById("choiceimage").src = "/filepath/<%=home_photo2%>";	
    	}
    }
    
    function toggleImg3() 
    {
    	var photo3 = "<%=home_photo3%>";
    	if( (photo3 == "undefined") || (photo3 == "N"))
    	{
    		document.getElementById("choiceimage").src = "resources/images/noimg.png";
    	}
    	else
    	{
    		document.getElementById("choiceimage").src = "/filepath/<%=home_photo3%>";	
    	}
    }
    
    function toggleImg4() 
    {
    	var photo4 = "<%=cert_photo1%>";
    	if( (photo4 == "undefined") || (photo4 == "N"))
    	{
    		document.getElementById("choiceimage2").src = "resources/images/noimg.png";
    	}
    	else
    	{
    		document.getElementById("choiceimage2").src = "/filepath/<%=cert_photo1%>";	
    	}
    }
    
    function toggleImg5() 
    {
    	var photo5 = "<%=cert_photo2%>";
    	if( (photo5 == "undefined") || (photo5 == "N"))
    	{
    		document.getElementById("choiceimage2").src = "resources/images/noimg.png";
    	}
    	else
    	{
    		document.getElementById("choiceimage2").src = "/filepath/<%=cert_photo2%>";	
    	}
    }
    
    function toggleImg6() 
    {
    	var photo6 = "<%=cert_photo3%>";
    	if( (photo6 == "undefined") || (photo6 == "N"))
    	{
    		document.getElementById("choiceimage2").src = "resources/images/noimg.png";
    	}
    	else
    	{
    		document.getElementById("choiceimage2").src = "/filepath/<%=cert_photo3%>";	
    	}
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
		  /*
		  var btn = document.querySelector('#btnToggleOverflow');
		  btn.onclick = function() {
		    var val = divs[0].style.overflow == 'hidden' ? 'visible' : 'hidden';
		    for (var i = 0; i < divs.length; ++i)
		      divs[i].style.overflow = val;
		  };
		  */
		};
		/*사진 가로 세로 이미지 크기 맞추고 가운데 위치로 보이게 하기  종료*/ 
    
    
  </script>  
  <script src="<c:url value="/resources/js/UT_JS/foster.js"/>"></script>    

	<!-- 아이콘 -->   
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script> 

	<!-- 데이트피커 ver.2 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<!-- 달력(한국어버젼_) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
	
<!-- 데이트피커 자스코드 -->
<!-- 시작날짜 -->

	<script type="text/javascript">
	console.log(scheduleDate);

	$(document).ready(function(){
		$('#schedule').datepicker({
			format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
			language : "ko", // 언어(<ㅡ js추가필요해서 했음.)
			todayHighlight : false,
			datesDisabled : scheduleDate,
			startDate : '-3d',
			autoclose: false,
			toggleActive : true,
			orientation: "bottom auto"
	});

	});
	
		$('#datePicker_start').datepicker({
				format : "yyyy-mm-dd", 			//달력에서 클릭시 표시할 값 형식
				language : "ko", 						//언어
				orientation: "bottom auto", //아래에 뜨게
				todayHighlight : true,			//오늘날짜 색상표시
				autoclose : true						//날짜누르면 닫힘.
		});

		
	</script>   
<!-- 종료날짜 -->
	<script type="text/javascript">
		$('#datePicker_end').datepicker({
				format : "yyyy-mm-dd", 			//달력에서 클릭시 표시할 값 형식
				language : "ko", 						// 언어
				orientation: "bottom auto", //아래에 뜨게
				todayHighlight : true,			//오늘날짜 색상표시
				autoclose : true						//날짜누르면 닫힘.
		});
	</script>    

	<!-- 타임피커 ver.1 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

	<!-- 타임피커 자스코드 -->
	<script type="text/javascript">
	
	$('.timepicker').timepicker({
	    timeFormat: 'p h:mm',
	    interval: 60,
	    minTime: '00',
	    maxTime: '11:00pm',
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
	    startTime: '07:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	</script>	 

	<script>
			var id = '<%=id%>'
				
			
		    
			   if(id == "null"|| id == ""){
				  $(document).on('click', '#petinsert', function(event){
						Swal.fire({
						  title: '로그인을 하시겠습니까?',
						  text: "반려견 등록은 로그인 후 사용 가능합니다.",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: 'rgba(83, 220, 152)',
						  cancelButtonColor: '#de7631',
						  confirmButtonText: '<a href="loginform.me" style = "color : white;">로그인 페이지로</a>'
						}).then((result) => {
							  if (result.value) {
								  window.location = "loginform.me";
								}
						})
					});
				  
				  }else{
					  $(document).on('click','#petinsert',function(event){
						  window.location = "petRegister.me";
					  })
				  }
			
			   if(id == "null"|| id == ""){
					  $(document).on('click', '#paycheck', function(event){
							Swal.fire({
							  title: '로그인을 하시겠습니까?',
							  text: "예약신청은 로그인 후 사용 가능합니다.",
							  icon: 'warning',
							  showCancelButton: true,
							  confirmButtonColor: 'rgba(83, 220, 152)',
							  cancelButtonColor: '#de7631',
							  confirmButtonText: '<a href="loginform.me" style = "color : white;">로그인 페이지로</a>'
							}).then((result) => {
								  if (result.value) {
									  window.location = "loginform.me";
									}
							})
						});
					  
					  }else{
						  $(document).on('click','#paycheck',function(event){
							  document.paycheck.submit();
						  })
					  }
			
		</script>

	<!--갤러리 및 후기 (Start)-->	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script><!-- sweetalert2 -->
	<script type="text/javascript">
	var sessionid = '<%=id%>';
	var sessionid2 = ',<%=id%>';
	//평점 AJAX
	var petsitter_id = '<%=petsitter_id%>';
		function ReviewRating(petsitterid){
			$('#reviewRating').empty();
			$('#reviewStar').empty();
			$.ajax({
        url:'/petsitter/getReviewRating.bo',
        type:'POST',
        data : {petsitterid: petsitterid},
        dataType : 'json',
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		if(item.avg_REVIEW_SCORE != null){
	        		var Rating = '';
	        		Rating += '평점 :&nbsp;'+ item.avg_REVIEW_SCORE + '';
	       	  	$('#reviewRating').append(Rating);
	       	  	
	       	  	var reviewStar = '';
	   	    		if(item.review_SCORE == 5){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    		}
	   	    		if(item.review_SCORE == 4){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		    			}
	   	    		if(item.review_SCORE == 3){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	    				}   
	   	    		if(item.review_SCORE == 2){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE == 1){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px; margin-top: 1px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 4 && item.review_SCORE < 5){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 3 && item.review_SCORE < 4){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 2 && item.review_SCORE < 3){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 1 && item.review_SCORE < 2){
	   	    			reviewStar += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 0 && item.review_SCORE < 1){
	   	    			reviewStar += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewStar += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}	
	   	    		$('#reviewStar').html(reviewStar);
        		}
        		
        		
         	});
        },
   	    error:function(){
   	    	alert("ajax통신 실패!!!");
   	    }
    	}); 
    }
		
		
		var startnum = 4;
		var endnum = 8;
		//후기 리스트 및 펫시터 답변 작성
		function selectReview(petsitterid){
			$('#reviewList').empty();
			$.ajax({
        url:'/petsitter/reviewList.bo',
        type:'POST',
        data : {petsitterid: petsitterid},
        dataType : 'json',
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		//리스트 개수 지정 출력
        		if(index < startnum) {	
        			//사진 개 수 별 업로드 문자열 추출
	    		   	if(item.review_UP_PHOTO != "N"){
	    		   	var upphoto = item.review_UP_PHOTO;
	    		   	var Pphoto = upphoto.split(',', 3);
	    		   	}
	    		   	
	    		   	
	        		var reviewList = '';
	        		reviewList += '<div class ="col-12">';
	        	  reviewList += '<div class = "row justify-content-center">';
	        		reviewList += '<div class = "col-md-12">';
	        		if(item.member_PHOTO_FILE != "N"){
		        		reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
		        		reviewList += '<img src = "/petsitter/upload/'+item.member_PHOTO_FILE+'" />';
		        		reviewList += '</div></div></div>';
		        		reviewList += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">';
		    			}
	        		else {
	        			reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
	        			reviewList +=	'<img src = "resources/images/defaultprofile.jpg">';
	        			reviewList += '</div></div></div>';	
		        		reviewList += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">';
		    			}
	        		
	        		reviewList += '<table>';
	        		reviewList += '<tr>';
	        		reviewList += '<td class = "font-size-18 main_grayfont3 mybold"  align = "center">'+ item.member_NICKNAME + '</td>';
	        		reviewList += '<td style = "padding: 6px 0 0 10px; font-size: 12px;">';
	        		reviewList += '<a href = "./reviewreportform.bo?num='+item.list_NUM+'&sessionid='+sessionid+'" type="button" class="reportFormAjax main_redfont0">신고</a></td>';	
	        		reviewList += '</tr>';
	        		reviewList += '<tr>';
	        		
	        		//별 자리
	        		reviewList += '<td style = "padding: 2px 0 0 0;">';
	   	    		if(item.review_SCORE == 5){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    		}
	   	    		if(item.review_SCORE == 4){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		    			}
	   	    		if(item.review_SCORE == 3){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	    				}   
	   	    		if(item.review_SCORE == 2){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE == 1){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px; margin-top: 1px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 4 && item.review_SCORE < 5){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 3 && item.review_SCORE < 4){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 2 && item.review_SCORE < 3){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 1 && item.review_SCORE < 2){
	   	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}
	   	    		if(item.review_SCORE > 0 && item.review_SCORE < 1){
	   	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	   	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							}	
							reviewList += '</td>';
							
							reviewList += '<td style = "padding: 0 0 0 10px;"> '+item.review_SCORE+'점</td>';
							reviewList += '</tr>';
							reviewList += '</table>';
								
							reviewList += '</div>';
							
							
							reviewList += '<div class = "float-right" style = "margin : 10px 0 0 0;">';
							reviewList += '<table><tr><td class= "rtablecss" id = "reviewlikecount'+item.list_NUM+'"></td></tr>';
							reviewList += '<tr><td class= "rtablecss">기입날짜 : '+item.real_DATE+'</td></tr></table></div>';
							reviewList += '<div class ="float-none"><br/><br/><br/></div>';
							reviewList += '</div>';
							
							

					
					
							reviewList += '<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">';
							reviewList += '<p>'+item.review_CONTENT+'</p>';
							reviewList += '</div>';
					
					
							reviewList += '<div class = "col-12">';
	
							//이미지 3장 보이게
				    	if(item.review_UP_PHOTO != "N" && Pphoto[1] == null){
				    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
				    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[0]+'" />';
				    		reviewList += '</div></div></div>';	
					    }
				    	if(item.review_UP_PHOTO != "N" && Pphoto[1] != null){
				    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
				    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[0]+'" />';
					    	reviewList += '</div></div></div>';			    		
					    	reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
					    	reviewList += '<img src = "/petsitter/upload/'+Pphoto[1]+'" />';
					    	reviewList += '</div></div></div>';
					    	if(Pphoto[2] != null){
					    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
					    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[2]+'" />';
					    		reviewList += '</div></div></div>';	
					    	}
				    	}
							reviewList += '</div>';							
							reviewList += '</div>';
	
							
							//후기작성의 펫시터 답 출력  시작  (if 문 이용 펫시터 답 있을 시 출력)
							if(item.review_REFLY != 'N'){
							reviewList += '<div class = "col-12" style = "width : 100%; background :rgba(224, 224, 224, 0.65)!important; padding : 13px 50px 1px 50px; margin : 17px 0 0 0;">';
							reviewList += '<div class = "row">';
							reviewList += '<div class = "col-md-12" style = "height : 100%; margin-bottom : 6px;">';
							
							if(item.petsitter_PHOTO_PROFILE_FILE != "N"){
				        		reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail03"> <div class="centered03">';
				        		reviewList += '<img src = "/petsitter/upload/'+item.petsitter_PHOTO_PROFILE_FILE+'" />';
				        		reviewList += '</div></div></div>';
				    	}
	        		else {
	        			reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
	        			reviewList +=	'<img src = "resources/images/defaultprofile02.png">';
	        			reviewList += '</div></div></div>';	
		    			}						
							
							reviewList += '<div class = "float-left" style= "padding : 17px 0 0 3px; margin-left : 10px; height : 100%;">';
							reviewList += '<table>';
							reviewList += '<tr>';
							reviewList += '<td class = "font-size-16 main_grayfont3 mybold"  align = "center">' + item.petsitter_NICKNAME + ' 펫시터님 답변<td>';
							reviewList += '<tr>';								
							reviewList += '</table>';
							reviewList += '</div>';
			        reviewList += '<div class = "reportPFFcss" >';
			        reviewList += '<a href = "./reviewreportform.bo?num='+item.list_NUM+'&sessionid='+sessionid+'" type="button" class="reportFormAjax main_redfont0">신고</a></div>';	
							reviewList += '</div>';
	
							reviewList += '<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">';
							reviewList += '<p>' + item.review_REFLY + '</p>';
							reviewList += '</div>';
							reviewList += '</div>';			
							reviewList += '</div>';
							}
							//후기작성의 펫시터 답  출력 종료  (if 문 이용 펫시터 답 있을 시 출력)
							
							//후기작성의 펫시터 답  쓰기 시작  (if 문 이용 펫시터 없고 펫시터 일시 출력)
							if(item.review_REFLY == 'N' && sessionid == item.petsitter_ID){
							reviewList += '<div class = "col-12" style = "background :rgba(224, 224, 224, 0.65)!important; height : 100px; margin : 10px 0 0 0; ">';
							reviewList += '<div class = "row  justify-content-center">';
							reviewList += '<div class = "col-11" style = "padding : 11px 0 0 0;">';
							reviewList += '<form method="post" enctype="multipart/form-data" name="replyInsertForm'+item.list_NUM+'" id = "replyInsertForm'+item.list_NUM+'">';
							reviewList += '<table style = "width : 100%">';
							reviewList += '<tr>';
							reviewList += '<td style ="font-size : 1.5%; width : 11%">답변 :</td>';
							reviewList += '<td><textarea class= "ttareacss" name="REVIEW_REFLY"></textarea></td>';
							reviewList += '</tr>';
							reviewList += '</table>';
							reviewList += '<input type="hidden" name="LIST_NUM" value="'+item.list_NUM+'"/>';
							reviewList += '<input type="hidden" name="PETSITTER_ID" value="'+item.petsitter_ID+'"/>';
							reviewList += '</form>';
							reviewList += '</div>';
							reviewList += '</div>';
							reviewList += '</div>';
							reviewList += '<div class = "col-12 text-right" style ="margin-top : 10px;">';
							reviewList += '<a href="javascript:void(0);" onclick="replyInsert('+item.list_NUM+');" type="button" class="replybuttoncss btn btn-sm">펫시터 답글 남기기</a>';
							reviewList += '</div>';
							}
							//후기작성의 펫시터 답  쓰기 종료  (if 문 이용 펫시터 없고 펫시터 일시 출력)
							reviewList += '</div>'; 
							reviewList += '<hr class ="my-hr3"/>';
	        		
	        		
	   	    		$('#reviewList').append(reviewList);
	   	        reviewLikeCountRead(item.list_NUM);
        		}
         	});

        },
   	    error:function(){
   	    	alert("ajax통신 실패!!!");
   	    }
    	}); 
    }		
			
		$('.plus_review').on('click', function(event){ //on이 동적인걸 실행해준다.
			var petsitterid = petsitter_id;
			$.ajax({
	      url:$(this).attr("href"),
	      data : {petsitterid: petsitterid},
	      type:'POST',
	      dataType : 'json',
	      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	      success:function(data){
	      	$.each(data, function(index, item){	
	      		
	      		if(index >= startnum && index < endnum) {
			       	var reviewList = '';	 
			       	  
		  				//사진 개 수 별 업로드 문자열 추출
		  		   	if(item.review_UP_PHOTO != "N"){
		  		   	var upphoto = item.review_UP_PHOTO;
		  		   	var Pphoto = upphoto.split(',', 3);
		  		   	}
		  		   	
		  		   	
		      		var reviewList = '';
		      		reviewList += '<div class ="col-12">';
		      	  reviewList += '<div class = "row justify-content-center">';
		      		reviewList += '<div class = "col-md-12">';
		      		if(item.member_PHOTO_FILE != "N"){
			        		reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
			        		reviewList += '<img src = "/petsitter/upload/'+item.member_PHOTO_FILE+'" />';
			        		reviewList += '</div></div></div>';
			        		reviewList += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">';
			    			}
		      		else {
		      			reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
		      			reviewList +=	'<img src = "resources/images/defaultprofile.jpg">';
		      			reviewList += '</div></div></div>';	
			        		reviewList += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">';
			    			}
		      		
		      		reviewList += '<table>';
		      		reviewList += '<tr>';
		      		reviewList += '<td class = "font-size-18 main_grayfont3 mybold"  align = "center">'+ item.member_NICKNAME + '<td>';
			        reviewList += '<td style = "padding: 6px 0 0 10px; font-size: 12px;">';
			        reviewList += '<a href = "./reviewreportform.bo?num='+item.list_NUM+'&sessionid='+sessionid+'" type="button" class="reportFormAjax main_redfont0">신고</a></td>';	
		      		reviewList += '</tr>';
		      		reviewList += '<tr>';
		      		
		      		//별 자리
		      		reviewList += '<td style = "padding: 2px 0 0 0;">';
		 	    		if(item.review_SCORE == 5){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    		}
		 	    		if(item.review_SCORE == 4){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
			    			}
		 	    		if(item.review_SCORE == 3){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		  				}   
		 	    		if(item.review_SCORE == 2){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE == 1){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px; margin-top: 1px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE > 4 && item.review_SCORE < 5){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE > 3 && item.review_SCORE < 4){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
									reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
									reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE > 2 && item.review_SCORE < 3){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
									reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
									reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE > 1 && item.review_SCORE < 2){
		 	    			reviewList += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}
		 	    		if(item.review_SCORE > 0 && item.review_SCORE < 1){
		 	    			reviewList += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		 	    			reviewList += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
								}	
								reviewList += '<td>';
								
								reviewList += '<td style = "padding: 0 0 0 10px;"> '+item.review_SCORE+'점<td>';
								reviewList += '</tr>';
								reviewList += '</table>';
									
								reviewList += '</div>';
								reviewList += '<div class = "float-right" style = "margin : 10px 0 0 0;">';
								reviewList += '<table><tr><td class= "rtablecss" id = "reviewlikecount'+item.list_NUM+'"></td></tr>';
								reviewList += '<tr><td class= "rtablecss">기입날짜 : '+item.real_DATE+'</td></tr></table></div>';
								reviewList += '<div class ="float-none"><br/><br/><br/></div>';
								reviewList += '</div>';
		
						
						
								reviewList += '<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">';
								reviewList += '<p>'+item.review_CONTENT+'</p>';
								reviewList += '</div>';
						
						
								reviewList += '<div class = "col-12">';
		
								//이미지 3장 보이게
					    	if(item.review_UP_PHOTO != "N" && Pphoto[1] == null){
					    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
					    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[0]+'" />';
					    		reviewList += '</div></div></div>';	
						    }
					    	if(item.review_UP_PHOTO != "N" && Pphoto[1] != null){
					    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
					    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[0]+'" />';
						    	reviewList += '</div></div></div>';			    		
						    	reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
						    	reviewList += '<img src = "/petsitter/upload/'+Pphoto[1]+'" />';
						    	reviewList += '</div></div></div>';
						    	if(Pphoto[2] != null){
						    		reviewList += '<div class="thumbnail-wrapper reviewimg"> <div class="thumbnail"> <div class="centered">';
						    		reviewList += '<img src = "/petsitter/upload/'+Pphoto[2]+'" />';
						    		reviewList += '</div></div></div>';	
						    	}
					    	}
								reviewList += '</div>';							
								reviewList += '</div>';
		
								
								//후기작성의 펫시터 답 출력  시작  (if 문 이용 펫시터 답 있을 시 출력)
								if(item.review_REFLY != 'N'){
								reviewList += '<div class = "col-12" style = "width : 100%; background :rgba(224, 224, 224, 0.65)!important; padding : 13px 50px 1px 50px; margin : 17px 0 0 0;">';
								reviewList += '<div class = "row">';
								reviewList += '<div class = "col-md-12" style = "height : 100%; margin-bottom : 6px;">';
								
								if(item.petsitter_PHOTO_PROFILE_FILE != "N"){
				        		reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail03"> <div class="centered03">';
				        		reviewList += '<img src = "/petsitter/upload/'+item.petsitter_PHOTO_PROFILE_FILE+'" />';
				        		reviewList += '</div></div></div>';
					    	}
		      			else {
				      			reviewList += '<div class="float-left thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
				      			reviewList +=	'<img src = "resources/images/defaultprofile02.png">';
				      			reviewList += '</div></div></div>';	
			    			}						
								
								reviewList += '<div class = "float-left" style= "padding : 17px 0 0 3px; margin-left : 10px; height : 100%">';
								reviewList += '<table>';
								reviewList += '<tr>';
								reviewList += '<td class = "font-size-16 main_grayfont3 mybold"  align = "center">' + item.petsitter_NICKNAME + ' 펫시터님 답변<td>';
								reviewList += '<tr>';								
								reviewList += '</table>';
								reviewList += '</div>';
						    reviewList += '<div class = "reportPFFcss" >';
						    reviewList += '<a href = "./reviewreportform.bo?num='+item.list_NUM+'&sessionid='+sessionid+'" type="button" class="reportFormAjax main_redfont0">신고</a></div>';	
								reviewList += '</div>';
		
								reviewList += '<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">';
								reviewList += '<p>' + item.review_REFLY + '</p>';
								reviewList += '</div>';
								reviewList += '</div>';			
								reviewList += '</div>';
								}
								//후기작성의 펫시터 답  출력 종료  (if 문 이용 펫시터 답 있을 시 출력)
								
								//후기작성의 펫시터 답  쓰기 시작  (if 문 이용 펫시터 없고 펫시터 일시 출력)
								if(item.review_REFLY == 'N' && sessionid == item.petsitter_ID){
								reviewList += '<div class = "col-12" style = "background :rgba(224, 224, 224, 0.65)!important; height : 100px; margin : 10px 0 0 0; ">';
								reviewList += '<div class = "row  justify-content-center">';
								reviewList += '<div class = "col-11" style = "padding : 11px 0 0 0;">';
								reviewList += '<form method="post" enctype="multipart/form-data" name="replyInsertForm'+item.list_NUM+'" id = "replyInsertForm'+item.list_NUM+'">';
								reviewList += '<table style = "width : 100%">';
								reviewList += '<tr>';
								reviewList += '<td style ="font-size : 1.5%; width : 11%">답변 :</td>';
								reviewList += '<td><textarea class= "ttareacss" name="REVIEW_REFLY"></textarea></td>';
								reviewList += '</tr>';
								reviewList += '</table>';
								reviewList += '<input type="hidden" name="LIST_NUM" value="'+item.list_NUM+'"/>';
								reviewList += '<input type="hidden" name="PETSITTER_ID" value="'+item.petsitter_ID+'"/>';
								reviewList += '</form>';
								reviewList += '</div>';
								reviewList += '</div>';
								reviewList += '</div>';
								reviewList += '<div class = "col-12 text-right" style ="margin-top : 10px;">';
								reviewList += '<a href="javascript:void(0);" onclick="replyInsert('+item.list_NUM+');" type="button" class="replybuttoncss btn btn-sm">펫시터 답글 남기기</a>';
								reviewList += '</div>';
								}
								//후기작성의 펫시터 답  쓰기 종료  (if 문 이용 펫시터 없고 펫시터 일시 출력)
								reviewList += '</div>'; 
								reviewList += '<hr class ="my-hr3"/>';	       	  
			       	  
			      		$('#reviewList').append(reviewList);
			   	      reviewLikeCountRead(item.list_NUM);			      		
		      		}	
	     	  	});
		      	startnum += 4; //다음 더보기시 데이터 4개 추가 생성
		      	endnum += 4; //다음 더보기시 데이터 4개 추가 생성
	  			},
			   	error:function(){
			       alert("ajax통신 실패!!!");
			   	}
			  }); 
				//기본 이벤트 제거
			 event.preventDefault();
			});
		
		
		function replyInsert(listNum) {
			var insertData = $('#replyInsertForm'+listNum+'').serialize();
			$.ajax({		
				url : '/petsitter/write_ReviewReply.bo',
				type : 'POST',
				data : insertData,
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : function(data) {
					if(data == 1) {
						// 댓글 작성 후 댓글 목록 reload
						selectReview(petsitter_id);
					}
				},
				error:function() {
					alert("ajax 통신 실패(write)");			
				}
			});
		}		
		
		$(document).ready(function(){ 
			
			//더보기 버튼 누를시 현재 스크롤 을 구해서 그 위치를 유지 시작
		  $(".plus_review").click(function() {
				//현재 스크롤 값 구하기
				var scrollValue = $(document).scrollTop();
				//지정값으로 가기
			  $('html, body').animate({
			  	scrollTop : scrollValue
			  },);
			     return false;
		  });
			//종료
			
			//더보기 버튼 누를시 현재 스크롤 을 구해서 그 위치를 유지 시작
		  $(".plus_gallery").click(function() {
				//현재 스크롤 값 구하기
				var scrollValue = $(document).scrollTop();
				//지정값으로 가기
			  $('html, body').animate({
			  	scrollTop : scrollValue
			  },);
			     return false;
		  });
			//종료	
			
			//페이지 로드시  출력 리스트
			ReviewRating(petsitter_id);
			selectReview(petsitter_id);
			selectGallery(petsitter_id);
			
		});	  
		
		var galleryStart = 12;
		var galleryEnd = 24;
		var gallerylimit = 0;
		
		//후기 리스트 및 펫시터 답변 작성
		function selectGallery(petsitterid){
			$('#reviewList').empty();
			$.ajax({
        url:'/petsitter/galleryList.bo',
        type:'POST',
        data : {petsitterid: petsitterid},
        dataType : 'json',
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){

	    		   var galleryList = '';
        			//사진 개 수 별 업로드 문자열 추출
	    		   	if(item.communication_PHOTO_FILE != "N"){
	    		   	var upphoto = item.communication_PHOTO_FILE;
	    		   	var Pphoto = upphoto.split(',');
								for(var i = 0; i < Pphoto.length; i++){
									if(gallerylimit < galleryStart) {
									galleryList += '<div class = "col-2-lg" style ="padding : 7px 7px;">';
									galleryList += '<div class="thumbnail-wrapper"> <div class="thumbnail04"> <div class="centered04">';
									galleryList += '<img src = "/petsitter/upload/'+Pphoto[i]+'">';
									galleryList += '</div></div></div>';
									galleryList += '</div>';
									gallerylimit = gallerylimit + 1;
									}
								}
	    		   	}
        			
		      		$('#galleryList').append(galleryList);        			

         	});
        },
   	    error:function(){
   	    	alert("ajax통신 실패!!!");
   	    }
    	}); 
    }			
		

		$('.plus_gallery').on('click', function(event){ //on이 동적인걸 실행해준다.
			var gallerylimit2 = 0;
			var petsitterid = petsitter_id;
			$.ajax({
	      url:$(this).attr("href"),
	      data : {petsitterid: petsitterid},
	      type:'POST',
	      dataType : 'json',
	      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	      success:function(data){
	      	$.each(data, function(index, item){	
	      		
	    		  var galleryList = '';
       			//사진 개 수 별 업로드 문자열 추출
	    		   	if(item.communication_PHOTO_FILE != "N"){
	    		   	var upphoto = item.communication_PHOTO_FILE;
	    		   	var Pphoto = upphoto.split(',');
								for(var i = 0; i < Pphoto.length; i++){
										gallerylimit2 = gallerylimit2 +1;
										if(gallerylimit2 >= galleryStart && gallerylimit2 < galleryEnd) {
										galleryList += '<div class = "col-2-lg" style ="padding : 7px 7px;">';
										galleryList += '<div class="thumbnail-wrapper"> <div class="thumbnail04"> <div class="centered04">';
										galleryList += '<img src = "/petsitter/upload/'+Pphoto[i]+'">';
										galleryList += '</div></div></div>';
										galleryList += '</div>';
									}
								}
	    		   	}
	    		   
		      		$('#galleryList').append(galleryList);   
      		
 	  			});
	      	galleryStart += 12; //다음 더보기시 데이터 12개 추가 생성
	      	galleryEnd += 12; //다음 더보기시 데이터 12개 추가 생성
				},
	   		error:function(){
	       alert("ajax통신 실패!!!");
	   		}
	    }); 
			//기본 이벤트 제거
			event.preventDefault();
		});	      		
	      		

		//좋아용 기능 시작
		function reviewLikeCountRead(reviewListNum){
			$.ajax({
				url : '/petsitter/readReviewLikeCount.bo?reviewListNum=' + reviewListNum,
				type : 'post',
				data : {'reviewListNum': reviewListNum},
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : function(data) {
					$('#reviewlikecount'+reviewListNum).empty();
					var a = '';
					var num = 1;
					$.each(data, function(key, value) {						
						
    		   	//좋아요 아이디 추출
    		   	if(value.like_ID != "N"){
    		   	var likeids = value.like_ID;
    		   	var likeid = likeids.split(',');
        		}
						
    		  	//좋아요 유무 확인및 list
    		   	if(sessionid == "null" ){
							a += '<a href ="#" class="likeloginalert">';
							a += '<img src = "resources/images/heart.png" width = "15px" height = "15px" style = "margin-bottom : 5px;">'
							a += '</a>&nbsp;&nbsp;'+value.like_COUNT+'';
	    			}							
		    		//idcheck 는  좋아요를 누른 아이디 일시 2로 바뀜
		    		var idcheck = 1;
		    		//첫 split된 인데스 0번째는 'N' 으로 1인덱스부터 시작과 il에 1추가로 필요한 길이 맞춤
		    		if (sessionid != "null" && likeids != "N"){
		    			var lc = value.like_COUNT;
		    			var ln = value.list_NUM;
		    			for(j = 1; j < lc+1; j++){
			    			if(likeid[j] == sessionid) {
			    				a += '<form id = "reviewLikeForm">';
			    				a += '<a href ="./updateLike_count2.bo" class = "downdateLike_count">';
									a += '<img src = "resources/images/fullheart.png" width = "15px" height = "15px" style = "margin-bottom : 5px;">'
									a += '</a>&nbsp;&nbsp;'+value.like_COUNT+'';
						    		//input으로 serialize 이용 값을 sql문에 대입 가능하게 전송
					    		a += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
					    		a += '<input type = "hidden" name = "LIKE_COUNT" id = "LIKE_COUNT'+ln+'" value= "'+ (lc-1) +'">';
					    		a += '<input type = "hidden" name = "LIST_NUM" id = "LIST_NUM" value= "'+ ln + '">';
					    		a += '</form>';
					    		idcheck = 2; //아이디확인 값 2로
			    			}
		    			}
		    		}
		    		if(sessionid != "null" && idcheck == 1){
		    			var lc = value.like_COUNT;
		    			var ln = value.list_NUM;
		    			a += '<form id = "reviewLikeForm">';
							a += '<a href ="./updateLike_count.bo" class = "updateLike_count">';
							a += '<img src = "resources/images/heart.png"  width = "15px" height = "15px" style = "margin-bottom : 5px;">'
							a += '</a>&nbsp;&nbsp;'+value.like_COUNT+'';
			    		a += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
			    		a += '<input type = "hidden" name = "LIKE_COUNT" id = "LIKE_COUNT'+ln+'" value= "'+ (lc+1) +'">';
			    		a += '<input type = "hidden" name = "LIST_NUM" id = "LIST_NUM" value= "'+ ln + '">';
			    		a += '</form>';
		    		}
		    		
					$('#reviewlikecount'+reviewListNum).html(a);	
					}); 
				}, 
				error:function(request, status, error){
					console.log("ajax 통신 실패");
					alert("ajax 통신 실패(List)");
				}
			});
		}	
		
		
		$(document).ready(function(){
			//좋아요 수 증가
		 	$(document).on('click', '.updateLike_count', function(event){
		 		var params;
		 		params = $(this).parents('#reviewLikeForm').serialize();
		 		jQuery.ajax({
		 			url : $(this).attr("href"),
					type : 'post',
					data : params,
			    dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success : function(data) {
						$.each(data, function(index, item){
							// 좋아요 후 좋아요 정보 출력
							reviewLikeCountRead(item.list_NUM);
						});
					},
					error:function() {
						alert("ajax 통신 실패!!");			
					}		
				});
				  //기본 이벤트 제거
				  event.preventDefault();		 		
			});
					
			
				//좋아요 수 감소
			 	$(document).on('click', '.downdateLike_count', function(event){
			 		var params;
			 		params = $(this).parents('#reviewLikeForm').serialize();
			 		
			 		jQuery.ajax({
			 			url : $(this).attr("href"),
						type : 'post',
						data : params,
				    dataType : 'json',
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						success : function(data) {
							$.each(data, function(index, item){
								// 좋아요 취소 후 좋아요 정보 출력
								reviewLikeCountRead(item.list_NUM);
							});
						},
						error:function() {
							alert("ajax 통신 실패!!");			
						}		
					});
					  //기본 이벤트 제거
					  event.preventDefault();		 		
				});
				//좋아용 기능 종료
				
				
				//Modal reportForm 시작	
				$(document).on('click', '.reportFormAjax', function(event){ //on이 동적인걸 실행해준다.
					$('#reportForm').empty();
					$.ajax({
			      url:$(this).attr("href"),
			      type : 'POST',
			      dataType : 'json',
			      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		        success:function(data){
		        	var k = 1;
		        	$.each(data, function(index, item){
									
		        			if(sessionid == 'null'){
		        				Swal.fire({
			     					 	title: '로그인을 하시겠습니까?',
			     					  text: "신고는 로그인 후 사용 가능합니다.",
			     					  icon: 'warning',
			     					  showCancelButton: true,
			     					  confirmButtonColor: 'rgba(83, 220, 152)',
			     					  cancelButtonColor: '#de7631',
			     					  confirmButtonText: '<a href="loginform.me" style = "color : white;">로그인 페이지로</a>'
			     					}).then((result) => {
			     						  if (result.value) {
			     							  window.location = "loginform.me";
			     							}
			     					})	
		        					return false;		
		        			}
		        			
		        			if(item.review_CONTENT == 'NN'){
			    					Swal.fire({
			    						  title: '신고가 접수된 게시글 입니다!',
			    						  text: "고객님의 관심의 감사를 표하며 빠른시일 내에 처리하겠습니다.",
			    						  icon: 'warning',
			    						  confirmButtonColor: 'rgba(83, 220, 152)',
			    						})
		        				return false;
		        			}
		        		
		        			var reportForm = '';
			        		reportForm += '<div class="modal fade" id="staticBackdropReport" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">';
			        		reportForm += '<div class="modal-dialog modal-sm">';
			        		reportForm += '<div class="modal-content">';
			        		reportForm += '<div class="modal-header">';
			        		reportForm += '<h4 class="modal-title main_mintfont font-size-20" id="staticBackdropLabel">신고하기.</h4>';
			        		reportForm += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
			        		reportForm += '<span aria-hidden="true">&times;</span>';
			        		reportForm += '</button>';
			        		reportForm += '</div>';
			        		reportForm += '<div class="modal-body">';
			        		reportForm += '<form action="./reviewreportinsert2.bo" style = "font-size : 0" method="post" name="reportFormSubmit" enctype="multipart/form-data">';
			        		reportForm += '<div class = "row">';
			        		reportForm += '<div class = "col-12 font-size-14 main_grayfont3">';
			        		reportForm += '<input type="hidden" name="MEMBER_ID" value="${id}">';
			        		reportForm += '<input type="hidden" name="LIST_NUM" value="'+item.list_NUM+'">';
			        		reportForm += '<input type="hidden" name="BOARD_TYPE" value="'+item.board_TYPE+'">';
			        		reportForm += '<input type="hidden" name="petsitter_id" value="' + petsitter_id + '">';	
			        		reportForm += '신고 글 번호 : '+item.list_NUM+'<br/>';
			        		reportForm += '<br/><div>신고자</div>';
			        		reportForm += '<div>${id}</div>';		        		
			        		reportForm += '<div>${name}</div>';
			        		reportForm += '</br><div>신고 사유</div>';
			        		reportForm += '<textarea id="REPORT_REASON" name="REPORT_REASON" rows="4" cols="40" placeholder="신고 사유를 적어주세요."></textarea>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</form>';
			        		reportForm += '<div class="modal-footer">';
			        		reportForm += '<div class = "row">';
			        		reportForm += '<div class = "col-12 font-size-14">';
			        		reportForm += '<a type="button" class="btn btn-sm pbtn02 reportInsert" id="btnReportClose" href="javascript:addreportboard()">신고하기</a>';
			        		reportForm += '<button type="button" class="btn btn-sm pbtn03" data-dismiss="modal" id="btnList">닫기</button>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
			        		reportForm += '</div>';
		   	       		$('#reportForm').append(reportForm);
		   	       		
		   	       		
		    			});
			      	if( true ) { $('.staticBackdropReport').get(0).click(); }        	
		    		},
			    	error:function(){
			        alert("ajax통신 실패!!!");
			    	}
					}); 
					//기본 이벤트 제거
					event.preventDefault();				
				});		
				//Modal reportForm 종료							
				
				
		});			
		
		
		  //글 신고 INSERT 버튼 시작
		function addreportboard(){
			var rpr = document.reportFormSubmit.REPORT_REASON.value;
			if (rpr.length < 2)
			{
				alert("신고 이유를 2자 이상 입력하세요.");
				document.reportForm.reportFormSubmit.focus();
				return false;
			}
			reportFormSubmit.submit();
		}
		//글 신고 INSERT 버튼 종료			
	</script> 
</body>
</html>