<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
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
	

	
	.circleprofileimg02 {
	margin : 0 0 0 30px;
	}
	
	.circleprofileimg {
	margin : 0 0 3px 0;
	}
	
	
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
	
	/*ajax 에서 사진 가운데 와 크기 지정 css 시작*/
	.thumbnail-wrappper { 
	width: 25%; 
	} 
	.thumbnail { 
	position: relative; 
	width : 260px;
	height : 260px;
	background : rgba(94,94,94,0.3);
	overflow: hidden; 
	margin-bottom : 4px;
	border-radius : 3px;
	} 
	.thumbnail .centered { 
	position: absolute; 
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0; 
	-webkit-transform: translate(50%,50%); 
	-ms-transform: translate(50%,50%); 
	transform: translate(50%,50%); 
	} 
	
	.thumbnail .centered img { 
	position: absolute; 
	top: 0; 
	left: 0; 
	max-width: auto; 
	max-height: auto; 
	height: auto; 
	-webkit-transform: translate(-50%,-50%); 
	-ms-transform: translate(-50%,-50%);
	 transform: translate(-50%,-50%); 
	 }
	 
	 
	.thumbnail02 { 
	position: relative; 
	width : 60px;
	height : 60px;
	background : rgba(94,94,94,0.3);
	overflow: hidden; 
	margin-bottom : 4px;
	border-radius : 30px;
	} 
	.thumbnail02 .centered02 { 
	position: absolute; 
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0; 
	-webkit-transform: translate(50%,50%); 
	-ms-transform: translate(50%,50%); 
	transform: translate(50%,50%); 
	} 
	
	.thumbnail02 .centered02 img { 
	position: absolute; 
	top: 0; 
	left: 0; 
	max-width: 60px; 
	max-height: auto; 
	height: 60px; 
	-webkit-transform: translate(-50%,-50%); 
	-ms-transform: translate(-50%,-50%);
	 transform: translate(-50%,-50%); 
	 }
	 
	 
	/*ajax 에서 사진 가운데 와 크기 지정 css 종료*/

	/*carousel 고정 높이 조정*/
	.slide {
  height: 266px!important;
  min-height: 266px!important;
  background-size: cover;
	}
	
	
	/*carousel 위치 보여주는 아이콘 바 설정*/
	.carousel-indicators li {
   box-sizing: content-box;
   -ms-flex: 0 1 auto;
   flex: 0 1 auto;
   width: 18px!important;
   height: 3px;
   margin-right: 1.5px!important;
   margin-left: 1.5px!important;
   text-indent: -999px;
   cursor: pointer;
   background-color: #fff;
   background-clip: padding-box;
   border-top: 10px solid transparent;
   border-bottom: 10px solid transparent;
   opacity: .5;
   transition: opacity .6s ease;
   }
   
   /*스크롤 위로올라가기 버튼 css*/
   a#MOVE_TOP_BTN {
   	/* position : 화면에 고정
		right, bottom : 버튼의 위치 설정
		display : 화면에서 숨김
		z-index : 다른 태그들보다 위로 오도록 설정(z-index 가 설정된 다른 태그가 있다면 그 태그보다 커야 함)
		*/
		background: rgb(83, 220, 152);
		color : white;
		width : 90px;
		height : 40px;
    position: fixed; 
    padding : 7px 0 0 30.8px;
    border-radius : 22px;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
		}

		.swal2-content {
			font-size: 15px!important;
		}



</style>


  <head>
    <title>이용 후기</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/petsitter-style.css">
   
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    
		var num = 12; //시작시 리뷰 리스트 출력
		var k = 1;	//반복될시 carousel 맞춤 지정
		var num2 = 24;//더보기 시 불러올수 있는 리뷰 수 계속 추가됨
		var j = 1; //좋아요 아이디 체크 for문용
		var sessionid = "<%=id %>";
		var sessionid2 = ",<%=id %>";
			
		function selectData(){
			$('#reviewForm').empty();
			$.ajax({
        url:'/petsitter/getReviewBoardJSON.bo',
        type:'POST',
        dataType : 'json',
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		
        		
    				if(index < num) {
    				
    				//주소 문자열 추출 2자리	
    				var address = item.petsitter_ADDRESS;
    		   	var Paddress = address.split(',', 2);
    		   	var real_address = Paddress[1].split(' ');
						
    		   	//사진 개 수 별 업로드 문자열 추출
    		   	if(item.review_UP_PHOTO != "N"){
    		   	var upphoto = item.review_UP_PHOTO;
    		   	var Pphoto = upphoto.split(',', 3);
    		   	}
    		   	
    		   	//좋아요 아이디 추출
    		   	if(item.like_ID != "N"){
        		   	var likeids = item.like_ID;
        		   	var likeid = likeids.split(',');
        		}
    		   	
   	       	var reviewForm = '';
		   	    reviewForm += '<!--후기 폼 시작 -->';
		    		reviewForm += '<div class = "col-md-4" style = "align : center; margin-top : 20px;">';
		    		reviewForm += '<div class = "row justify-content-center">';
		    		reviewForm += '<div class = "col-12">';
		    		reviewForm += '<div style = "background :rgba(224, 224, 224, 0.65); height: 600px; width : 322px; border-radius: 6px;">';
		    		reviewForm += '<div class = "row justify-content-center">';
		    		reviewForm += '<div class = "col-10">';
		    		
		    		//좋아요 기능 시작
		    		//좋아요 숫자
		    		reviewForm += '<form id = "likeForm">';
		    		
		    		//세션아이디 비로그인시 좋아요기능
		    		if(sessionid == "null" ){
						var lc = item.like_COUNT;
						var ln = item.list_NUM;
		    		reviewForm += '<div class = "float-right font-size-12 main_grayfont3" style = "margin : 5px 0 0 0;">: ' + item.like_COUNT + '</div>';
		    		reviewForm += '<div class = "float-right" style = "margin : 0 5px 0 0;">';
		    		reviewForm += '<a href ="#" class="loginalert">'; //sweetalert2
		    		reviewForm += '<img src = "resources/images/heart.png" width = "18px" height = "18px"></a></div>';
		    		}
		    		
		    		//좋아요 누른 아이디 확인시 값  바뀜
		    		var idcheck = 1;
		    		
		    		//첫 split된 인데스 0번째는 'N' 으로 1인덱스부터 시작과 il에 1추가로 필요한 길이 맞춤
		    		if (sessionid != "null" && item.like_ID != "N"){
		    			var lc = item.like_COUNT;
		    			var ln = item.list_NUM;
			    		for(j = 1; j < lc+1; j++){
			    			if(likeid[j] == sessionid) {
					    		reviewForm += '<div class = "float-right font-size-12 main_grayfont3" style = "margin : 5px 0 0 0;" id = "textcount'+ln+'">: ' + item.like_COUNT + '</div>';
					    		reviewForm += '<div class = "float-right" style = "margin : 0 5px 0 0;">';
					    		reviewForm += '<a href ="updateLike_count2.bo" class="updateLike_count2" ID = "updateLike_count'+ ln + '">';
					    		reviewForm += '<img src = "resources/images/fullheart.png" width = "18px" height = "18px" id = "heart'+ln+'"></a></div>';
					    		//input으로 serialize 이용 값을 sql문에 대입 가능하게 전송
					    		reviewForm += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
					    		reviewForm += '<input type = "hidden" name = "LIKE_COUNT" id = "LIKE_COUNT'+ln+'" value= "'+ (lc-1) +'">';
					    		reviewForm += '<input type = "hidden" name = "LIST_NUM" id = "LIST_NUM" value= "'+ ln + '">';
					    		idcheck = 2; //아이디확인 값 2로
				    		}
				    	}	
		    		}
		    		if(sessionid != "null" && idcheck == 1){
		    			var lc = item.like_COUNT;
							var ln = item.list_NUM;
			    		reviewForm += '<div class = "float-right font-size-12 main_grayfont3" style = "margin : 5px 0 0 0;" id = "textcount'+ln+'">: ' + item.like_COUNT + '</div>';
			    		reviewForm += '<div class = "float-right" style = "margin : 0 5px 0 0;">';
			    		reviewForm += '<a href ="updateLike_count.bo" class="updateLike_count" ID = "updateLike_count'+ ln + '">';
			    		reviewForm += '<img src = "resources/images/heart.png" width = "18px" height = "18px" id = "heart'+ln+'"></a></div>';
			    		reviewForm += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
			    		reviewForm += '<input type = "hidden" name = "LIKE_COUNT" id = "LIKE_COUNT'+ln+'" value= "'+ (lc+1) +'">';
			    		reviewForm += '<input type = "hidden" name = "LIST_NUM" id = "LIST_NUM" value= "'+ ln + '">';
		    		}
		    		
		    		
		    		reviewForm += '</form>';
		    		//좋아요 기능 종료
		    		
		    		reviewForm += '<div class = "float-right font-size-12 main_grayfont3" style = "margin : 5px 10px 0 0;">NO : ' + item.list_NUM + '</div>';
		    		reviewForm += '</div>';
		    		reviewForm += '<div class = "col-12">';
		    		reviewForm += '<a href = "#">';
		    		reviewForm += '<div class = "float-left circleprofileimg02">';
		    		if(item.petsitter_PHOTO_PROFILE_FILE != "N"){
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+item.petsitter_PHOTO_PROFILE_FILE+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		}
		    		else {
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
				    reviewForm +=	'<img src = "resources/images/defaultprofile02.png">';
				    reviewForm += '</div></div></div>';	
		    		}
		    		reviewForm += '</div>';
		    		reviewForm += '</a>';
		    		reviewForm += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin : 0 0 0 10px; height : 100%">';
		    		reviewForm += '<a href = "#">';
		    		reviewForm += '<table>';
		    		reviewForm += '<tr>';
		    		reviewForm += '<td class = "font-size-16 main_grayfont3 mybold">펫시터 : ' + item.petsitter_NICKNAME + '<td>';
		    		reviewForm += '<tr>';
		    		reviewForm += '<tr>';
		    		reviewForm += '<td class = "font-size-15 main_grayfont3" style = "padding: 0 0 9px 0;">' +real_address[0]+' '+real_address[1]+ '<td>';
		    		reviewForm += '<tr>';						
		    		reviewForm += '</table>';
		    		reviewForm += '</a>';
		    		reviewForm += '</div>';
		    		reviewForm += '</div>';
		    		reviewForm += '<div class = "col-12 float-none">';
		    		reviewForm += '<center>';
		    		
		    		if(item.review_UP_PHOTO != "N" && Pphoto[1] != null){
		    		reviewForm += '<div id="carouselExampleIndicators'+k+'" class="carousel slide" data-ride="carousel"  >';
		    		reviewForm += '<ol class="carousel-indicators">';
		    		if(Pphoto[2] != null){
		    		reviewForm += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="0" class="active"></li>';
		    		reviewForm += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="1"></li>';
		    		reviewForm += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="2"></li>';
		    		reviewForm += '</ol>';
		    		reviewForm += '<div class="carousel-inner">';
		    		reviewForm += '<div class="carousel-item active">';
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto[0]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		reviewForm += '</div>';
		    		reviewForm += '<div class="carousel-item">';
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto[1]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		reviewForm += '</div>';
		    		
		    		reviewForm += '<div class="carousel-item">';
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto[2]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		reviewForm += '</div>';
		    		
		    		
		    		}
		    		if(Pphoto[2] == null){
		    		reviewForm += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="0" class="active"></li>';
		    		reviewForm += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="1"></li>';
		    		reviewForm += '</ol>';
		    		reviewForm += '<div class="carousel-inner">';
		    		reviewForm += '<div class="carousel-item active">';
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto[0]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		reviewForm += '</div>';
		    		reviewForm += '<div class="carousel-item">';
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto[1]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		reviewForm += '</div>';
		    		
		    		}
		    		
		    		reviewForm += '<a class="carousel-control-prev" href="#carouselExampleIndicators'+k+'" role="button" data-slide="prev">';
		    		reviewForm += '<svg style = "color : #949494; padding-right : 4px;"width="40px" height="32px" viewBox="0 0 16 16" class="bi bi-chevron-compact-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223z"/></svg>';
		    		reviewForm += '<span class="sr-only">Previous</span>';
		    		reviewForm += '</a>';
		    		reviewForm += '<a class="carousel-control-next" href="#carouselExampleIndicators'+k+'" role="button" data-slide="next">';
		    		reviewForm += '<svg style = "color : #949494; padding-left : 4px;"width="40px" height="32px" viewBox="0 0 16 16" class="bi bi-chevron-compact-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/></svg>';
		    		reviewForm += '<span class="sr-only">Next</span>';
		    		reviewForm += '</a>';
		    		reviewForm +=	'</div>';   	    		
		    		}
		    		
		    		if(item.review_UP_PHOTO != "N" && Pphoto[1] == null){
	    			reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto[0]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';	
		    		}
		    		
		    		if(item.review_UP_PHOTO == "N"){
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="resources/images/dogmark.png" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		}
		    		
		    		reviewForm += '</center>';
		    		reviewForm += '</div>';
										
		    		reviewForm += '<div class = "col-12">';
		    		reviewForm += '<div class = "float-left circleprofileimg" style = "margin : 2px 0 0 10%;">';
		    		
		    		if(item.member_PHOTO_FILE != "N"){
	    			reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+item.member_PHOTO_FILE+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';	
		    		}
		    		else {
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
			    	reviewForm +=	'<img src = "resources/images/defaultprofile.jpg">';
			    	reviewForm += '</div></div></div>';	
			    	}
		    		reviewForm += '</div>';
		    		
		    		
		    		reviewForm += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">';
		    		reviewForm += '<table>';
		    		reviewForm += '<tr>';
		    		reviewForm += '<td class = "font-size-17 main_grayfont3 mybold" width = "145px">'+ item.member_NICKNAME + '<td>';
		    		reviewForm += '<td style = "padding: 6px 0 0 10px; font-size: 12px;">';
		    		reviewForm += '<a href = "./reviewreportform.bo?num='+item.list_NUM+'&sessionid='+sessionid+'" type="button" class="reportFormAjax main_redfont0">신고</a><td>';	    		
		    		
		    		reviewForm += '<tr>';
		    		reviewForm += '<tr>';
		    		reviewForm += '<td colspan = "2" style = "padding: 0 0 7px 0;">';
   	    		if(item.review_SCORE == 5){
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
   	    		}
   	    		if(item.review_SCORE == 4){
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
	    			}
   	    		if(item.review_SCORE == 3){
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
   	    			reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
    				}   
   	    		if(item.review_SCORE == 2){
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
   	    		if(item.review_SCORE == 1){
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px; margin-top: 1px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
   	    		if(item.review_SCORE > 4 && item.review_SCORE < 5){
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
   	    		if(item.review_SCORE > 3 && item.review_SCORE < 4){
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
   	    		if(item.review_SCORE > 2 && item.review_SCORE < 3){
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
   	    		if(item.review_SCORE > 1 && item.review_SCORE < 2){
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
   	    		if(item.review_SCORE > 0 && item.review_SCORE < 1){
   	    			reviewForm += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
   	    			reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
   	    			reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
   	    			reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
   	    			reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
   	    		reviewForm += ' &nbsp;' + item.review_SCORE + '점</td>';
						reviewForm += '<tr>';
						reviewForm += '</table>';
						reviewForm += '</div>	';
						reviewForm += '</div>';
											
						reviewForm += '<div class = "col-11">';
						reviewForm += '<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">';
						reviewForm += '<p>' + item.review_CONTENT + '</p>';
						reviewForm += '</div>';
						reviewForm += '</div>';
											
						reviewForm += '</div>';
						reviewForm += '</div>';
						reviewForm += '</div>';
						reviewForm += '</div>';
						reviewForm += '</div> ';
						reviewForm += '<!--후기 폼 종료 -->';
   	       	$('#reviewForm').append(reviewForm);
   	       	k += 1;
    				}
     	  	});
    		},
	    	error:function(){
	        alert("ajax통신 실패!!!");
	    	}
			}); 
		}

		$(document).ready(function(){
			selectData();
	
			
		$('.plus_review').on('click', function(event){ //on이 동적인걸 실행해준다.
			$.ajax({
	      url:$(this).attr("href"),
	      type:'POST',
	      dataType : 'json',
	      contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	      success:function(data){
	      	$.each(data, function(index, item){
      			
	      		if(index >= num && index < num2) {
   	       	var reviewForm = '';
			   	  //주소 문자열 추출 2자리
						var address2 = item.petsitter_ADDRESS;
				   	var Paddress2 = address2.split(',', 2);
				   	var real_address2 = Paddress2[1].split(' ');

							
				   	//사진 개 수 별 업로드 문자열 추출
				   	if(item.review_UP_PHOTO != "N"){
				   	var upphoto2 = item.review_UP_PHOTO;
				   	var Pphoto2 = upphoto2.split(',', 3);
				   	}
    		   	
    		   	//좋아요 아이디 추출
    		   	if(item.like_ID != "N"){
        		   	var likeids = item.like_ID;
        		   	var likeid = likeids.split(',');
        		}
    		   	
   	       	var reviewForm = '';
		   	    reviewForm += '<!--후기 폼 시작 -->';
		    		reviewForm += '<div class = "col-md-4" style = "align : center; margin-top : 20px;">';
		    		reviewForm += '<div class = "row justify-content-center">';
		    		reviewForm += '<div class = "col-12">';
		    		reviewForm += '<div style = "background :rgba(224, 224, 224, 0.65); height: 600px; width : 322px; border-radius: 6px;">';
		    		reviewForm += '<div class = "row justify-content-center">';
		    		reviewForm += '<div class = "col-10">';
		    		
		    		//좋아요 기능 시작
		    		//좋아요 숫자
		    		reviewForm += '<form id = "likeForm">';
		    		
		    		if(sessionid == "null" ){
						var lc = item.like_COUNT;
						var ln = item.list_NUM;
		    		reviewForm += '<div class = "float-right font-size-12 main_grayfont3" style = "margin : 5px 0 0 0;">: ' + item.like_COUNT + '</div>';
		    		reviewForm += '<div class = "float-right" style = "margin : 0 5px 0 0;">';
		    		reviewForm += '<a href ="#" class="loginalert">';
		    		reviewForm += '<img src = "resources/images/heart.png" width = "18px" height = "18px"></a></div>';
		    		}
		    		
		    		//idcheck 는  좋아요를 누른 아이디 일시 2로 바뀜
		    		var idcheck = 1;
		    		//첫 split된 인데스 0번째는 'N' 으로 1인덱스부터 시작과 il에 1추가로 필요한 길이 맞춤
		    		if (sessionid != "null" && item.like_ID != "N"){
		    			var lc = item.like_COUNT;
		    			var ln = item.list_NUM;
			    		for(j = 1; j < lc+1; j++){
			    			if(likeid[j] == sessionid) {
					    		reviewForm += '<div class = "float-right font-size-12 main_grayfont3" style = "margin : 5px 0 0 0;" id = "textcount'+ln+'">: ' + item.like_COUNT + '</div>';
					    		reviewForm += '<div class = "float-right" style = "margin : 0 5px 0 0;">';
					    		reviewForm += '<a href ="updateLike_count2.bo" class="updateLike_count2" ID = "updateLike_count'+ ln + '">';
					    		reviewForm += '<img src = "resources/images/fullheart.png" width = "18px" height = "18px" id = "heart'+ln+'"></a></div>';
					    		reviewForm += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
					    		reviewForm += '<input type = "hidden" name = "LIKE_COUNT" id = "LIKE_COUNT'+ln+'" value= "'+ (lc-1) +'">';
					    		reviewForm += '<input type = "hidden" name = "LIST_NUM" id = "LIST_NUM" value= "'+ ln + '">';
					    		idcheck = 2;
				    		}
				    	}	
		    		}
		    		if(sessionid != "null" && idcheck == 1){
		    			var lc = item.like_COUNT;
							var ln = item.list_NUM;
			    		reviewForm += '<div class = "float-right font-size-12 main_grayfont3" style = "margin : 5px 0 0 0;" id = "textcount'+ln+'">: ' + item.like_COUNT + '</div>';
			    		reviewForm += '<div class = "float-right" style = "margin : 0 5px 0 0;">';
			    		reviewForm += '<a href ="updateLike_count.bo" class="updateLike_count" ID = "updateLike_count'+ ln + '">';
			    		reviewForm += '<img src = "resources/images/heart.png" width = "18px" height = "18px" id = "heart'+ln+'"></a></div>';
			    		reviewForm += '<input type = "hidden" name = "LIKE_ID" id = "LIKE_ID" value= "'+ sessionid2 +'">';
			    		reviewForm += '<input type = "hidden" name = "LIKE_COUNT" id = "LIKE_COUNT'+ln+'" value= "'+ (lc+1) +'">';
			    		reviewForm += '<input type = "hidden" name = "LIST_NUM" id = "LIST_NUM" value= "'+ ln + '">';
		    		}
		    		reviewForm += '</form>';
		    		//좋아요 기능 종료
		    		
		    		reviewForm += '<div class = "float-right font-size-12 main_grayfont3" style = "margin : 5px 10px 0 0;">NO : ' + item.list_NUM + '</div>';
		    		reviewForm += '</div>';
		    		reviewForm += '<div class = "col-12">';
		    		reviewForm += '<a href = "#">';
		    		reviewForm += '<div class = "float-left circleprofileimg02">';
		    		if(item.petsitter_PHOTO_PROFILE_FILE != "N"){
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+item.petsitter_PHOTO_PROFILE_FILE+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		}
		    		else {
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
				    reviewForm +=	'<img src = "resources/images/defaultprofile02.png">';
				    reviewForm += '</div></div></div>';	
		    		}
		    		reviewForm += '</div>';
		    		reviewForm += '</a>';
		    		reviewForm += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin : 0 0 0 10px; height : 100%">';
		    		reviewForm += '<a href = "#">';
		    		reviewForm += '<table>';
		    		reviewForm += '<tr>';
		    		reviewForm += '<td class = "font-size-16 main_grayfont3 mybold">펫시터 : ' + item.petsitter_NICKNAME + '<td>';
		    		reviewForm += '<tr>';
		    		reviewForm += '<tr>';
		    		reviewForm += '<td class = "font-size-15 main_grayfont3" style = "padding: 0 0 9px 0;">' +real_address2[0]+' '+real_address2[1]+ '<td>';
		    		reviewForm += '<tr>';						
		    		reviewForm += '</table>';
		    		reviewForm += '</a>';
		    		reviewForm += '</div>';
		    		reviewForm += '</div>';
		    		reviewForm += '<div class = "col-12 float-none">';
		    		reviewForm += '<center>';
		    		
		    		if(item.review_UP_PHOTO != "N" && Pphoto2[1] != null){
		    		reviewForm += '<div id="carouselExampleIndicators'+k+'" class="carousel slide" data-ride="carousel"  >';
		    		reviewForm += '<ol class="carousel-indicators">';
		    		if(Pphoto2[2] != null){
		    		reviewForm += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="0" class="active"></li>';
		    		reviewForm += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="1"></li>';
		    		reviewForm += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="2"></li>';
		    		reviewForm += '</ol>';
		    		reviewForm += '<div class="carousel-inner">';
		    		reviewForm += '<div class="carousel-item active">';
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto2[0]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		reviewForm += '</div>';
		    		reviewForm += '<div class="carousel-item">';
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto2[1]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		reviewForm += '</div>';
		    		
		    		reviewForm += '<div class="carousel-item">';
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto2[2]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		reviewForm += '</div>';
		    		
		    		
		    		}
		    		if(Pphoto2[2] == null){
		    		reviewForm += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="0" class="active"></li>';
		    		reviewForm += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="1"></li>';
		    		reviewForm += '</ol>';
		    		reviewForm += '<div class="carousel-inner">';
		    		reviewForm += '<div class="carousel-item active">';
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto2[0]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		reviewForm += '</div>';
		    		reviewForm += '<div class="carousel-item">';
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto2[1]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		reviewForm += '</div>';
		    		
		    		}
		    		
		    		reviewForm += '<a class="carousel-control-prev" href="#carouselExampleIndicators'+k+'" role="button" data-slide="prev">';
		    		reviewForm += '<svg style = "color : #949494; padding-right : 4px;"width="40px" height="32px" viewBox="0 0 16 16" class="bi bi-chevron-compact-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223z"/></svg>';
		    		reviewForm += '<span class="sr-only">Previous</span>';
		    		reviewForm += '</a>';
		    		reviewForm += '<a class="carousel-control-next" href="#carouselExampleIndicators'+k+'" role="button" data-slide="next">';
		    		reviewForm += '<svg style = "color : #949494; padding-left : 4px;"width="40px" height="32px" viewBox="0 0 16 16" class="bi bi-chevron-compact-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/></svg>';
		    		reviewForm += '<span class="sr-only">Next</span>';
		    		reviewForm += '</a>';
		    		reviewForm +=	'</div>';   	    		
		    		}
		    		
		    		if(item.review_UP_PHOTO != "N" && Pphoto2[1] == null){
	    			reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+Pphoto2[0]+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';	
		    		}
		    		
		    		if(item.review_UP_PHOTO == "N"){
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
		    		reviewForm += '<img src="resources/images/dogmark.png" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';
		    		}
		    		
		    		reviewForm += '</center>';
		    		reviewForm += '</div>';
										
		    		reviewForm += '<div class = "col-12">';
		    		reviewForm += '<div class = "float-left circleprofileimg" style = "margin : 2px 0 0 10%;">';
		    		if(item.member_PHOTO_FILE != "N"){
	    			reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
		    		reviewForm += '<img src="<spring:url value="/upload/'+item.member_PHOTO_FILE+'" />" class="d-block w-100" alt="...">';
		    		reviewForm += '</div></div></div>';	
		    		}
		    		else {
		    		reviewForm += '<div class="thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02">';
			    	reviewForm +=	'<img src = "resources/images/defaultprofile.jpg">';
			    	reviewForm += '</div></div></div>';	
			    	}
		    		reviewForm += '</div>';
		    		reviewForm += '<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">';
		    		reviewForm += '<table>';
		    		reviewForm += '<tr>';
		    		reviewForm += '<td class = "font-size-17 main_grayfont3 mybold" width = "145px">'+ item.member_NICKNAME + '<td>';
		    		
		    		
		    		
		    		reviewForm += '<td style = "padding: 6px 0 0 10px; font-size: 12px;">';
		    		reviewForm += '<a href = "./reviewreportform.bo?num='+item.list_NUM+'&sessionid='+sessionid+'" type="button" class="reportFormAjax main_redfont0">신고</a><td>';
		    		
		    		
		    		
		    		
		    		reviewForm += '<tr>';
		    		reviewForm += '<tr>';
		    		reviewForm += '<td colspan = "2" style = "padding: 0 0 7px 0;">';
		   			if(item.review_SCORE == 5){
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   			}
		   			if(item.review_SCORE == 4){
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
		   			if(item.review_SCORE == 3){
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		   				reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}   
		   			if(item.review_SCORE == 2){
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		   				reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		   				reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
		   			if(item.review_SCORE == 1){
		   				reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom: 8px;">';
		   				reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		   				reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		   				reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		   				reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
	   	    	if(item.review_SCORE > 4 && item.review_SCORE < 5){
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
		    		if(item.review_SCORE > 3 && item.review_SCORE < 4){
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
		    		if(item.review_SCORE > 2 && item.review_SCORE < 3){
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
		    		if(item.review_SCORE > 1 && item.review_SCORE < 2){
							reviewForm += '<img src="resources/images/star.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
							reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
		    		if(item.review_SCORE > 0 && item.review_SCORE < 1){
		    			reviewForm += '<img src="resources/images/starhalf.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		    			reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		    			reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		    			reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
		    			reviewForm += '<img src="resources/images/star_empty.png" width="17px" height="17px" style="margin-bottom : 8px;">';
						}
		   			reviewForm += ' &nbsp;' + item.review_SCORE + '점</td>';
						reviewForm += '<tr>';
						reviewForm += '</table>';
						reviewForm += '</div>	';
						reviewForm += '</div>';
											
						reviewForm += '<div class = "col-11">';
						reviewForm += '<div class = "font-size-14 main_grayfont3" style ="padding : 0 15px;">';
						reviewForm += '<p>' + item.review_CONTENT + '</p>';
						reviewForm += '</div>';
						reviewForm += '</div>';
											
						reviewForm += '</div>';
						reviewForm += '</div>';
						reviewForm += '</div>';
						reviewForm += '</div>';
						reviewForm += '</div> ';
						reviewForm += '<!--후기 폼 종료 -->';
     	      $('#reviewForm').append(reviewForm);
     	    	k += 1;
	      		}	
     	  	});
	      	num2 += 12; //다음 더보기시 데이터 12개 추가 생성
	      	num += 12; //다음 더보기시 데이터 12개 추가 생성
  			},
		   	error:function(){
		       alert("ajax통신 실패!!!");
		   	}
		  }); 
			//기본 이벤트 제거
		 event.preventDefault();
		});
		
		
		//좋아요 수 증가
	 	$(document).on('click', '.updateLike_count', function(event){
	 		var params;
	 		params = $(this).parents("#likeForm").serialize();
	 		//alert("params=" + params);
			var id = $(this).attr("id");
	 		
	 		jQuery.ajax({
       	url : $(this).attr("href"),
       	type : 'POST',
       	data : params,
       	contentType : 'application/x-www-form-urlencoded; charset=utf-8', 
       	dataType : 'json',
       	success: function (data) {
       		$.each(data, function(index, item){
       		var reviewForm = '';
       		//alert("추가세션아이디 : " + sessionid);
       		var lc = item.like_COUNT;
					var ln = item.list_NUM;
					//alert("추가 lc : " + lc);
					//alert("추가 ln : " + ln);
					
	    		$('#LIKE_COUNT'+ln+'').val(lc-1);
	    		$('#textcount'+ln+'').text(': '+ lc);
	    		$('#heart'+ln+'').attr("src", "resources/images/fullheart.png");
	    		$('#updateLike_count'+ln+'').attr("class", "updateLike_count2");
	    		$('#updateLike_count'+ln+'').attr("href", "updateLike_count2.bo");
       		
       		});
       	},
       	error:function(){
          	alert("ajax통신 실패!!!");
       	}
		  });
		  //기본 이벤트 제거
		  event.preventDefault();
		});
		
	 	//좋아요 수 감소
	 	$(document).on('click', '.updateLike_count2', function(event){
	 		var params;
	 		params = $(this).parents("#likeForm").serialize();
			var id = $(this).attr("id");
	 		
	 		jQuery.ajax({
	 			
       	url : $(this).attr("href"),
       	type : 'POST',
       	data : params,
       	contentType : 'application/x-www-form-urlencoded; charset=utf-8', 
       	dataType : 'json',
       	success: function (data) {
       		$.each(data, function(index, item){
       		var reviewForm = '';
       		var lc = item.like_COUNT;
					var ln = item.list_NUM;
					
	    		$('#LIKE_COUNT'+ln+'').val(lc+1);
	    		$('#textcount'+ln+'').text(': '+ lc);
	    		$('#heart'+ln+'').attr("src", "resources/images/heart.png");
	    		$('#updateLike_count'+ln+'').attr("class", "updateLike_count");
	    		$('#updateLike_count'+ln+'').attr("href", "updateLike_count.bo");

       		
       		});
       	},
       	error:function(){
          	alert("ajax통신 실패!!!");
       	}
	  	});
		  	//기본 이벤트 제거
		  	event.preventDefault();
		});
		
		
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
	        		reportForm += '<form action="./reviewreportinsert.bo" style = "font-size : 0" method="post" name="reportFormSubmit" enctype="multipart/form-data">';
	        		reportForm += '<div class = "row">';
	        		reportForm += '<div class = "col-12 font-size-14 main_grayfont3">';
	        		reportForm += '<input type="hidden" name="MEMBER_ID" value="${id}">';
	        		reportForm += '<input type="hidden" name="LIST_NUM" value="'+item.list_NUM+'">';
	        		reportForm += '<input type="hidden" name="BOARD_TYPE" value="'+item.board_TYPE+'">';
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
			var rpr = document.reportFormSubmit.REPORT_REASON.value
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
                <a href="loginform.me" ><span class = "font-size-14" >로그인 &amp; 회원가입</span></a>
                <span class="mx-md-2 d-inline-block"></span>
                <%} else if(!((String)session.getAttribute("rank")).contains("admin") && ((String)session.getAttribute("id")).contains("@")) { %> <!-- 일반 회원 마이 페이지 -->
                <a href="memberinfo.me"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
                <%} else if(((String)session.getAttribute("id")).contains("admin")) {%>
                <a href="admin.me"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
                <%} else {%> <!-- 펫시터 마이 페이지 -->
                <a href="petsitterinfo.me"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
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
        
        <!-- 스크롤 위로올라가기 버튼 html-->
				<a id="MOVE_TOP_BTN" href="#">TOP</a>
				
      </header>
      
      <!-- 본 기능 추가 시작 -->
      
      <div class = "container">
      	<div class = "row justify-content-center">
      		<div class = "col-md-4" style = "padding : 0 0 0 0;">
      			<br/><br/>
      			<img src = "resources/images/dog05.png" width = "384px" height = "241px">
      		</div>
      		<div class = "col-md-4 offset-md-1">
   					<br/><br/>
    				<center>
  					<img src = "resources/images/postscript.png" width = "230px" height = "60px">
	     			<div style = "width : 350px; height : 110px; background : rgba(83,220,152); margin-top : 15px; border-radius : 5px; padding-top : 4%">
	      			<div class = "main_whitefont font-size-19 mybold">생생한 펫시터 후기</div>
	      			<div class = "main_whitefont font-size-15">마음에드는 펫시터를 선택할 수 있어요!</div>
	      			<div class = "main_whitefont font-size-15">"좋아요!!!"는 하트를 눌러주세요!</div>
	     			</div>
	     			</center>
      		</div>    			
     	 </div>
      </div>
      
       <!-- ajax 폼 추가 -->
      <div class = "container">
	      <form id ="update_form" method="post">
	      	<div class = "row"  id = "reviewForm">
					</div>
				</form>

     	<div class = "row">
	      <div class = "col-12 text-center" style ="margin : 15px 0;">
	         <a href="getReviewBoardJSON.bo" class="plus_review">
	            <button type="button" style="background:#53dc98; color :white; width : 200px;" class="btn btn-sm">더 보기</button>
	         </a>
	      </div>
			</div>
   	</div>
      
      
    <!-- Modal 글신고기능 시작-->
		<!-- Modal 창 실행 a테그 -->
		<a href = "#" class = "staticBackdropReport" data-toggle="modal" data-target="#staticBackdropReport"></a>	
		<div id = "reportForm"></div>
		<!-- Modal 글신고기능 종료-->      
      
      
      
      <!-- 본 기능 추가 종료 -->
      
      

      
      <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-7">
                <h2 class="footer-heading mb-4" id="main_grayfont1">About Us</h2>
                <p id="main_grayfont2" style = "font-size : 14px;">반려동물들을 위해 고객과 펫시터와를 연결시켜주는 매칭 플렛폼입니다.. 신뢰와 안전을 위해 최선을 다하겠습니다.</p>
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
		
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		
		<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.sticky.js"/>"></script>
    <script src="<c:url value="./resources/js/aos.js"/>"></script><!-- nav 상단바 반응형웹 적용1 -->
    <script src="<c:url value="/resources/js/main.js"/>"></script><!-- nav 상단바 반응형웹 적용2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script><!-- sweetalert2 -->
 


 		<script>
		/*사진 가로 세로 이미지 크기 맞추고 가운데 위치로 보이게 하기  시작*/ 
		 $(document).ready(function(){
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
		 });		
		
		
		
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

		//더보기 버튼 누를시 현재 스크롤 을 구해서 그 위치를 유지 시작
		   $(".plus_review").click(function() {
			   //현재 스크롤 값 구하기
			   var scrollValue = $(document).scrollTop();
			   //지정값으로 가기
			   $('html, body').animate({
			         scrollTop : scrollValue
			     }, );
			     return false;
		  });
		//종료		
		
		
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