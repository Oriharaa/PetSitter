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
</head>
<style>
	.box {
  	border: 1px dashed;
  	width: 70%;
  	margin: 3% auto;
  }
/* top_box */
	.top_box {
		margin-top: 3%;
	}

	.top_box_text1 {
		font-size:70px;
		color:#53DC98;
		font-weight:bold;
	}

	.top_box_text2 {
		font-size:16px;
		color:rgb(94,94,94);
		font-weight:bold;
	}

/* middle_box */
	.middle_box {
	
	}
	  
	.div_txt {
		position:relative;
	}
	
	.div_txt2 {
		position:relative;
	} 
		 
	.div_rd {
		position:absolute; bottom:10px;
	}	 
	  
	.span_txt {
		position:absolute; top:0; left:0;
		margin-top: 5px;
		color:#53DC98;
		font-weight:bold;
		font-size:18px;
	}	  

	.span_txt2 {
		color:#53DC98; 
		font-weight:bold;
		font-size:18px;
	}
	
	.span_txt3{
		color:#53DC98;
		font-weight:bold;
		font-size:18px;
		margin:20% 0 0 0;
	}

	.noimg {
		border-top:1px solid #949494;
		border-right: 1px solid #949494;
		border-bottom: 1px solid #949494;;
		border-left: 1px solid #949494;
		width:24%; /*19*/
		height:266px;
		margin:0 0.4em 0 0;
	}
	 
	.input_txt {
		width:103%;
		height:40px;
		text-align:left;
		border-top:0px;
		border-right:0px;
		border-left:0px;
		/* border-bottom:0.2em solid #5483B1; */
		border-bottom:0.2em solid #949494;
		color:#949494;
	}
	
	.date {
		display: flex;
	}
	
	.pay_date {
		padding-left: 80px;
		width: 260px;
	}
	
	.end_date {
		left: 50%;
		margin-left: 27px;
	}
	
	.time {
		display: flex;
	}
	
	.pay_time {
		padding-left: 100px;
		width: 260px;
	}
	
	.end_time {
		left: 50%;
		margin-left: 27px;
	}
	  
	.btn_file {
		width:19%;
		margin:0 0.4em 0 0;
	}		  

	.btn_next{
		margin:3% 0 0 14%;
		width:50%;
		height:100px;
		background-color:white;
		color:#53DC98;
		font-size:70px; font-weight:bold;
		border:0;
	}

	#PET_BIRTH {
		padding-left:16%;
	}

	.filebox input[type="file"] {
		position: absolute; 
		width: 1px;
		height: 1px; 
		padding: 0;
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
	}

	.upload {
		width:24%;
		text-align:center;
		border:1px;
		background-color:#949494;
		color:#ffffff;
	}

	.div_img {
		width:400px;
		heigth:200px;
	}

	#icon1{
		width:30%;
		height:80px;
	}
	
	#home_button {
		margin-left: 250px;
	}
	
	#mypage {
		margin-left: 100px;
	}
	.press_button {
		width: 250px;
    font-weight: bolder;
    font-size: x-large;
	}

input::placeholder {
	text-align:center;
}
input[type=number] {
	padding-left:10%;
}

/*인풋&버튼 클릭시 색상 없애기*/
input:focus {outline:none;}
button:focus {outline:none;} 

/*인풋 색상 변경*/
/* input:focus {outline:2px solid #d50000;} */
</style>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<div class="site-wrap" id="home-section">
<!-- 본 기능 추가 시작 -->
<div class="box">
<section class="top_box">
  <div class="container">
    <div class="row justify-content-start">     
	  	<div class="col-8">
	    	<div class="top_box_title">
	      	<h1 class="top_box_text1">돌봄 결제 내역</h1>
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
		  		<form name="petRegister2" action="petRegister2.me" method="post">
		    
		    		<div class="row">
			 	 			<div class="col">
			  				<div class="div_txt">
			  					<input type="text" name="MEMBER_NAME" id="MEMBER_NAME" class="input_txt" readonly style="padding-left: 60px;" value=${name }>
			  					<span class="span_txt" id="input_id">이름</span>
			  				</div>
			  			</div>
			  			<div class="col">
			  				<div class="div_txt">
			  					<input type="text" name="PAY_TYPE" id="PAY_TYPE" class="input_txt" value="<%=payvo.getPAY_TYPE() %>" readonly style="padding-left: 100px;">
			    				<span class="span_txt" id="input">돌봄 종류</span>	
			  				</div>
			  			</div>
			  		</div>
						
						<div class="row">
							<div class="col">
								<div class="div_txt date">
									<input type="text" name="PAY_DATE" id="PAY_DATE" class="input_txt pay_date" value="<%=payvo.getSTART_DATE().substring(0, 10) %>" readonly>
									<span class="span_txt" id="input_1_date">시작일</span>
									<input type="text" name="PAY_DATE" id="PAY_DATE" class="input_txt pay_date" value="<%=payvo.getEND_DATE().substring(0, 10) %>" readonly style="margin-left: 40px;">
									<span class="span_txt end_date" id="input_2_date">종료일</span>
								</div>
							</div>
							<div class="col">
								<div class="div_txt time" style="display: flex;">
									<input type="text" name="PAY_TIME" id="PAY_TIME" class="input_txt pay_time" value="<%=payvo.getSTART_DATE().substring(11, 13) %>시 <%=payvo.getSTART_DATE().substring(14, 16) %>분" readonly>
									<span class="span_txt" id="input_1_time">시작 시간</span>
									<input type="text" name="PAY_TIME" id="PAY_TIME" class="input_txt pay_time" value="<%=payvo.getEND_DATE().substring(11, 13) %>시 <%=payvo.getEND_DATE().substring(14, 16) %>분" readonly style="margin-left: 35px;">
									<span class="span_txt end_time" id="input_2_time">종료 시간</span>
								</div>	
							</div>
						</div>
						
						<div class="row">
							<div class="col">
							</div>
							
							<div class="col">
								<div class="div_txt">
									<input type="text" name="PAY_AMOUNT" id="PAY_AMOUNT" class="input_txt" readonly style="padding-left: 100px;" value='<%=payvo.getPAY_AMOUNT() %>&nbsp;원'>
									<span class="span_txt" id="input">예약 금액</span>			
								</div>
							</div>			
						</div>
						
						<br><br><br><br><br><br>
						
						<div class="row">
							<div class="col">
								<div class="div_txt2">
										<div class="div_rd">
											<input type="button" name="home_button" id="home_button" class="input_rd press_button" value="홈으로" onclick="go_home()">
											<input type="button" name="mypage" id="mypage" class="input_rd press_button" value="이용 내역">
										</div>
								</div>
							</div>
						</div>
						<br>
		  		</form>
				</div>
	  	</div>
    </div>
  </div>
</section>
</div>
</div>
<!-- 본 기능 추가 종료 -->
<%@ include file="../jsp_bottom.jsp" %>
	<script>
		// 홈으로 버튼 클릭 시 함수 호출
		function go_home() {
			$("#home_button").click(function() {
				location.replace("home.me");
			});
		}
		
		// 이용 내역 클릭 시 함수 호출(로그인 상태여야 가능)
		$(function() {
			console.log('${id}');
			$("#mypage").on("click", function() {
				location.href="memberinfo.me";
			});
		});
	</script>
</body>
</html>