<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<%
/* 세션 id값이 null일 경우 로그인 요구 */
if(session.getAttribute("id") == null) {
   out.println("<script>");
   out.println("location.href = 'loginform.me'");
   out.println("</script>");
}

String id = (String)session.getAttribute("id");
String name = (String)session.getAttribute("name");
String rank = (String)session.getAttribute("rank");
String btype = "noticeboard";

/* 회원 등급이 manager도 admin도 아닐 경우 메인페이지로 리다이렉트 */
if(!(rank.equals("manager")) && !(rank.equals("admin"))) {
	out.println("<script>");
  out.println("location.href = 'home.me'");
  out.println("</script>");
}
%>

<!doctype html>
<html lang="en">

<style>
	button#prev, button#list, button#next, button#write {
		color : white!important;
	}
	button#write {
		background-color:#53DC98!important;
	}
	h3#qna {
		color : #5e5e5e!important;		
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
	padding: .3em .75em; 
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
	padding: .3em .75em; 
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
		/*파일 선택 css 시작*/
		
/* imaged preview */ 
.filebox .upload-display { 
/* 이미지가 표시될 지역 */ 
margin-bottom: 5px; 
} 
@media(min-width: 768px) { 
	.filebox .upload-display { 
	display: inline-block; 
	margin-right: 5px; 
	margin-bottom: 0; } 
	} 
	.filebox .upload-thumb-wrap { 
	/* 추가될 이미지를 감싸는 요소 */ 
	display: inline-block; 
	width: 70px; 
	padding: 2px; 
	vertical-align: middle; 
	border: 1px solid #ddd; 
	border-radius: 5px; 
	background-color: #fff; 
	} 
	.filebox .upload-display img { 
	/* 추가될 이미지 */ 
	display: block; 
	max-width: 100%; 
	width: 100%; 
	height: auto; 
	}
	/*파일 선택 css 종료*/	
	.padd0 {
	padding : 0 0 0 0;
	margin : 4px 0 0 0;
	}
	 
	
</style>


	
	
  <head>
  <form action="./noticeboardwrite.me" method="post" name="boardform" enctype="multipart/form-data">
  <input type="hidden" name="NOTICE_ID" value="${id}">
  <input type="hidden" name="NOTICE_NICKNAME" value="${name}">
  
  
  	<!-- CKEDITOR 사용 위한 스크립트 -->
  	<script src = "${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>

  		
  	
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    <title>공지사항 작성 | PetSitter</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    

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

                <a href="basicform.me" ><span class = "font-size-14" >로그인</span></a>
                <span class="mx-md-2 d-inline-block"></span>
                <a href="basicform.me" ><span class = "font-size-14">회원가입</span></a>
              </div>
            </div>
          </div>
        </div>
	    </div>

      <header class="site-navbar js-sticky-header site-navbar-target" role="banner" style = "background : rgba(83,220,152,0.86);">
        <div class="container" >
          <div class="row align-items-center position-relative" >
            <div class="site-logo">
              <a href="./home.me" ><span class="main_whitefont">보살펴조</span></a>
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
    		<button type="button" style="background:#e67e22;" class="btn btn-sm">관리자 페이지</button>
    	</div>
	    <div class="col-md-7"></div>
      <div class="col-md-3">
    		<button type="button" style="background:#53dc98;" class="btn btn-sm">회원 관리</button>
    		<button type="button" style="background:#53dc98;" class="btn btn-sm">신고 관리</button>
    		<button type="button" style="background:#53dc98;" class="btn btn-sm">회계 관리</button>
    	</div>
    </div>  
    ${id}  로그인 중
    닉네임 : ${name} 
    <!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-3"></div>
    </div>
    
    <div class="row">
   		<div class="col-md-12">
   			<span class="glyphicon glyphicon-pencil"></span>
  			<div class="input-group">  		
 					<input name="NOTICE_SUBJECT" type="text" class="form-control" aria-describedby="sizing-addon1">
				</div>
   		</div>
    </div>
    
	   <form>
	    <div class="row">
	     	<div class="col-md-12">
	    		<div class="checkbox">
	    			<label>
	      			<input type="checkbox" name="NOTI">상단 고정
	    			</label>
	  			</div>
	  		</div>
	  	</div>
    </form>
    
    <!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-1"></div>
    </div>
    
    <!-- 본문 textarea를 ckeditor로 교체 -->
    <div class="row">
    	<div class="col-md-12">
    		<textarea name = "NOTICE_CONTENT"></textarea>
					<script>CKEDITOR.replace('NOTICE_CONTENT');</script>
    		</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<table>
    			<tr>
    				<td>
    					<div align="center">미리 보기	</div>
    				</td>
    				<td>
							<div class = "col-12 filebox padd0 filebox preview-image">
				         <label for="input-file">업로드</label> 
				         <input class="upload-name" value="파일선택" disabled="disabled" style = "text-align : right" > 
				         <input type="file" id="input-file" class="upload-hidden" name = "NOTICE_FILE"> 
					    </div>
    				</td>
    			</tr>
  
    		</table>
    	</div>
    </div>

		<!-- 여백용 row -->
    <div class="row">
    	<div class="col-md-12 p-1"></div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="text-right">
					<a type="button" style="background:#53dc98; color:white;" class="btn btn-sm" id="btnSave" href="javascript:addboard()">등록</a>
	  			<a type="button" style="background:#e67e22; color:white;" class="btn btn-sm" id="btnList" href="javascript:history.go(-1)">취소</a>
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

  	<script language="javascript">
		function addboard(){
			boardform.submit();
		}		
		</script>
    
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

		//preview image 
		var imgTarget = $('.preview-image .upload-hidden'); 
		imgTarget.on('change', function(){ 
			var parent = $(this).parent(); 
			parent.children('.upload-display').remove(); 
			if(window.FileReader){ //image 파일만 
				if (!$(this)[0].files[0].type.match(/image\//)) return;
			var reader = new FileReader(); 
			reader.onload = function(e){ 
				var src = e.target.result; 
				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
				} 
			reader.readAsDataURL($(this)[0].files[0]); 
			} 
			else { 
				$(this)[0].select(); 
				$(this)[0].blur(); 
				var imgSrc = document.selection.createRange().text; 
				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
				var img = $(this).siblings('.upload-display').find('img'); 
				img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
				} 
			});
		</script>

  </body>

</html>
