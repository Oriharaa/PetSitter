<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.spring.petsitter.MemberController.*" %>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<PetVO> list = (ArrayList<PetVO>)request.getAttribute("list");
	String memberId = (String)request.getAttribute("memberId");
	String petPhoto = (String)request.getAttribute("petPhoto");
	String petName = (String)request.getAttribute("petName");	
%>


<!-- 반려동물 등록 -->
<!doctype html>
<html lang="ko">


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
    <title>반려동물 등록 페이지</title>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/UT_CSS/myPet.css?after">



		<!-- 모달창 제이쿼리 UI -->
		<link href="/resources/jqueryui/jquery-ui.css" rel="stylesheet">
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="/resources/jqueryui/jquery-ui.js"></script>


  </head>
  
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
                <a href="memberinfo.me?id=${id }"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
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
              <nav class="site-navigation text-right ml-auto " role="navigation" >
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

      </header>
      
<!-- 본 기능 추가 시작 -->
<section class="top_box">
	<div class="container">
		<div class="row">
		
			<div class="col-4">
				<div class="insert">
					<div class="p1">
						<p><i class="fas fa-paw" id="i_1"></i></p>
					</div>
					<div class="p2">
						<p>서비스 이용을 위해서</p>
						<p>마이펫 등록을 해주세요</p>
					</div>
					<div class="insert_div">
						<a href="petRegister.me" class="insert_btn">마이펫 등록	</a>
					</div>
				</div>
			</div>
												  	
			<div class="col-4">
				<div class="update">
					<div class="p1">
						<p><i class="fas fa-pencil-alt" id="i_2"></i></p>
					</div>
					<div class="p2">
						<p>1년 주기로</p>
						<p>정보 수정을 권장합니다</p>
					</div>
					<div class="update_div">
						<a href="#" class="update_btn" onclick="openModalUp();">마이펫 수정</a>
					</div>
				</div>
			</div>
			
			<div class="col-4">
				<div class="delete">
					<div class="p1">
						<p><i class="far fa-trash-alt" id="i_3"></i></p>
					</div>
					<div class="p2">
						<p>삭제가 필요할 경우</p>
						<p>아래 버튼을 눌러주세요</p>
					</div>
					<div class="delete_div">
						<a href="#" class="delete_btn" onclick="openModalDel();">마이펫 삭제</a>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col">
				<div class="lr">
					<div class="left">
						<div class="l-1">
							<a href="memberinfo.me?id=${id}" class="left-btn"><i class="far fa-hand-point-left" id="left-icon"></i></a>
						</div>
						<div class="l-2">
							<a href="memberinfo.me?id=${id}" class="left-text">마이페이지</a>
						</div>
					</div>

					<div class="right">
						<div class="r-1">
							<a href="reservation1.br" class="right-text">예약하기</a>
						</div>
						<div class="r-2">
							<a href="reservation1.br" class="right-btn"><i class="far fa-hand-point-right" id="right-icon"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<!-- 모달 모달 모달 --><!-- 모달 모달 모달 --><!-- 모달 모달 모달 -->
<!-- 모달 모달 모달 --><!-- 모달 모달 모달 --><!-- 모달 모달 모달 -->
<!-- 수정 모달창 -->
<!-- 모달창 백그라운드 -->
<div id="modalUp" class="searchModalUp">
	<!-- 모달창 내용물 -->
	<div class="search-modal-content">
		<div class="page-header">
			<h1 class="md-header">마이펫 현황</h1>
			<p class="md-header-p">정보수정을 원하는 펫을 선택해주세요!</p>
		</div>
		<div class="row">
			
			<%
  			for(int i=0; i<list.size(); i++) {
	  		PetVO pet = list.get(i);
			%>
			<div class="col-4">
				<div class="list-div">
					<div class="pet-div">
						<div class="petName">
							<%=pet.getPET_NAME()%>
						</div>
						<div class="petPhoto">
							 <a href ="petSelect.me?name=<%=pet.getPET_NAME()%>"><img class="petImg" id="pet-<%=i%>" src="/filepath/<%=pet.getPET_PHOTO()%>"></a> 
						</div>
					</div>
				</div>
			</div>
		<% } %>
		</div>
		<div class="row">
			<div class="close" onClick="closeModalUp();">
				<p class="close_btn">닫기</p>
			</div>
		</div>
	</div><hr>
</div>


<!-- 삭제 모달창  시작-->
<!-- 모달창 백그라운드 -->
<div id="modalDel" class="searchModalDel">
	<!-- 모달창 내용물 -->
	<div class="search-modal-content">
		<div class="page-header">
			<h1 class="md-header">마이펫 현황</h1>
			<p class="md-header-p">정보삭제를 원하는 펫을 선택해주세요!</p>
		</div>
		<div class="row">
			
			<%
  			for(int i=0; i<list.size(); i++) {
	  		PetVO pet = list.get(i);
			%>
			<div class="col-4">
				<div class="list-div">
					<div class="pet-div">
						<div class="petName">
							<%=pet.getPET_NAME()%>
						</div>
						<div class="petPhoto">
							 <a href ="petDelete.me?name=<%=pet.getPET_NAME()%>"><img class="petImg" id="pet-<%=i%>" src="/filepath/<%=pet.getPET_PHOTO()%>"></a> 
						</div>
					</div>
				</div>
			</div>
		<% } %>
					
		</div>
		<div class="row">
			<div class="close" onClick="closeModalDel();">
				<p class="close_btn">닫기</p>
			</div>
		</div>
	</div><hr>
</div>
<!-- 모달 모달 모달 --><!-- 모달 모달 모달 --><!-- 모달 모달 모달 -->
<!-- 모달 모달 모달 --><!-- 모달 모달 모달 --><!-- 모달 모달 모달 -->

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
            <!-- </form> -->
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
	

    <script src="<c:url value="./resources/js/aos.js"/>"></script><!-- nav 상단바 반응형웹 적용1 -->

    <script src="<c:url value="/resources/js/main.js"/>"></script><!-- nav 상단바 반응형웹 적용2 -->
    
    <!-- 아이콘 -->   
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
    
<!-- 툴팁창 -->
<script>
  $(function () {
		$('[data-toggle="tooltip"]').tooltip()
	});
</script>

<!-- 모델 열고 닫기 (수정)-->
<script>
	function openModalUp() {
		$("#modalUp").show();
	};

	function closeModalUp() {
		$('.searchModalUp').hide();
	};
</script>

<!-- 모델 열고 닫기 (삭제)-->
<script>
	function openModalDel() {
		$("#modalDel").show();
	};

	function closeModalDel() {
		$('.searchModalDel').hide();
	};
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