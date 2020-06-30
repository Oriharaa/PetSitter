<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<!-- 반려동물 등록 -->
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
		<link rel="stylesheet" type="text/css" href="resources/css/UT_CSS/petRegister.css">


    
    
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

            </div>x

            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>
        </div>

      </header>
      
<!-- 본 기능 추가 시작 -->
<section class="top_box">
  <div class="container">
    <div class="row justify-content-start">     
	  	<div class="col-8">
	    	<div class="top_box_title">
	      	<h1 class="top_box_text1">My Pet 등록</h1>
		  		<p class="top_box_text2">지금 바로 반려동물을 등록해보세요.</p>
	    	</div>
	  	</div>
	  	
	 	  <div class="col-3">
	  	</div>
	  	
		</div>
  </div>
</section>
<section class="middle_box">
  <div class="container">
    <div class="row">
      <div class="col">
	    	<div class="inner">
		  		<form name="frm_ins" method="post" enctype="multipart/form-data" target="frm_hiddenFrame" onsubmit="return check_register();">
		    
		    		<div class="row">
			 	 			<div class="col">
			  				<div class="div_txt">
			  					<input type="text" name="user_id" id="user_id" class="input_txt" placeholder="">
			  					<span class="span_txt" id="input_id">ID</span>
			  				</div>
			  			</div>
			  			<div class="col">
			  				<div class="div_txt">
			  					<input type="text" name="pet_animal" id="pet_animal" class="input_txt" placeholder="예 : 강아지">
			    				<span class="span_txt" id="input">종류</span>	
			  				</div>
			  			</div>
			  		</div>
						
						<div class="row">
							<div class="col">
								<div class="div_txt">
									<input type="text" name="pet_kind" id="pet_kind" class="input_txt" placeholder="예 : 푸들">
									<span class="span_txt" id="input">품종</span>
								</div>
							</div>
							<div class="col">
								<div class="div_txt">
									<input type="text" name="pet_name" id="pet_name" class="input_txt" placeholder="예 : 밍키">
									<span class="span_txt" id="input">이름</span>
								</div>	
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<div class="div_txt">
									<input type="text" name="pet_weight" id="pet_weight" class="input_txt" placeholder="예 : 9kg">
									<span class="span_txt" id="input">체중</span>
								</div>
							</div>	
							<div class="col">
								<div class="div_txt">
									<input type="text" name="pet_birth" id="pet_birth" class="input_txt" placeholder="예 : 2020/06/16">
									<span class="span_txt" id="input">생년월일</span>			
								</div>
							</div>			
						</div>
						
						<br><br><br>
						
						<div class="row">
							<div class="col">
								<div class="div_txt2">
									<span class="span_txt2" id="checkbox">성별</span>
									<input type="text" name="pet_sex" id="pet_sex" class="input_txt" disabled/>
										<div class="div_rd">
											<input type="radio" name="pet_sex" id="male" class="input_rd">
											<span>수컷</span>
											<input type="radio" name="pet_sex" id="female" class="input_rd">
											<span>암컷</span>
										</div>
								</div>
							</div>

							<div class="col">
								<div class="div_txt2">
									<span class="span_txt2" id="checkbox">중성화 수술 여부</span>
									<input type="text" name="pet_operation" id="pet_operation" class="input_txt" disabled/>
										<div class="div_rd">
											<input type="radio" name="pet_operation" id="yes1" class="input_rd">
											<span>했음</span>
											<input type="radio" name="pet_operation" id="no1" class="input_rd">
											<span>안했음</span>
										</div>
								</div>
							</div>
							
							<div class="col">
								<div class="div_txt2">
									<span class="span_txt2" id="checkbox">배변훈련 여부</span>
									<input type="text" name="pet_shit" id="pet_shit" class="input_txt" disabled/>
										<div class="div_rd">
											<input type="radio" name="pet_shit" id="yes2" class="input_rd">
											<span>했음</span>
											<input type="radio" name="pet_shit" id="no2" class="input_rd">
											<span>안했음</span>
										</div>
								</div>
							</div>
					
							<div class="col">
								<div class="div_txt2">
									<span class="span_txt2" id="checkbox">예방접종 여부</span>
									<input type="text" name="pet_prevent" id="pet_prevent" class="input_txt" disabled/>
										<div class="div_rd">
											<input type="radio" name="pet_prevent" id="yes3" class="input_rd">
											<span>했음</span>
											<input type="radio" name="pet_prevent" id="no3" class="input_rd">
											<span>안했음</span>
										</div>	
								</div>
							</div>
						</div>	
					
						<br><br><br>
						
						<div class="row">
							<div class="col">
								<div class="div_txt3">
									<span class="span_txt3" id="file">사진 업로드</span>
								</div>
								<div class="div_txt3">
									<img class="noimg" src="resources/images/noimg.png">
									<img class="noimg" src="resources/images/noimg.png">
									<img class="noimg" src="resources/images/noimg.png">
									<img class="noimg" src="resources/images/noimg.png">
									<img class="noimg" src="resources/images/noimg.png">
								</div>
								<div class="div_file">
									<div class="filebox">
										<label for="input-file" class="upload">업로드</label>
										<input type="file" id="input-file" class="upload-hidden">
										<label for="input-file" class="upload2">업로드</label>
										<input type="file" id="input-file" class="upload-hidden">			
										<label for="input-file" class="upload2">업로드</label>
										<input type="file" id="input-file" class="upload-hidden">			
										<label for="input-file" class="upload2">업로드</label>
										<input type="file" id="input-file" class="upload-hidden">			
										<label for="input-file" class="upload2">업로드</label>
										<input type="file" id="input-file" class="upload-hidden">																		
									</div>
								</div>
							</div>
						</div>
						
						<br><br>
						
						<div class="row">
							<div class="col-9">
							</div>
							<div class="col-3">
								<div class="div_btn">
									<input type="button" value="펫 등록" class="btn_next">
								</div>
							</div>
						</div>
						
		  		</form>
				</div>
	  	</div>
    </div>
  </div>
</section>





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