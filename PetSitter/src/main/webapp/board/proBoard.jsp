<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.spring.petsitter.board.*" %>
<%@ page import="java.util.GregorianCalendar" %>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String rank = (String)session.getAttribute("rank");

	List<ProBoardVO> boardlist=(List<ProBoardVO>)request.getAttribute("boardlist");

	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>

<!-- 전문가 상담 게시판 -->

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
    <title>PetSitter proboard</title>
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
    
    <!-- 언택 추가 CSS -->
		<link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/proBoard.css?after">
		<link rel="stylesheet" type="text/css" href="resources/css/JH_CSS/proBoard2.css?after">
    
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
		
		function selectReportData(){
			$('#reviewForm').empty();
			$.ajax({
        url:'/petsitter/getReviewBoardJSON.bo',
        type:'POST',
        dataType : 'json',
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		

   	       	$('#reviewForm').append(reviewForm);
    				});
    		},
	    	error:function(){
	        alert("ajax통신 실패!!!");
	    	}
			}); 
		}		
		
		
		$(document).ready(function(){ 
			selectReportData();
			
			$(document).on('click', '.updateform_data', function(event){ //on이 동적인걸 실행해준다.
			$('#proForm').empty(); 
      $('#proForm2').empty(); 
				$.ajax({
		      url:$(this).attr("href"),
		      type : 'POST',
		      dataType : 'json',
		      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		      success:function(data){
		      	$.each(data, function(index, item){
		      		
		      		var proForm = "";
							proForm += '<div class="col-md-6" style = "margin-top : 20px">';
							proForm += '<div class="bottom_table">';
							proForm += '<table class="PRO_TABLE main_grayfont3 fixtable">';
							proForm += '<thead>';
							proForm += '<tr class="PRO_PRO">';
							proForm += '<!-- PRO_NUM -->';
							proForm += '<td scope="col"><div class = "font-size-12 float-left" style = "padding : 5px 0 0 0;">NO :&nbsp; </div> '+item.pro_NUM+'</td>';
							proForm += '<!-- MEMBER_ID -->';
							proForm += '<td scope="col" class = "font-size-14">'+item.member_NICKNAME+'</td>';
							proForm += '<!--PRO_DATE -->'
							proForm += '<td scope="col" class = "font-size-14">'+item.real_DATE+'</td>'; 
							proForm += '<!--PRO_READCOUNT  -->';
							proForm += '<td scope="col" class = "font-size-14">조회 수 : '+item.pro_READCOUNT+'</td>';
							proForm += '<!-- PRO_LIKECOUNT -->';
							proForm += '<td scope="col" class = "font-size-14">';
							proForm += '<a href ="#" class="loginalert"><img src = "resources/images/heart.png" width = "15px" height = "15px" style = "margin-bottom : 5px;">';
							proForm += '</a>&nbsp;:&nbsp;'+item.pro_LIKECOUNT+'</td>';
							proForm += '</tr>';
							proForm += '</thead>';
							proForm += '<tbody>';
							
							var id = '<%=id%>';
							var rank = '<%=rank%>';
							var bls2 = item.secret_CHECK;
							var blid2 = item.member_ID;
							
							//비밀게시물이 아닌 경우						
							if(bls2 == 'N'){
								proForm += '<tr class="PRO_SUBJECT">';
								proForm += '<th colspan = "5" style = "padding : 3px 40px 3px 40px"><a href = "#" class = "lista">'+item.pro_SUBJECT+'</a></th>';
								proForm += '</tr>';
								proForm += '<tr class="PRO_CONTENT main_grayfont3">';
								proForm += '<td colspan ="5" style = "padding : 3px 40px 3px 40px"><a href = "#" class = "lista2">'+item.pro_CONTENT+'</a></td>';
								proForm += '</tr>';
								proForm += '<tr class="PRO_READMORE">';
								proForm += '<td colspan ="5" style = "padding-left : 15px"><a href="#" class="read">read more</a></td>';
								proForm += '</tr>';
							}

							//로그인시 비밀게시물 접근 불가능자
							if(rank != 'null'){
								if((bls2 == 'Y') && (rank != 'admin') && (rank != 'manager') && (id != blid2)) {								
									proForm += '<tr class="PRO_SUBJECT">';
									proForm += '<th colspan = "5" style = "padding : 3px 40px 3px 40px">secret board.</th>';
									proForm += '</tr>';
									proForm += '<tr class="PRO_CONTENT main_grayfont3">';
									proForm += '<td colspan ="5" style = "padding : 3px 40px 3px 40px">비밀 게시글입니다.</td>';
									proForm += '</tr>';
									proForm += '<tr class="PRO_READMORE">';
									proForm += '<td colspan ="5" style = "padding-left : 15px"><a class="read">read more <span class="oi oi-lock-locked"></span></a></td>';
									proForm += '</tr>';						
								}
							}

							//비로그인시 비밀게시물 접근 불가능자			
							if(rank == 'null') {		
								if(bls2 == 'Y'){	
									proForm += '<tr class="PRO_SUBJECT">';
									proForm += '<th colspan = "5" style = "padding : 3px 40px 3px 40px">secret board.</th>';
									proForm += '</tr>';
									proForm += '<tr class="PRO_CONTENT main_grayfont3">';
									proForm += '<td colspan ="5" style = "padding : 3px 40px 3px 40px">비밀 게시글입니다.</td>';
									proForm += '</tr>';
									proForm += '<tr class="PRO_READMORE">';
									proForm += '<td colspan ="5" style = "padding-left : 15px"><a class="read">read more <span class="oi oi-lock-locked"></span></a></td>';
									proForm += '</tr>';								
								}
							}								

							//로그인시 비밀게시물 접근 가능자
							if(bls2 == 'Y') {
								if(rank != 'null'){					
									if(rank == 'admin' || rank == 'manager' || id == blid2){									
										proForm += '<tr class="PRO_SUBJECT">';
										proForm += '<th colspan = "5" style = "padding : 3px 40px 3px 40px"><a href = "#" class = "lista">'+item.pro_SUBJECT+'</a></th>';
										proForm += '</tr>';
										proForm += '<tr class="PRO_CONTENT main_grayfont3">';
										proForm += '<td colspan ="5" style = "padding : 3px 40px 3px 40px"><a href = "#" class = "lista2">'+item.pro_CONTENT+'</a></td>';
										proForm += '</tr>';
										proForm += '<tr class="PRO_READMORE">';
										proForm += '<td colspan ="5" style = "padding-left : 15px"><a href="#" class="read">read more <span class="oi oi-lock-unlocked"></span></a></td>';
										proForm += '</tr>';
										
									}
								}
							}						
							
							proForm += '</tbody>';
							proForm += '</table>';
							proForm += '</div>';
							proForm += '</div>';
		      		
		     	    $('#proForm').append(proForm);

		     	    //리스트 목록 순차 정의 시작
							if(item.listcount2 != 0){
								var listcount2 = item.listcount2;
								var nowpage2 = item.page2;
								var maxpage2 = item.maxpage2;
								var startpage2 = item.startpage2;
								var endpage2 = item.endpage2;
		
				      	var proForm2 = "";	
					      	      	
				      	
				      	
				      	proForm2 += '<div class = "col-12" style = "padding : 10px 0 0 0">';
				      	if(id == 'null') {
				      	proForm2 += '<a href="#pick"  class = "writebtn float-right loginalert">글쓰기</a>';
								}
		     	    	if(id != 'null' && rank != 'pro' && rank != 'goldpro'){
		     	    		proForm2 += '<a href="./proboardwriteform.bo" class = "writebtn float-right">글쓰기</a>';	
		     	    	}
				      	proForm2 += '</div>';			      	
						    proForm2 += '<div class = "col-12">';
						    proForm2 += '<center>';
						    proForm2 += '<table>';
						    proForm2 += '<tr align=center height=20>';
						    proForm2 += '<td colspan=7 style="font-family:Tahoma;font-size:10pt;" width = "400px">';
						    
								if(nowpage2<=1){
									proForm2 += '<a type="button" style="background:#D3D3D3;" class="btn btn-sm">이전</a> ';
				     		 }
								if(nowpage2 >= 2){
									var nowpage3 = nowpage2 - 1;
									proForm2 += '<a href="./proboard2.bo?page='+ nowpage3 +'" type="button" class="updateform_data btn btn-sm blcss" id="prev">이전</a> ';
								}
								
								var a2 = 0;
								for(a2 = startpage2; a2 <= endpage2; a2++){
									if(a2==nowpage2){
										proForm2 += '<a type="button" class="btn btn-sm blcss"">'+ a2 +'</a> ';		
									}else{
										proForm2 += '<a href="./proboard2.bo?page='+ a2 +'" type="button" style="background:white;" class="updateform_data btn btn-sm">'+ a2 +'</a> ';	
									}
								}
		
								if(nowpage2>=maxpage2){
									proForm2 += '<a type="button" style="background:#D3D3D3;" class="btn btn-sm">다음</a> ';	
								}else{
									nowpage4 = nowpage2 + 1;
									proForm2 += '<a href="./proboard2.bo?page='+ nowpage4 +'" type="button" class="updateform_data btn btn-sm blcss"" id="next">다음</a> ';
								}	
								proForm2 += '</td>';
								proForm2 += '</tr>';
								proForm2 += '</table>';
								proForm2 += '</center>';
								proForm2 += '</div>';
			      				      	
								$('#proForm2').append(proForm2);							
							}	
				      //리스트 목록 순차 정의 종료		
				     	    
				     	    
				     	    
	    			});

		      },
			   	error:function(){
			       alert("ajax통신 실패!!!");
			   	}
				}); 
							//기본 이벤트 제거
						 event.preventDefault();
			});
		
		

			
		});
		</script>
    
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
      
      <header class="site-navbar js-sticky-header site-navbar-target" role="banner" style = "background : rgba(83,220,152);">

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
        
        <!-- 스크롤 위로올라가기 버튼 html-->
				<a id="MOVE_TOP_BTN" href="#">TOP</a>
				
      </header>
      
      
      
<!-- 본 기능 추가 시작 -->

<!-- top_box 시작-->
<section class="top_box">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="top_box_title">
					<h1 class="top_box_text1">질문을 등록하면 해당 분야의	<br>전문가가 상담해드립니다.</h1>
					<p class="top_box_text2">바쁜 일상에 대면 상담이 부담스러우신가요?<br>
																	 반려동물 뷰티, 심리상담, 행동교정 등 전문가 상담 게시판을 통해<br>
																	 1:1 질의응답으로 다양한 펫 전문가들과 상담을 나눌 수 있습니다.</p>
					<a class ="register" href ="#update_form">질문 등록하러가기
						<!-- 화살표 아이콘 -->
						<svg class="bi bi-arrow-right" width="2em" height="2em" viewBox="0 0 16 16" color="#53DC98" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  					<path fill-rule="evenodd" d="M10.146 4.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 8l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
  					<path fill-rule="evenodd" d="M2 8a.5.5 0 0 1 .5-.5H13a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8z"/>
						</svg>
					</a>
				

				
				</div>
			</div>
			<div class="col-md-6 float-right">
					<img src="resources/images/pro_1.jpg" alt="#" class="img01">
			</div>
		</div>
	</div>
</section> <hr>
<!-- top_box 종료 -->

<!-- middle_box 시작 -->
<!-- 전문가 소개 시작 -->
<section class="middle_box">
	<div class="container">
		
		<div class="row">
			<div class="col">
				<div class="bottom_title">
				<h3 class="bottom_text1">전문가 소개</h3>
				<br/>
				</div>
			</div>
		</div>
		
		<div class="row ">
			<div class="col-md">
				<div class="middle_body" >
					<div class="aspect_1_1 proimg">
						<img src="resources/images/Gang_1.jpg" alt="..." >
					</div>
					<div class="middle_text">
						<div class="middle_body_text1">강형욱 애견훈련사</div>
						<span class="middle_body_text2">TV동물농장 110회 출연</span><br>
						<span class="middle_body_text2">훈련사 자격증 1급</span><br>
						<a href ="#" class="register2">질문하기</a>
					</div>
				</div>
			</div>
			<div class="col-md">
				<div class="middle_body">
					<div class="aspect_1_1 proimg">
						<img src="resources/images/pro_2.jpg" alt="...">
					</div>
					<div class="middle_text">
						<div class="middle_body_text1">이경규 애견훈련사</div>
						<span class="middle_body_text2">KBS 개는 훌륭하다 출연</span><br>
						<span class="middle_body_text2">훈련사 자격증 1급</span><br>
						<a href ="#" class="register2">질문하기</a>
					</div>
				</div>
			</div>
			<div class="col-md">
				<div class="middle_body">
					<div class="aspect_1_1 proimg">
						<img src="resources/images/pro_3.jpg" alt="...">
					</div>
					<div class="middle_text">
						<div class="middle_body_text1">강수의 수의사</div>
						<span class="middle_body_text2">서울대학교 수의사학과</span><br>
						<span class="middle_body_text2">PST 수의사 협회 회원</span><br>
						<a href ="#" class="register2">질문하기</a>
					</div>
				</div>
			</div>
			<div class="col-md">
				<div class="middle_body">
					<div class="aspect_1_1 proimg">
						<img src="resources/images/pro_4.jpg" alt="...">
					</div>
					<div class="middle_text">
						<div class="middle_body_text1">최수의 수의사</div>
						<span class="middle_body_text2">연세대학교 수의사학과</span><br>
						<span class="middle_body_text2">PST 수의사 협회 회원</span><br>
						<a href ="#" class="register2">질문하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> <hr>
<!-- 전문가 소개 종료 -->
<!-- middle_box 종료 -->     
 
<!-- bottom_box 시작 -->
<!-- 전문가 게시판 미리보기 시작 (테이블)-->
<section class="bottom_box">

	<div class="container">
	
		<div class="row">
			<div class="col">
				<div class="bottom_title" id = "pick">
				<h3 class="bottom_text1">전문가 Q&A</h3>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
	<form id ="update_form" method="post">	
		<div class="row" id = "proForm" style = "width : 1140px; height : 100%">	
		<!-- 게시판 반복 -->
			
		<%	
			int num = listcount - ((nowpage - 1) * 6);
			for(int i=0;i<boardlist.size();i++){
				ProBoardVO bl=(ProBoardVO)boardlist.get(i);
				String blid = bl.getMEMBER_ID();
				String bls = bl.getSECRET_CHECK();
		%>
		
	
				<div class="col-md-6" style = "margin-top : 20px">
					<div class="bottom_table">
						<table class="PRO_TABLE main_grayfont3 fixtable">
						<thead>
							<tr class="PRO_PRO">
								<!-- PRO_NUM -->
								<td scope="col"><div class = "font-size-12 float-left" style = "padding : 5px 0 0 0;">NO :&nbsp; </div> <%=num%></td>
								<!-- MEMBER_ID -->
								<td scope="col" class = "font-size-14"><%=bl.getMEMBER_NICKNAME() %></td>
								<!--PRO_DATE -->
								<td scope="col" class = "font-size-14"><%=bl.getREAL_DATE() %></td>
								<!--PRO_READCOUNT  -->
								<td scope="col" class = "font-size-14">조회 수 : <%=bl.getPRO_READCOUNT() %></td>
								<!-- PRO_LIKECOUNT -->
								<td scope="col" class = "font-size-14">
								<a href ="#" class="loginalert"><img src = "resources/images/heart.png" width = "15px" height = "15px" style = "margin-bottom : 5px;">
								</a>&nbsp;:&nbsp;<%=bl.getPRO_LIKECOUNT() %></td>
							</tr>
						</thead>
						<tbody>
		<%
				//비밀게시물이 아닌 경우 코드
				if(bls.equals("N")) {
		%>		
							<tr class="PRO_SUBJECT">
				     		<th colspan = "5" style = "padding : 3px 40px 3px 40px"><a href = "#" class = "lista"  data-toggle="modal" data-target="#staticBackdrop<%=num%>"><%=bl.getPRO_SUBJECT() %></a></th>
				   		</tr>
				    	<tr class="PRO_CONTENT main_grayfont3">
				      	<td colspan ="5" style = "padding : 3px 40px 3px 40px"><a href = "#" class = "lista2"  data-toggle="modal" data-target="#staticBackdrop<%=num%>"><%=bl.getPRO_CONTENT() %></a></td>
				    	</tr>
				    	<tr class="PRO_READMORE">
				      	<td colspan ="5" style = "padding-left : 15px"><a href="#" class="read" data-toggle="modal" data-target="#staticBackdrop<%=num%>">read more</a></td>
							</tr>
		<%	}%>
		
		<%	
				//로그인시 비밀게시물  접근 불가능자
				if(rank != null){
					if(bls.equals("Y") && !(rank.equals("admin")) && !(rank.equals("manager")) && !(id.equals(blid))) {
		%>				
							<tr class="PRO_SUBJECT">
				     		<th colspan = "5" style = "padding : 3px 40px 3px 40px">secret board.</th>
				   		</tr>
				    	<tr class="PRO_CONTENT main_grayfont3">
				      	<td colspan ="5" style = "padding : 3px 40px 3px 40px">비밀 게시글입니다.</td>
				    	</tr>
				    	<tr class="PRO_READMORE">
				      	<td colspan ="5" style = "padding-left : 15px"><a class="read">read more <span class="oi oi-lock-locked"></span></a></td>
							</tr>		
		<%		}%>	
		<%	}%>	
	
		<%		
				//비로그인시 비밀게시물 접근 불가
				if(bls.equals("Y")) {		
					if(rank == null){	
		%>		
							<tr class="PRO_SUBJECT">
				     		<th colspan = "5" style = "padding : 3px 40px 3px 40px">secret board.</th>
				   		</tr>
				    	<tr class="PRO_CONTENT main_grayfont3">
				      	<td colspan ="5" style = "padding : 3px 40px 3px 40px">비밀 게시글입니다.</td>
				    	</tr>
				    	<tr class="PRO_READMORE">
				      	<td colspan ="5" style = "padding-left : 15px"><a class="read">read more <span class="oi oi-lock-locked"></span></a></td>
							</tr>				
		<%		}%>			
		<%	}%>			
		
		<%	
				//비밀게시판 일 때 접근 가능자
				if(bls.equals("Y")) {
					if(rank != null){					
						if((rank.equals("admin")) || (rank.equals("manager")) || (id.equals(blid))){
		%>		
							<tr class="PRO_SUBJECT">
				     		<th colspan = "5" style = "padding : 3px 40px 3px 40px"><a href = "#" class = "lista" data-toggle="modal" data-target="#staticBackdrop<%=num%>"><%=bl.getPRO_SUBJECT() %></a></th>
				   		</tr>
				    	<tr class="PRO_CONTENT main_grayfont3">
				      	<td colspan ="5" style = "padding : 3px 40px 3px 40px"><a href = "#" class = "lista2" data-toggle="modal" data-target="#staticBackdrop<%=num%>"><%=bl.getPRO_CONTENT() %></a></td>
				    	</tr>
				    	<tr class="PRO_READMORE">
				      	<td colspan ="5" style = "padding-left : 15px"><a href="#" class="read" data-toggle="modal" data-target="#staticBackdrop<%=num%>">read more <span class="oi oi-lock-unlocked"></span></a></td>
							</tr>		
		<%			}%>		
		<%		}%>		
		<%	}%>				
							
				  	</tbody>
						</table>
					</div>
				</div>
		
		<!-- Modal proboard_view시작-->
		<div class="modal fade" id="staticBackdrop<%=num%>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title main_mintfont" id="staticBackdropLabel">전문가상담 게시글</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      
						<div class="row justify-content-center">
							<div class="col-md-10">
								<table class="table table-sm">
									<tr>
										<td>제목</td>
										<td><%=bl.getPRO_SUBJECT()%></td>
										</tr> 
									<tr>
										<td>작성일</td>
										<td><%=bl.getREAL_DATE() %></td>
									</tr>						
									<tr> 
										<td>작성자</td>
										<td><%=bl.getMEMBER_NICKNAME() %></td>
									</tr>
									<tr>
										<td>조회수</td>
										<td><%=bl.getPRO_READCOUNT() %></td>
									</tr>		
												<%System.out.println("모달 오리진첨부파일 " + bl.getPRO_ORG_FILE());
												if(!(bl.getPRO_UP_FILE().equals("N"))) { 
													
													//파일 추출
													String pof = bl.getPRO_ORG_FILE();	
													String[] proOrgFile = pof.split(",");
															
													String puf = bl.getPRO_UP_FILE();	
													String[] proUpFile = puf.split(",");
													
												%>
									<tr>
										<td>첨부파일</td>
										<td>
												<a href="./filedownload.bo?num=<%=proOrgFile[0]%>&of=<%=proUpFile[0]%>&of2=<%=proOrgFile[0]%>">
													<%=bl.getPRO_ORG_FILE() %>
												</a>
										</td>
									</tr>	
									<%if(proOrgFile.length == 2){ %>
									<tr>	
										<td>첨부파일2</td>					
										<td>
											<a href="./filedownload.bo?num=<%=proOrgFile[1]%>&of=<%=proUpFile[1]%>&of2=<%=proOrgFile[1]%>%>">
													<%=bl.getPRO_ORG_FILE() %>
												</a>
										</td>
									</tr>		
									
										<%	}%> 
									<%} %>			
								</table>
							</div>
								
								
							<div class="col-md-10">
							
							<!--내용 CONTENT -->
							<div class = "main_grayfont3 font-size-14"><%=bl.getPRO_CONTENT() %></div>
							
								<table class="table table-borderless">
									<tr>
										<td>
											<%if(!(bl.getPRO_UP_FILE().equals("N"))) { 
													//파일 추출
															
													String puf = bl.getPRO_UP_FILE();	
													String[] proUpFile = puf.split(",");
											%>
											
											<img src="./upload/<%=proUpFile[0] %>" class = "detailimg">
											<%	if(proUpFile.length == 2){ %>
											<img src="./upload/<%=proUpFile[1] %>" class = "detailimg">
											<%	} %>
											<%} %>
											</td> 
									</tr>
								</table>
								<%if(id != null) {%>
								<%	if(!(bl.getMEMBER_ID().equals(id))){ %>
									<a type="button" class="btn btn-sm btn-danger float-right" data-toggle="modal" data-target="#staticBackdropReport<%=num%>">신고</a>
					  		<% 	} %>
					  		<%} %>
				      </div>
				     </div>
				     <div class="modal-footer">
				      <div class = "row">
				      	<div class = "col-12">
				      	<%if(id != null) {%>
									<%if((bl.getMEMBER_ID().equals(id)) || rank.equals("admin") || rank.equals("manager")) {%>
									<a type="button" style="background:#53dc98;" class="btn btn-sm" id="btnModify" href="./mboardmodifyform.me?num=<%=bl.getPRO_NUM() %>">수정</a>
						  		<a type="button" style="background:#53dc98;" class="btn btn-sm" id="btnDelete" href="./mboardDelete.me?num=<%=bl.getPRO_NUM() %>">삭제</a>
						  		<button type="button" class="btn modalbt01" data-dismiss="modal" id="btnList">닫기</button>
									<% } %>
									<%if(!(bl.getMEMBER_ID().equals(id))){ %>
					  			<button type="button" class="btn modalbt01" data-dismiss="modal" id="btnList">닫기</button>
					  		<% } %>
								
								<%}else{ %>
					  			<button type="button" class="btn modalbt01" data-dismiss="modal" id="btnList">닫기</button>
					  		<% } %>
					  		
								</div> 
							</div>		  
						</div>					  
		    
					</div>
				</div>
			</div>
		</div>
		<!-- Modal proboard_view 종료-->   
		
		<%	num--;
			} %>			
			</div>
				</form>		


		<%	
			int num2 = listcount - ((nowpage - 1) * 6);
			for(int i=0;i<boardlist.size();i++){
				ProBoardVO bl2 =(ProBoardVO)boardlist.get(i);
				String blid2 = bl2.getMEMBER_ID();
				String bls2 = bl2.getSECRET_CHECK();
		%>
			
		<!-- Modal 신고기능 시작-->
		<div class="modal fade" id="staticBackdropReport<%=num2%>" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title main_mintfont" id="staticBackdropLabel">신고하기.</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action="./reportArticle.me" method="post" name="proReportForm<%=num2%>">
		      <div class="modal-body">
		      	<div class = "row">
			      	<div class = "col-12">
					  	  <input type="hidden" name="MEMBER_ID" value="${id}">
					   		<input type="hidden" name="PRO_NUM" value="<%=bl2.getPRO_NUM()%>">
			 				    신고 글 번호 : <%=bl2.getPRO_NUM() %><br/>
			 				  <p>신고자 : ${name} ${id}</p>
			 				  <p>신고 사유</p>
			 				  <textarea id="REPORT_REASON" name="REPORT_REASON" rows="4" cols="35" placeholder="신고 사유를 적어주세요."></textarea>
	 				  	</div>
	 				  </div>	
	 		 		</div>	
	 		 		</form>	
	 		 		<div class="modal-footer">
		      	<div class = "row">
			      	<div class = "col-12">
			      		<a type="button" class="btn btn-sm btn-info" id="btnReportClose" href="javascript:addProReport<%=num2%>()">신고하기</a>
			      		<button type="button" class="btn modalbt01" data-dismiss="modal" id="btnList">닫기</button>
			      	</div>
		      	</div>
	      	</div>
					
				
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
	    //제목, 최소 글자수 제한
			function addProReport<%=num2%>(){
				var rr = document.proReportForm<%=num2%>.REPORT_REASON.value
				if (rr.length < 2)
				{
					alert("제목을 2자 이상 입력하세요.");
					document.proReportForm<%=num2%>.REPORT_REASON.focus();
					return false;
				}

				proReportForm<%=num2%>.submit();
			}
		</script> 
		<%	num2--;
			} %>			
		<!-- Modal 신고기능 종료--> 		
			
			
			
			
			
		<form id ="update_form2" method="post">
		<div class="row" id = "proForm2">
			<div class = "col-12" style = "padding : 10px 0 0 0">
			<%if(id == null) { %>
			<a href="#pick"  class = "writebtn float-right loginalert">글쓰기</a>
			<%} %>
			<%if(id != null && !(rank.equals("pro")) && !(rank.equals("goldpro"))) {%>
			<a href="./proboardwriteform.bo" class = "writebtn float-right">글쓰기</a>
			<%} %>
			</div>
			
			<div class = "col-12">
				<center>
				<table>	
					<tr align=center height=20>
						<td colspan=7 style="font-family:Tahoma;font-size:10pt;" width = "400px">
							<%if(nowpage<=1){ %>
							<a type="button" class="btn btn-sm bd3">이전</a> 
							<%}else{ %>
							<a href="./proboard2.bo?page=<%=nowpage-1 %>" type="button" class="updateform_data btn btn-sm blcss" id="prev">이전</a> 
							<%} %>
							
							<%for(int a=startpage;a<=endpage;a++){
								if(a==nowpage){%>
								<a type="button" class="btn btn-sm blcss"><%=a %></a> 
								<%}else{ %>
								<a href="./proboard2.bo?page=<%=a %>" type="button" style="background:white;" class="updateform_data btn btn-sm bw"><%=a %></a> 
								<%} %>
							<%} %>
							
							<%if(nowpage>=maxpage){ %>
							<a type="button"  class="btn btn-sm bd3">다음</a> 
							<%}else{ %>
							<a href="./proboard2.bo?page=<%=nowpage+1 %>" type="button" class="updateform_data btn btn-sm blcss" id="next">다음</a> 
							<%} %>
						</td>
					</tr>
				</table>	
				<center>	
			</div>

		</div>
</form>			
	</div>

	
</section>
<!-- 전문가 게시판 미리보기 종료 (테이블) -->
<!-- bottom-box 종료 -->   
     


     
     
     
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
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.sticky.js"/>"></script>

    <script src="<c:url value="./resources/js/aos.js"/>"></script><!-- nav 상단바 반응형웹 적용1 -->
    <script src="<c:url value="/resources/js/main.js"/>"></script><!-- nav 상단바 반응형웹 적용2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script><!-- sweetalert2 -->
    
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/open-iconic/1.1.1/font/css/open-iconic-bootstrap.min.css"><!--아이콘 (자물쇠)-->

		<script> 
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

			$(document).ready(function(){				
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

				$(document).on('click', '.loginalert', function(event){
					Swal.fire({
					  title: '로그인을 하시겠습니까?',
					  text: "좋아요는 로그인 후 사용 가능합니다.",
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
				
				
			});
			 
			 
			//모달 구현 제이쿼리(부트스트랩용) 회원정보 수정 시작
		  $('#myModal').on('shown.bs.modal', function () {
		  	$('#myInput').trigger('focus')
		  })
		  //모달 구현 제이쿼리(부트스트랩용) 회원정보 수정 종료
		  
			//Bootstrap multiple modal 이중 모달 창 순서
		  var count = 0; // 모달이 열릴 때 마다 count 해서  z-index값을 높여줌

		  $(document).on('show.bs.modal', '.modal', function () {
	      var zIndex = 1040 + (10 * count);
	      $(this).css('z-index', zIndex);
	      setTimeout(function() {
	          $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
	      }, 0);
	      count = count + 1
		  });

		  // multiple modal Scrollbar fix
		  $(document).on('hidden.bs.modal', '.modal', function () {
	      $('.modal:visible').length && $(document.body).addClass('modal-open');
		  });


		    

	</script>     
    
</body>
</html>