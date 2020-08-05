<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.pay.*" %>
<%
	PayVO payvo = (PayVO)request.getAttribute("payvo");
%>
<%@ include file="../jsp_top.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>돌봄 결제 내역</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/UT_CSS/payConfirm.css?after">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<div class="site-wrap" id="home-section">
</div>



<!-- 본 기능 추가 시작 -->
<section class="box">
	<div class="container">
		
		<div class="row">
			
			<div class="col-3">
				<div class="left">
					<div class="l-1">
						<a href="#" class="left-btn" onclick="go_home()"><i class="far fa-hand-point-left" id="left-icon"></i></a>
					</div>
					<div class="l-2">
						<a href="home.me" class="left-text">홈으로</a>
					</div>
				</div>
			</div>
			
			<div class="col-6">
				<div class="top-head">
					결제가 완료되었습니다
				</div>
			
			
			
				<div class="center">
					<div class="center-head">
						<h1 class="head-1">돌봄 결제 내역</h1>
					</div>
					
					<div class="center-hr">
					</div>
					<div class="center-hr">
					</div>
					<div class="center-hr">
					</div>
					
					<div class="info1">
						결제 유형
					</div>
					
					<div class="center-hr">
					</div>
					<div class="center-hr">
					</div>
					<div class="center-hr">
					</div>
					
					
					<div class="center-ct1">
						<div class="p0">
							<div>결제 방법  </div>
							<p class="top1">카카오페이</p>
						</div>
						<div class="p00">
							<div>승인 금액  </div>
							<p class="top2">50000원</p>
						</div>
					</div>
					
					<div class="center-hr">
					</div>
					<div class="center-hr">
					</div>
					<div class="center-hr">
					</div>
					
					<div class="info2">
						결제 상세 정보
					</div>
					
					<div class="center-hr">
					</div>
					<div class="center-hr">
					</div>
					<div class="center-hr">
					</div>
					
					<div class="center-ct2">
						<div class="p1">
							<div class="d2">이름  </div>
							<p>홍언택</p>
						</div>
						<div class="p2">
							<div>예약 유형  </div>
							<p>위탁</p>
						</div>
						<div class="p3">
							<div>시작 날짜  </div>
							<p>2020-01-01</p>
						</div>
						<div class="p4">
							<div>종료 날짜  </div>
							<p>2020-01-02</p>
						</div>
						<div class="p5">
							<div>시작 시간  </div>
							<p>11시 00분</p>
						</div>
						<div class="p6">
							<div>종료 시간  </div>
							<p>11시 00분</p>
						</div>
					</div>
					
					<div class="center-hr">
					</div>
					<div class="center-hr">
					</div>
					<div class="center-hr">
					</div>
					
					<div class="foot">
					</div>
				
				</div>
			</div>
			
			<div class="col-3">
				<div class="right">
					<div class="r-1">
						<a href="#" class="right-text" id="mypage1">이용내역</a>
					</div>
					<div class="r-2">
						<a href="#" class="right-btn"><i class="far fa-hand-point-right" id="mypage2"></i></a>
					</div>
				</div>
			</div>
				
		</div>
		
	</div>
</section>








<!-- 본 기능 추가 종료 -->







<%@ include file="../jsp_bottom.jsp" %>
	<script>
		// 홈으로 버튼 클릭 시 함수 호출
		function go_home() {
			$(".left-btn").click(function() {
				location.replace("home.me");
			});
		}
		
		// 이용 내역 클릭 시 함수 호출(로그인 상태여야 가능)
		$(function() {
			$("#mypage1").on("click", function() {
				location.href="memberinfo.me";
			});
			
			$("#mypage2").on("click", function() {
				location.href="memberinfo.me";
			});
		}); 
	</script>
</body>
</html>