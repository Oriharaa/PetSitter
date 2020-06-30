<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.MemberVO" %>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<!doctype html>
<html lang="ko">


<style>
/*펫시터 메인 폰트컬러 */
.main_mintfont {
	color: #53DC98 !important;
}

.main_whitefont {
	color: #ffffff !important;
}

#main_whitefont2 {
	color: #ffffff !important;
}

#main_whitefont2 {
	color: #ffffff !important;
}

#main_grayfont1 {
	color: #707070 !important;
}

#main_grayfont2 {
	color: #949494 !important;
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
	background: #d3d3d3 !important;
	height: calc(100vh);
	-webkit-transform: translateX(110%);
	-ms-transform: translateX(110%);
	transform: translateX(110%);
	-webkit-box-shadow: -10px 0 20px -10px rgba(0, 0, 0, 0.1);
	box-shadow: -10px 0 20px -10px rgba(0, 0, 0, 0.1);
	-webkit-transition: .3s all ease-in-out;
	-o-transition: .3s all ease-in-out;
	transition: .3s all ease-in-out;
}
/* 기본 상단바 끝*/
.site-mobile-menu .site-mobile-menu-body {
	background: #d3d3d3 !important;
	overflow-y: scroll;
	-webkit-overflow-scrolling: touch;
	position: relative;
	padding: 0 20px 20px 20px;
	height: calc(100vh - 52px);
	padding-bottom: 150px;
}
/* 기본 상단바 끝*/

/*최하단바 시작*/
.site-footer {
	padding: 4em 0;
	background: #e9e9e9 !important;
}
/*최하단바 종료*/
</style>


<head>
<title>내 정보 보기</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,700&display=swap"
	rel="stylesheet">
<!-- 아이콘 css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/aos.css">

<!-- MAIN CSS 다양한 폰트크기보유 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">



</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">



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
						<a href="#" class=""><span class="mr-2  icon-envelope-open-o"></span>
							<span class="d-none d-md-inline-block">petsitter@naver.com</span></a>
						<span class="mx-md-2 d-inline-block"></span> <a href="#" class=""><span
							class="mr-2  icon-phone"></span> <span
							class="d-none d-md-inline-block">(02).2010.1010</span></a>

						<div class="float-right">
                <a href="profile.me?id=<%=id %>"><span class="font-size-14" ><%=name %>님 </span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
						</div>

					</div>

				</div>

			</div>
		</div>

		<header class="site-navbar js-sticky-header site-navbar-target"
			role="banner" style="background: rgba(83, 220, 152, 0.86);">

			<div class="container">
				<div class="row align-items-center position-relative">


					<div class="site-logo">
						<a href="home.me"><span class="main_whitefont">PET SITTER</span></a>
					</div>

					<div class="col-12">
						<nav class="site-navigation text-right ml-auto " role="navigation">

							<ul
								class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
								<li><a href="basicform.me" class="nav-link"
									id="main_whitefont2" style="font-size: 15px">방문 돌봄</a></li>
								<li><a href="basicform.me" class="nav-link"
									id="main_whitefont2" style="font-size: 15px">위탁 돌봄</a></li>
								<li><a href="basicform.me" class="nav-link"
									id="main_whitefont2" style="font-size: 15px">반려동물 전문가 상담</a></li>
								<li><a href="basicform.me" class="nav-link"
									id="main_whitefont2" style="font-size: 15px">후기 게시판</a></li>
								<li><a href="basicform.me" class="nav-link"
									id="main_whitefont2" style="font-size: 15px">공지사항</a></li>

							</ul>
						</nav>

					</div>

					<div class="toggle-button d-inline-block d-lg-none">
						<a href="#"
							class="site-menu-toggle py-5 js-menu-toggle text-black"><span
							class="icon-menu h3"></span></a>
					</div>

				</div>
			</div>

		</header>





		<div class="container">
			<div class="row my-2">
				<div class="col-lg-8 order-lg-2">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a href="" data-target="#profile"
							data-toggle="tab" class="nav-link active">프로필</a></li>
						<li class="nav-item"><a href="" data-target="#messages"
							data-toggle="tab" class="nav-link">메세지</a></li>
						<li class="nav-item"><a href="" data-target="#transaction"
							data-toggle="tab" class="nav-link">거래내역</a></li>
						<li class="nav-item"><a href="" data-target="#edit"
							data-toggle="tab" class="nav-link">회원정보 수정</a></li>
					</ul>
					<div class="tab-content py-4">
						<div class="tab-pane active" id="profile">
							<h5 class="mb-3">회원 프로필</h5>
							<div class="row">
								<div class="col-md-6">
									<h6>상태</h6>
									<p>회원</p>
									<h6>등급&nbsp;&nbsp; ${membervo.getMEMBER_RANK() }</h6> 
									<p>골드</p>
								</div>
								<div class="col-md-6">
									<h6>이용횟수 :&nbsp;&nbsp;&nbsp; ${membervo.getMEMBER_COUNT() }</h6>
									<hr>
									<h6>할인쿠폰 :</h6>
									<hr>
									<h6>포인트 :</h6>
									<hr>
								</div>
								<div class="col-md-12">
									<h5 class="mt-2">
										<span class="fa fa-clock-o ion-clock float-right"></span>최근 거래내역</h5>
									<table class="table table-sm table-hover table-striped">
										<tbody>
											<tr>
												<td><strong>펫시터1</strong> 님과 <strong>[거래번호 202006180009]</strong>을 거래했습니다.</td>
											</tr>
											<tr>
												<td><strong>펫시터1</strong> 님과 <strong>[거래번호	202006180008]</strong>을 거래했습니다.</td>
											</tr>
											<tr>
												<td><strong>펫시터1</strong> 님과 <strong>[거래번호	202006180007]</strong>을 거래했습니다.</td>
											</tr>
											<tr>
												<td><strong>펫시터1</strong> 님과 <strong>[거래번호	202006180006]</strong>을 거래했습니다.</td>
											</tr>
											<tr>
												<td><strong>펫시터1</strong> 님과 <strong>[거래번호	202006180005]</strong>을 거래했습니다.</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!--/row-->
						</div>
						<div class="tab-pane" id="messages">
							<div class="alert alert-info alert-dismissable">
								<a class="panel-close close" data-dismiss="alert">×</a> This is
								an <strong>.alert</strong>. Use this to show important messages
								to the user.
							</div>
							<div class="alert alert-info alert-dismissable">
								<a class="panel-close close" data-dismiss="alert">×</a> This is
								an <strong>.alert</strong>. Use this to show important messages
								to the user.
							</div>
							<table class="table table-hover table-striped">
								<tbody>
									<tr>
										<td><span class="float-right font-weight-bold">3
												hrs ago</span> Here is your a link to the latest summary report
											from the..</td>
									</tr>
									<tr>
										<td><span class="float-right font-weight-bold">Yesterday</span>
											There has been a request on your account since that was..</td>
									</tr>
									<tr>
										<td><span class="float-right font-weight-bold">9/10</span>
											Porttitor vitae ultrices quis, dapibus id dolor. Morbi
											venenatis lacinia rhoncus.</td>
									</tr>
									<tr>
										<td><span class="float-right font-weight-bold">9/4</span>
											Vestibulum tincidunt ullamcorper eros eget luctus.</td>
									</tr>
									<tr>
										<td><span class="float-right font-weight-bold">9/4</span>
											Maxamillion ais the fix for tibulum tincidunt ullamcorper
											eros.</td>
									</tr>
								</tbody>
							</table>
						</div>


						<div class="tab-pane" id="transaction"></div>

						<div class="tab-pane" id="edit">
							<form role="form">
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">이름</label>
									<div class="col-lg-9">
										<input class="form-control" type="text" name="MEMBER_NAME" id="MEMBER_NAME">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">닉네임</label>
									<div class="col-lg-9">
										<input class="form-control" type="text" name="MEMBER_NICKNAME" id="MEMBER_NICKNAME">
									</div>
								</div>
								<!-- <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">E-mail</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="email" value="email@gmail.com">
                            </div>
                        </div> -->
                <div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">성별</label>
									<div class="col-lg-9">
										<input class="form-control" type="radio" name="MEMBER_GENDER" id="MEMBER_GENDER">남 &nbsp;&nbsp;
										<input class="form-control" type="radio" name="MEMBER_GENDER" id="MEMBER_GENDER">여
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">전화번호</label>
									<div class="col-lg-9">
										<input class="form-control" type="text"
											class="form-control bfh-phone" data-format="(ddd) ddd-dddd"
											placeholder="-를 빼고 숫자만 입력해주세요." name="MEMBER_TEL" id="MEMBER_TEL">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">주소</label>
									<div class="col-lg-9">
										<input class="form-control" type="text" name="MEMBER_ADDRESS"
											placeholder="도로명 주소">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label"></label>
									<div class="col-lg-9">
										<input class="form-control" type="text" name="MEMBER_ADDRESS"
											placeholder="상세 주소">
									</div>
								</div>

								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">비밀번호</label>
									<div class="col-lg-9">
										<input class="form-control" type="password" name="MEMBER_PW" id="MEMBER_PW1">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">비밀번호
										확인</label>
									<div class="col-lg-9">
										<input class="form-control" type="password" name="MEMBER_PW2" id="MEMBER_PW2">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label"></label>
									<div class="col-lg-9">
										<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label"></label>
									<div class="col-lg-9">
										<input type="reset" class="btn btn-secondary" value="취소">
										<input type="button" class="btn btn-primary" id="updatebutton" value="회원정보 수정" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="col-lg-4 order-lg-1 text-center">
					<img src="//placehold.it/150"
						class="mx-auto img-fluid img-circle d-block" alt="avatar">
					<h6 class="mt-2">회원님의 사진을 업로드하세요.</h6>
					<label class="custom-file"> <input type="file" id="file"
						class="custom-file-input"> <span
						class="custom-file-control">파일 선택하기</span>
					</label>
				</div>
			</div>
		</div>



		<!-- 하단 바 시작 -->
		<footer class="site-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-7">
								<h2 class="footer-heading mb-4" id="main_grayfont1">About
									Us</h2>
								<p id="main_grayfont2" style="font-size: 14px;">반려동물들을 위해
									고객과 펫시터와를 연결시켜주는 매칭 플렛폼입니다. 신뢰와 안전을 위해 최선을 다하겠습니다.</p>
							</div>
							<div class="col-md-4 ml-auto">
								<h2 class="footer-heading mb-4" id="main_grayfont1">CONTANTS</h2>
								<ul class="list-unstyled">
									<li><a href="#" id="main_grayfont2"
										style="font-size: 14px;">방문 돌봄</a></li>
									<li><a href="#" id="main_grayfont2"
										style="font-size: 14px;">위탁 돌봄</a></li>
									<li><a href="#" id="main_grayfont2"
										style="font-size: 14px;">반려동물 전문가 상담</a></li>
									<li><a href="#" id="main_grayfont2"
										style="font-size: 14px;">후기 게시판</a></li>
									<li><a href="#" id="main_grayfont2"
										style="font-size: 14px;">공지사항</a></li>
								</ul>
							</div>

						</div>
					</div>
					<div class="col-md-4 ml-auto">




						<h2 class="footer-heading mb-4" id="main_grayfont1">Follow
							Us</h2>
						<a href="https://www.facebook.com/" class="smoothscroll pl-0 pr-3"
							target="_blank"><span class="icon-facebook"
							id="main_grayfont2"></span></a> <a href="https://twitter.com/"
							class="pl-3 pr-3" target="_blank"><span class="icon-twitter"
							id="main_grayfont2"></span></a> <a href="https://www.instagram.com/"
							class="pl-3 pr-3" target="_blank"><span
							class="icon-instagram" id="main_grayfont2"></span></a> <a
							href="https://www.linkedin.com/" class="pl-3 pr-3"
							target="_blank"><span class="icon-linkedin"
							id="main_grayfont2"></span></a>
						</form>
					</div>
				</div>
				<div class="row pt-5 mt-5 text-center">
					<div class="col-md-12">
						<div class="border-top pt-5">
							<p id="main_grayfont2">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="icon-heart" aria-hidden="true" id="main_grayfont2"></i>
								<a href="https://colorlib.com" target="_blank"
									id="main_grayfont2">by Colorlib</a>
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
	<script
		src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.fancybox.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<script src="<c:url value="./resources/js/aos.js"/>"></script>

	<script src="<c:url value="/resources/js/main.js"/>"></script>
	
	<script>
		$(function() {
			
			var	tel = $("#MEMBER_TEL").val();
			$("#alert-danger").hide();
			
			$("#MEMBER_PW1, #MEMBER_PW2").on("keyup", function() {
				var pw1 = $("#MEMBER_PW1").val();
				var	pw2 = $("#MEMBER_PW2").val();	
				if(pw1 !== pw2) {
					$("#alert-danger").show();
					$("#updatebutton").attr("disabled", true);
				} else {
					$("#alert-danger").hide();
					$("#updatebutton").attr("disabled", false);
				}
			});
			
			$("#updatebutton").click(function() {
				location.href="memberUpdate.me?id=<%=id %>";
			});
		});
	</script>

</body>

</html>
