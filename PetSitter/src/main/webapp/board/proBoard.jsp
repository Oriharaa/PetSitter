<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <!-- 언택 추가 CSS -->
		<link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/proBoard.css">
    
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

<!-- top_box 시작-->
<section class="top_box">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col">
				<div class="top_box_title">
					<h1 class="top_box_text1">질문을 등록하면 해당 분야의	<br>전문가가 상담해드립니다.</h1>
					<p class="top_box_text2">바쁜 일상에 대면 상담이 부담스러우신가요?<br>
																	 반려동물 뷰티, 심리상담, 행동교정 등 전문가 상담 게시판을 통해<br>
																	 1:1 질의응답으로 다양한 펫 전문가들과 상담을 나눌 수 있습니다.</p>
					<a class ="register" href ="#">질문 등록하러가기
						<!-- 화살표 아이콘 -->
						<svg class="bi bi-arrow-right" width="2em" height="2em" viewBox="0 0 16 16" color="#53DC98" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  					<path fill-rule="evenodd" d="M10.146 4.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 8l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
  					<path fill-rule="evenodd" d="M2 8a.5.5 0 0 1 .5-.5H13a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8z"/>
						</svg>
					</a>
				

				
				</div>
			</div>
			<div class="col">
				<div class="top_image">
					<img src="resources/images/pro_1.jpg" alt="#" class="img-fluid">
				</div>
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
				<div class="middle_title">
					<h3 class="middle_text1">전문가 소개</h3>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<div class="middle_body">
					<div class="middle_img">
						<img src="resources/images/Gang_1.jpg" class="expert_img" alt="...">
					</div>
					<div class="middle_text">
						<p class="middle_body_text1">강형욱 애견훈련사</p>
						<span class="middle_body_text2">TV동물농장 110회 출연</span><br>
						<a href ="#" class="register2">질문하기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="middle_body">
					<div class="middle_img">
						<img src="resources/images/Gang_1.jpg" class="expert_img" alt="...">
					</div>
					<div class="middle_text">
						<p class="middle_body_text1">강형욱 애견훈련사</p>
						<span class="middle_body_text2">TV동물농장 110회 출연</span><br>
						<a href ="#" class="register2">질문하기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="middle_body">
					<div class="middle_img">
						<img src="resources/images/Gang_1.jpg" class="expert_img" alt="...">
					</div>
					<div class="middle_text">
						<p class="middle_body_text1">강형욱 애견훈련사</p>
						<span class="middle_body_text2">TV동물농장 110회 출연</span><br>
						<a href ="#" class="register2">질문하기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="middle_body">
					<div class="middle_img">
						<img src="resources/images/Gang_1.jpg" class="expert_img" alt="...">
					</div>
					<div class="middle_text">
						<p class="middle_body_text1">강형욱 애견훈련사</p>
						<span class="middle_body_text2">TV동물농장 110회 출연</span><br>
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
				<div class="bottom_title">
				<h3 class="bottom_text1">전문가 Q.A</h3>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<div class="bottom_table">
					<table class="PRO_TABLE">
					<thead>
						<tr class="PRO_PRO">
							<!-- PRO_NUM -->
							<td scope="col">1</td>
							<!-- MEMBER_ID -->
							<td scope="col">TESTMAN1</td>
							<!--PRO_DATE -->
							<td scope="col">2020-06-18</td>
							<!--PRO_READCOUNT  -->
							<td scope="col">조회 수 : 30</td>
							<!-- PRO_LIKECOUNT -->
							<td scope="col">좋아요 수 : 30</td>
						</tr>
					</thead>
					<tbody>
						<tr class="PRO_SUBJECT">
			      	<th></th>
			     		<th colspan = "4">저희 집 고양이가 이상해요</th>
			   		</tr>
			    	<tr class="PRO_CONTENT">
			    		<td></td>
			      	<td colspan ="4">저희 집고양이가 요즘 잠을 너무 많이자는것같아요</td>
			    	</tr>
			    	<tr class="PRO_READMORE">
			   			<td></td>
			      	<td colspan ="4"><a href="#" class="read">read more</a></td>
						</tr>
			  	</tbody>
					</table>
				</div>
			</div>
			
			
			<div class="col">
				<div class="bottom_table">
					<table class="PRO_TABLE">
					<thead>
						<tr class="PRO_PRO">
							<!-- PRO_NUM -->
							<td scope="col">1</td>
							<!-- MEMBER_ID -->
							<td scope="col">TESTMAN1</td>
							<!--PRO_DATE -->
							<td scope="col">2020-06-18</td>
							<!--PRO_READCOUNT  -->
							<td scope="col">조회 수 : 30</td>
							<!-- PRO_LIKECOUNT -->
							<td scope="col">좋아요 수 : 30</td>
						</tr>
					</thead>
					<tbody>
						<tr class="PRO_SUBJECT">
			      	<th></th>
			     		<th colspan = "4">저희 집 고양이가 이상해요</th>
			   		</tr>
			    	<tr class="PRO_CONTENT">
			    		<td></td>
			      	<td colspan ="4">저희 집고양이가 요즘 잠을 너무 많이자는것같아요</td>
			    	</tr>
			    	<tr class="PRO_READMORE">
			   			<td></td>
			      	<td colspan ="4"><a href="#" class="read">read more</a></td>
						</tr>
			  	</tbody>
					</table>
				</div>
			</div>
		</div>
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
    <script src="<c:url value="./resources/js/aos.js"/>"></script><!-- nav 상단바 반응형웹 적용1 -->
    <script src="<c:url value="/resources/js/main.js"/>"></script><!-- nav 상단바 반응형웹 적용2 -->
    
</body>
</html>