<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	PetsitterVO vo = (PetsitterVO)request.getAttribute("vo");
	ArrayList<PetsitterUsinglistVO> list = (ArrayList<PetsitterUsinglistVO>)request.getAttribute("list");
	String[] certFile = vo.getPETSITTER_PHOTO_CERT_FILE().split(",");
	String[] certName = vo.getPETSITTER_CERT_LIST().split(",");
	String[] homeFile = vo.getPETSITTER_PHOTO_HOME_FILE().split(",");
	String[] appealFile = vo.getPETSITTER_PHOTO_APPEAL().split(",");
	String[] service = vo.getPETSITTER_SERVICE_LIST().split(",");
 	String[] email = vo.getPETSITTER_EMAIL().split("@");
 	String[] address = vo.getPETSITTER_ADDRESS().split(",");
 	String[] type = vo.getPETSITTER_TYPE().split(",");
 	
    if(session.getAttribute("id") == "") {
        out.println("<script>");
        out.println("location.href = 'home.me'");
        out.println("alert('로그인 시간이 만료되어 자동 로그아웃 됩니다.')");
        out.println("</script>");
     }
 	
 	int appeal;
 	if(appealFile[0].equals("N")){
 		appeal = 0;
 	}else{
 		appeal = appealFile.length;
 	}
 	
 	int cert;
 	if(certFile[0].equals("N")){
 		cert = 0;
 	}else{
 		cert = certFile.length;
 	}
 	
 	int home;
 	if(homeFile[0].equals("N")){
 		home = 0;
 	}else{
 		home = homeFile.length;
 	}
 	
 	String pet1 = "";
 	String pet2 = "";
 	
 	if(Arrays.asList(type).contains("방문")){
 		pet1 = "checked";
 	}
 	
 	if(Arrays.asList(type).contains("위탁")){
 		pet2 = "checked";
 	}
 	
 	String pickup = "";
 	String bigsize = "";
 	String yard = "";
 	String olddog = "";
 	if(Arrays.asList(service).contains("pickup")){
 		pickup = "checked";
 	}
 	if(Arrays.asList(service).contains("bigsize")){
 		bigsize = "checked";
 	}
 	if(Arrays.asList(service).contains("yard")){
 		yard = "checked";
 	}
 	if(Arrays.asList(service).contains("olddog")){
 		olddog = "checked";
 	}
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
	
		.thumbnail-wrappper { 
	width: 25%; 
	} 
	.thumbnail { 
	position: relative; 
	padding-top: 0; /* 1:1 ratio 이부분으로 크기지정 가능(cjh) */ 
	overflow: hidden; 
	width: 100px;
    height: 100px; 
    border-radius: 70%;
    overflow: hidden;
    margin : 6px 0 6px 25%;
	
	}
	.thumbnail02 {
	position: relative; 
	padding-top: 0; /* 1:1 ratio 이부분으로 크기지정 가능(cjh) */ 
	overflow: hidden; 
	width: 100px;
    height: 100px; 
    border-radius: 12%;
    overflow: hidden;
    margin : 6px 0 6px 10%;
	
	} 
	
	.thumbnail .centered { 
	position: absolute; 
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0; 
	-webkit-transform: translate(50%,50%); 
	-ms-transform: translate(50%,50%); 
	transform: translate(50%,50%); } 
	
	.thumbnail02 .centered02 { 
	position: absolute; 
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0; 
	-webkit-transform: translate(50%,50%); 
	-ms-transform: translate(50%,50%); 
	transform: translate(50%,50%); } 
	
	.thumbnail .centered img { 
	position: absolute; 
	top: 0; 
	left: 0; 
	max-width: 110px;
	max-height : 110px; 
	widht : auto;
	height: auto; 
	-webkit-transform: translate(-50%,-50%); 
	-ms-transform: translate(-50%,-50%);
	 transform: translate(-50%,-50%); }
	 
	.thumbnail02 .centered02 img { 
	position: absolute; 
	top: 0; 
	left: 0; 
	max-width: 110px;
	max-height : 110px; 
	widht : auto;
	height: auto; 
	-webkit-transform: translate(-50%,-50%); 
	-ms-transform: translate(-50%,-50%);
	 transform: translate(-50%,-50%); }
	  
/* 언택 css */ /* 언택 css */ /* 언택 css */
/* 언택 css */ /* 언택 css */ /* 언택 css */
/* 언택 css */ /* 언택 css */ /* 언택 css */

/*상단 왼쪽 box1 */
	.box1{
	background:rgba(83,220,152);
 	width: 100%;
  height: 100%; 
	}
	
	.mypage{
	color:#ffffff;
	font-weight : bold;
	margin : 8.2% 0 10px 0;
	}


	  
	.profile {
    width: 183px;
    height: 183px; 
    border-radius: 70%;
    overflow: hidden;
    margin-bottom : 10%;
	}  

	.profile_sm1{
	width: 100px;
    height: 100px; 
    border-radius: 70%;
    overflow: hidden;
    margin : 6px 0 6px 25%;
	}
	
	.roundimg{
	margin:0 0 0 30px;
	}
	
	.mpname {
	font-size : 47px;
	margin : 0;
	}
	
	.mpneem {
	font-size : 15px;
	margin-top : 31px;
	}

	.mpnick {
	font-size : 16px;
	}
	
	
	.mpbody {color:#ffffff;}  
	.mpgrade {
	font-size : 16px;
	}  
	.mpdate {margin:0 60px 0 0 ;}


/*상단 오른쪽 box2 */

	.mptext {
	margin:75px 0 0 0;
	}
	
	
	
	.mptext2_1, .mptext1_1 {
	font-size : 15px;
	margin:0 60px 0 30px;
	} 
	
	.line { 
	color:red; size:120%;
	margin:0 0 20px 0;
	}  
	  
	  
/* 중앙 list*/
	.middle_img {
	align:center;
	}	  
	
	.middle_head {
	margin: 60px 0 0 0 ;
	}  
	  
	.date_row {
	margin:30px 0 0 0 ;
	}  
	
	.middle_bt {
	margin:10px 0 0 0;
	}
	
	#middle_bt4 {
	margin:0 5px 0 0;
	}
	
	.middle_bt1, .middle_bt2 {
	border:0;
	color : #707070;
	background-color:rgb(224, 224, 224);
	}
	
	.date_row {margin:20px 0 10px 10px;}
	
/*table */	
	
	.table_headRow {
	border-top: solid 1px;
	border-bottom: solid 1px;
	}

	td {
	text-align:center;
	}
	
	tbody {
	border-bottom: solid 1px;
	}
	
	
	.list {
	margin:0 0  200px 0 ;}
	
	.review_write {
	font-size : 15px;
	border:0;
	color : white;
	background-color:rgb(83,220,152);
	}
	.review_write:hover {
	font-weight : bold;
	}
	
	
	.review_complete {
	font-size : 15px;
	border:0;
	color : #707070;
	background-color:rgb(224, 224, 224);
	border-radius : 3px;
	width : 90px;
	margin : 0 0 0 10px;
	}
	
	.pet_talk {
	font-size : 15px;
	border:0;
	color:#ffffff; 
	background-color:rgba(83,220,152);
	}
	
	.pet_talk:hover {
	font-weight : bold;
	}
	
	.grade {
	font-size : 13px;
	color:rgba(211,84,0);
	}
	
	
/* pagination */
	.page {
	text-align: cneter;
	width: 50%;
	height: 50%;
	}
	
	.pagination {
	list-style:none;
	display:inline-block;
	padding:0;
	margin-top:20px;
	}	
	
	.pagination li {
	display:inline;
	text-align:center;
	}
	
/* pagination(number) */
	.pagination a {
	float : left;
	display:block;
	font-size:14px;
	text-decoration:none;
	padding: 5px 12px;
	color: red;
	line-height: 1.5;
	}
	
	.first{ 
	margin-right:15px;
	}
	
	.last{
	margin-left:15px;
	}

	.first:hover, .last:hover, .left:hover, .right:hover{
	color:#2e9cdf;
	}

	.pagination a.active {
	outline:none;
	}
	
	.modalprofileimg {
	width : 100px;
	height : 100px;
	border-radius : 7px;
	}
	
	.tleft {
	text-align : left;
	}
	
	.modal .num {
	margin-left:3px;
	padding:0;
	width:30px;
	height:30px;
	line-height:30px;
	-moz-border-radius:100%;
	-webkit-border-radius:100%;
	border-radius:100%;
	}	

	.modal .num:hover {
	background-color:#2e9cdf;
	color:#ffffff;
	}

	.modal .num.active, .modal .num:active {
	background-color:#2e9cdf;
	cursor:pointer;
	}

	arrow-left {
	width:0;
	height:0;
	border-top:10px solid transparent;
	border-bottom:10px solid transparent;
	border-right:10px solid blue;
	}
	
	choiceS{ 
	text-align : center; 
	font-size : 15px;
	border : 0px solid #ffffff;
}
	
	/*모달 버튼 시작*/
	.modalbt01 {
	background : rgb(224, 224, 224)!important;
	}
	
	.modalbt02 {
	background : rgb(83,220,152)!important;
	color : #ffffff!important;
	}

	.modalbt03 {
	background : rgb(83,220,152)!important;
	color : #ffffff!important;
	width : 60px;
	height : 25px;
	border-radius : 6px;
	text-align : center;
	margin-top : 3px;
	margin-left : 5px;
	padding : 1px 0 0 0;
	border : 0;
	outline : 0;
	}
	
	
	.modalbt04 {
	background : rgb(83,220,152)!important;
	color : #ffffff!important;
	width : 100px;
	text-align : center;
	font-size : 14px;
	margin-left : 5px;
	height : 25px;
	padding : 0;
	border : 0;
	outline : 0;
	border-radius: 3px;
	}
	
	.modalbt05 {
	background : rgb(83,220,152)!important;
	color : #ffffff!important;
	width : 100px;
	height : 25px;
	border-radius : 6px;
	text-align : center;
	margin-top : 3px;
	margin-left : 5px;
	padding : 1px 0 0 0;
	border : 0;
	outline : 0;
	}
	/*모달 버튼 종료*/
	
	.tset1 {
	padding : 0 0 10px 15px; 
	font-size : 12px;
	}
	
	.tset2 {
	margin : 0 0 0 30px; 
	padding : 0 0 0 15px;
	font-size : 13px;" 
	
	
	}
	
	.tset3 {
	width : 400px; 
	height : 80px; 
	font-size : 13px; 
	margin : 0 0 0 20px;
	
	}

	.tset4 {
	width : 430px; 
	height : 80px; 
	font-size : 12px; 
	margin : 0;
	padding : 0;
	
	}
	
	.radioC {
	margin : 7px 2px 0 0;
	}
	
	.radioC2 {
	margin : 7px 2px 0 10px;
	}
	
	/*테이블 css 시작*/
	th, td {
	color : #5e5e5e!important;
	font-size : 15px;
	}
			
	/*nth-child(1) 칼럼 순서 불러서 css 입혀준다.*/
	th:nth-child(1), th:nth-child(2), th:nth-child(3), th:nth-child(4), th:nth-child(5) {
	}
		
	td:nth-child(1), td:nth-child(2), td:nth-child(4), td:nth-child(5) {
	}
	
	.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
	background-color: #F8F8F8;
	}
	/*테이블 css 종료*/
	
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
	padding: .5em .75em; 
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
	padding: .5em .75em; 
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
  
  .img_wrap{
  	  overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
      width: 100px;
      height: 100px;
  }
  
  .img_wrap img{
  	max-width:100%;
  }
  
	/*파일 선택 css 종료*/

	
	
	/*메인 버튼 css 시작*/
	.mybtn {
	background : rgba(83,220,152)!important;
	border : 0;
	outline : 0;
	border-radius: 3px;
	}
	.mybtn:hover { 
	font-weight : bold;
	}
	
	.mybtn:focus { 
	border : 0;
	outline : none;
	}
	/*메인 버튼  css종료*/
	
	/*a테그 호버 css */
	a:hover {
	font-weight : bold;
	}
	  
	.image-container{
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100px;
            height: 100px;
     }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
//목록


function selectData(page){
	var num;
	$('#output').empty(); //table내부 내용을 제거(초기화)
	$('#output1').empty();
	$.ajax({
        url:'/petsitter/getList.bo',
        type:'POST',
        dataType : "json", // 서버에서 보내줄 데이터 타입
        data:{"PAGE":page},
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		if(item.member_PHOTO_FILE=="N"){
        			item.member_PHOTO_FILE = "resources/images/defaultprofile.jpg";
        		}else{
        			item.member_PHOTO_FILE = "/filepath/"+item.member_PHOTO_FILE;
        		}
        		num = item.maxpage;
        		var type = '';
       	       	var output = '';
       	       	output += '<tr style = "color : #5e5e5e; border-top: 1px dashed gray;">';
       	       	output += '<td>'+item.list_TYPE+'</td>';
       	       	output += '<td rowspan="3"><div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered"><img src='+item.member_PHOTO_FILE+'></div></div></div></td>';
       	        output += '<td>'+item.member_NAME+'</td>';
          	  output += '<td>'+item.list_STRING_START_DATE+'</td>';
       	       	output += '<td rowspan="3">'+item.list_NUM+'</td>';
       	       	output += '<td rowspan="3">'+item.list_PRICE+'원</td>';
       	       	output += '<td rowspan="3">'+item.list_COMMUNICATION+'</a></td></tr>';
       	       	output += '<td><b>'+item.list_STATE+'</b></td>';
	       	    output += '<td><b>'+item.member_NICKNAME+'</b></td><td>~</td></tr>';
  	     	    output += '<tr style = "color : #5e5e5e;">';
  		     	output += '<td class="grade" style = "margin-bottom : 5px;">신고</td>';
   	        	output += '<td>'+item.member_TEL+'</td>';
   	        	output += '<td>'+item.list_STRING_END_DATE+'</td></tr>';
       	       	$('#output').append(output);
       	  	});
        	for(var i =1; i <= num ; i++){
        		$('#output1').append('<a id='+i+' href="javascript:;" onclick="button_all(this.id);">'+i+'</a>&nbsp&nbsp');	
        	}
    	},
    	error:function(){
        alert("list ajax통신 실패!!!");
    	}
	}); 
};

function button_7d(page){
	var num;
	$('#output').empty(); //table내부 내용을 제거(초기화)
	$('#output1').empty();
	$.ajax({
        url:'/petsitter/getList_7d.bo',
        type:'POST',
        dataType : "json", // 서버에서 보내줄 데이터 타입
        data:{"PAGE":page},
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		if(item.member_PHOTO_FILE=="N"){
        			item.member_PHOTO_FILE = "resources/images/defaultprofile.jpg";
        		}else{
        			item.member_PHOTO_FILE = "/filepath/"+item.member_PHOTO_FILE;
        		}
        		num = item.maxpage;
        		var type = '';
       	       	var output = '';
       	       	output += '<tr style = "color : #5e5e5e; border-top: 1px dashed gray;">';
       	       	output += '<td>'+item.list_TYPE+'</td>';
       	       	output += '<td rowspan="3"><div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered"><img src='+item.member_PHOTO_FILE+'></div></div></div></td>';
       	        output += '<td>'+item.member_NAME+'</td>';
          	  output += '<td>'+item.list_STRING_START_DATE+'</td>';
       	       	output += '<td rowspan="3">'+item.list_NUM+'</td>';
       	       	output += '<td rowspan="3">'+item.list_PRICE+'원</td>';
       	       	output += '<td rowspan="3">'+item.list_COMMUNICATION+'</a></td></tr>';
       	       	output += '<td><b>'+item.list_STATE+'</b></td>';
	       	    output += '<td><b>'+item.member_NICKNAME+'</b></td><td>~</td></tr>';
  	     	    output += '<tr style = "color : #5e5e5e;">';
  		     	output += '<td class="grade" style = "margin-bottom : 5px;">신고</td>';
   	        	output += '<td>'+item.member_TEL+'</td>';
   	        	output += '<td>'+item.list_STRING_END_DATE+'</td></tr>';
       	       	$('#output').append(output);
       	  	});
        	for(var i =1; i <= num ; i++){
        		$('#output1').append('<a id='+i+' href="javascript:;" onclick="button_7d(this.id);">'+i+'</a>&nbsp&nbsp');	
        	}
    	},
    	error:function(){
        alert("list ajax통신 실패!!!");
    	}
	}); 
};

function button_1m(page){
	var num;
	$('#output').empty(); //table내부 내용을 제거(초기화)
	$('#output1').empty();
	$.ajax({
        url:'/petsitter/getList_1m.bo',
        type:'POST',
        dataType : "json", // 서버에서 보내줄 데이터 타입
        data:{"PAGE":page},
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		if(item.member_PHOTO_FILE=="N"){
        			item.member_PHOTO_FILE = "resources/images/defaultprofile.jpg";
        		}else{
        			item.member_PHOTO_FILE = "/filepath/"+item.member_PHOTO_FILE;
        		}
        		num = item.maxpage;
        		var type = '';
       	       	var output = '';
       	       	output += '<tr style = "color : #5e5e5e; border-top: 1px dashed gray;">';
       	       	output += '<td>'+item.list_TYPE+'</td>';
       	       	output += '<td rowspan="3"><div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered"><img src='+item.member_PHOTO_FILE+'></div></div></div></td>';
       	        output += '<td>'+item.member_NAME+'</td>';
          	  output += '<td>'+item.list_STRING_START_DATE+'</td>';
       	       	output += '<td rowspan="3">'+item.list_NUM+'</td>';
       	       	output += '<td rowspan="3">'+item.list_PRICE+'원</td>';
       	       	output += '<td rowspan="3">'+item.list_COMMUNICATION+'</a></td></tr>';
       	       	output += '<td><b>'+item.list_STATE+'</b></td>';
	       	    output += '<td><b>'+item.member_NICKNAME+'</b></td><td>~</td></tr>';
  	     	    output += '<tr style = "color : #5e5e5e;">';
  		     	output += '<td class="grade" style = "margin-bottom : 5px;">신고</td>';
   	        	output += '<td>'+item.member_TEL+'</td>';
   	        	output += '<td>'+item.list_STRING_END_DATE+'</td></tr>';
       	       	$('#output').append(output);
       	  	});
        	for(var i =1; i <= num ; i++){
        		$('#output1').append('<a id='+i+' href="javascript:;" onclick="button_1m(this.id);">'+i+'</a>&nbsp&nbsp');	
        	}
    	},
    	error:function(){
        alert("list ajax통신 실패!!!");
    	}
	}); 
};

function button_3m(page){
	var num;
	$('#output').empty(); //table내부 내용을 제거(초기화)
	$('#output1').empty();
	$.ajax({
        url:'/petsitter/getList_3m.bo',
        type:'POST',
        dataType : "json", // 서버에서 보내줄 데이터 타입
        data:{"PAGE":page},
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		if(item.member_PHOTO_FILE=="N"){
        			item.member_PHOTO_FILE = "resources/images/defaultprofile.jpg";
        		}else{
        			item.member_PHOTO_FILE = "/filepath/"+item.member_PHOTO_FILE;
        		}
        		num = item.maxpage;
        		var type = '';
       	       	var output = '';
       	       	output += '<tr style = "color : #5e5e5e; border-top: 1px dashed gray;">';
       	       	output += '<td>'+item.list_TYPE+'</td>';
       	       	output += '<td rowspan="3"><div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered"><img src='+item.member_PHOTO_FILE+'></div></div></div></td>';
       	        output += '<td>'+item.member_NAME+'</td>';
          	  output += '<td>'+item.list_STRING_START_DATE+'</td>';
       	       	output += '<td rowspan="3">'+item.list_NUM+'</td>';
       	       	output += '<td rowspan="3">'+item.list_PRICE+'원</td>';
       	       	output += '<td rowspan="3">'+item.list_COMMUNICATION+'</a></td></tr>';
       	       	output += '<td><b>'+item.list_STATE+'</b></td>';
	       	    output += '<td><b>'+item.member_NICKNAME+'</b></td><td>~</td></tr>';
  	     	    output += '<tr style = "color : #5e5e5e;">';
  		     	output += '<td class="grade" style = "margin-bottom : 5px;">신고</td>';
   	        	output += '<td>'+item.member_TEL+'</td>';
   	        	output += '<td>'+item.list_STRING_END_DATE+'</td></tr>';
       	       	$('#output').append(output);
       	  	});
        	for(var i =1; i <= num ; i++){
        		$('#output1').append('<a id='+i+' href="javascript:;" onclick="button_3m(this.id);">'+i+'</a>&nbsp&nbsp');	
        	}
    	},
    	error:function(){
        alert("list ajax통신 실패!!!");
    	}
	}); 
};

function button_all(page){
	var num;
	$('#output').empty(); //table내부 내용을 제거(초기화)
	$('#output1').empty();
	$.ajax({
        url:'/petsitter/getList.bo',
        type:'POST',
        data:{"PAGE":page},
        dataType : "json", // 서버에서 보내줄 데이터 타입
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		if(item.member_PHOTO_FILE=="N"){
        			item.member_PHOTO_FILE = "resources/images/defaultprofile.jpg";
        		}else{
        			item.member_PHOTO_FILE = "/filepath/"+item.member_PHOTO_FILE;
        		}
        		num = item.maxpage;
        		var type = '';
       	       	var output = '';
       	       	output += '<tr style = "color : #5e5e5e; border-top: 1px dashed gray;">';
       	       	output += '<td>'+item.list_TYPE+'</td>';
       	       	output += '<td rowspan="3"><div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered"><img src='+item.member_PHOTO_FILE+'></div></div></div></td>';
       	        output += '<td>'+item.member_NAME+'</td>';
          	  output += '<td>'+item.list_STRING_START_DATE+'</td>';
       	       	output += '<td rowspan="3">'+item.list_NUM+'</td>';
       	       	output += '<td rowspan="3">'+item.list_PRICE+'원</td>';
       	       	output += '<td rowspan="3">'+item.list_COMMUNICATION+'</a></td></tr>';
       	       	output += '<td><b>'+item.list_STATE+'</b></td>';
	       	    output += '<td><b>'+item.member_NICKNAME+'</b></td><td>~</td></tr>';
  	     	    output += '<tr style = "color : #5e5e5e;">';
  		     	output += '<td class="grade" style = "margin-bottom : 5px;">신고</td>';
   	        	output += '<td>'+item.member_TEL+'</td>';
   	        	output += '<td>'+item.list_STRING_END_DATE+'</td></tr>';
       	       	$('#output').append(output);
        	});
        	for(var i =1; i <= num ; i++){
        		$('#output1').append('<a id='+i+' href="javascript:;" onclick="button_all(this.id);">'+i+'</a>&nbsp&nbsp');	
        	}
}
	});
};


function button_select(page){
	if(page == null){
		page = 1;
	}
	var num;
	$('#output').empty(); //table내부 내용을 제거(초기화)
	$('#output1').empty();
	var params = $("#search_form").serialize()+"&PAGE"+"="+page;
	$.ajax({
		url : '/petsitter/search_data.bo',
		type : 'POST',
       	data : params, // 서버로 보낼 데이터
       	contentType : 'application/x-www-form-urlencoded; charset=utf-8', 
       	dataType : 'json', // 서버에서 보내줄 데이터 타입
       	success:function(data){
        	$.each(data, function(index, item){
        		if(item.member_PHOTO_FILE=="N"){
        			item.member_PHOTO_FILE = "resources/images/defaultprofile.jpg";
        		}else{
        			item.member_PHOTO_FILE = "/filepath/"+item.member_PHOTO_FILE;
        		}
        		num = item.maxpage;
        		var type = '';
       	       	var output = '';
       	       	output += '<tr style = "color : #5e5e5e; border-top: 1px dashed gray;">';
       	       	output += '<td>'+item.list_TYPE+'</td>';
       	       	output += '<td rowspan="3"><div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered"><img src='+item.member_PHOTO_FILE+'></div></div></div></td>';
       	        output += '<td>'+item.member_NAME+'</td>';
          	  output += '<td>'+item.list_STRING_START_DATE+'</td>';
       	       	output += '<td rowspan="3">'+item.list_NUM+'</td>';
       	       	output += '<td rowspan="3">'+item.list_PRICE+'원</td>';
       	       	output += '<td rowspan="3">'+item.list_COMMUNICATION+'</a></td></tr>';
       	       	output += '<td><b>'+item.list_STATE+'</b></td>';
	       	    output += '<td><b>'+item.member_NICKNAME+'</b></td><td>~</td></tr>';
  	     	    output += '<tr style = "color : #5e5e5e;">';
  		     	output += '<td class="grade" style = "margin-bottom : 5px;">신고</td>';
   	        	output += '<td>'+item.member_TEL+'</td>';
   	        	output += '<td>'+item.list_STRING_END_DATE+'</td></tr>';
       	       	$('#output').append(output);
       	  	});
        	for(var i =1; i <= num ; i++){
        		$('#output1').append('<a id='+i+' href="javascript:;" onclick="button_select(this.id);">'+i+'</a>&nbsp&nbsp');	
        	}
    	},
    	error:function(request,status,error){
	        alert("list ajax통신 실패!!!");
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	}
    	
  	});
};

function button_modal(number){
	$('#output2').empty(); //table내부 내용을 제거(초기화)
	$('#output3').empty();
	$('#imgoutput').empty();
	$.ajax({
        url:'/petsitter/review_refly.bo',
        type:'POST',
        data:{"NUMBER":number},
        dataType : "json", // 서버에서 보내줄 데이터 타입
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success:function(data){
        	$.each(data, function(index, item){
        		if(item.member_PHOTO_FILE=="N"){
        			item.member_PHOTO_FILE = "resources/images/defaultprofile.jpg";
        		}else{
        			item.member_PHOTO_FILE = "/filepath/"+item.member_PHOTO_FILE;
        		}
        		var type = '';
       	       	var output2 = '';
       	       	var output3 = '';
       	       	var imgoutput = '';
       	       	imgoutput += '<div class="thumbnail-wrapper"> <div class="thumbnail02"> <div class="centered02"><img src ="'+item.member_PHOTO_FILE+'"></div></div></div>'
       	       	output2 += '<tr><td colspan = "2" class = "font-size-15 main_grayfont3 mybold tleft">'+item.member_NICKNAME+'<td>';
       	       	output2 += '<tr><tr><td class = "float-left" style = "padding: 0 0 7px 0;">'
       	       	if(item.review_SCORE == 5) {
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
	       	       	output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
	       	       	output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
	       	     		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
	       	        output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       	} else if(item.review_SCORE > 4 && item.review_SCORE < 5) {
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/starhalf.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       	} else if(item.review_SCORE == 4) {
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       	} else if(item.review_SCORE > 3 && item.review_SCORE < 4) {
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/starhalf.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       	} else if(item.review_SCORE == 3) {
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       	} else if(item.review_SCORE > 2 && item.review_SCORE < 3) {
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/starhalf.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       	} else if(item.review_SCORE == 2) {
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       	} else if(item.review_SCORE > 1 && item.review_SCORE < 2) {
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/starhalf.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       	} else if(item.review_SCORE == 1) {
       	       		output2 += '<img src = "resources/images/star.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       	} else {
       	       		output2 += '<img src = "resources/images/starhalf.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       		output2 += '<img src = "resources/images/star_empty.png" width = "17px" height = "17px" style = "margin-botton : 8px;">';
       	       	}
       	       	
       	       	output2 += '</td><td class = "tset1">점수 : '+item.review_SCORE+'점</td><tr>';
       	       	
       	       	
       	       	output3 += '<tr><th class = "font-size-14">후기 : </th>';
       	       	output3 += '<td class = "tset2" width = "400px">'+item.review_CONTENT+'</td></tr>';
       	       	output3 += '<tr><th class = "font-size-14">답변 : </th>';
       	       	output3 += '<td><textarea name = "REVIEW_REFLY" class = "tset3"></textarea></td></tr>';
       	 	    output3 += '<input type = "hidden" value = '+number+' name = "USINGLIST_NUM">';
       	       	$('#imgoutput').append(imgoutput);
       	       	$('#output2').append(output2);
       	       	$('#output3').append(output3);
        	});
}
	});
};

var sel_file;

$(document).ready(function(){ 
	selectData();
	$("#ex_filename01").on("change", handleImgFileSelect1);
	$("#ex_filename02").on("change", handleImgFileSelect2);
	$("#ex_filename03").on("change", handleImgFileSelect3);
	$("#ex_filename04").on("change", handleImgFileSelect4);
	$("#ex_filename05").on("change", handleImgFileSelect5);
	$("#ex_filename06").on("change", handleImgFileSelect6);
	$("#ex_filename07").on("change", handleImgFileSelect7);
	$("#ex_filename08").on("change", handleImgFileSelect8);
	$("#ex_filename09").on("change", handleImgFileSelect9);
	$("#ex_filename010").on("change", handleImgFileSelect10);
	$("#ex_filename011").on("change", handleImgFileSelect11);
});

function handleImgFileSelect1(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img1").attr("src",e.target.result);
			$("#img1").show();
		}
		reader.readAsDataURL(f);
	});
}

function handleImgFileSelect2(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img2").attr("src",e.target.result);
			$("#img2").show();
		}
		reader.readAsDataURL(f);
	});
}

function handleImgFileSelect3(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img3").attr("src",e.target.result);
			$("#img3").show();
		}
		reader.readAsDataURL(f);
	});
}

function handleImgFileSelect4(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img4").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

function handleImgFileSelect5(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img5").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}
function handleImgFileSelect6(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img6").attr("src",e.target.result);
			$("#img6").show();
		}
		reader.readAsDataURL(f);
	});
}
function handleImgFileSelect7(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img7").attr("src",e.target.result);
			$("#img7").show();
		}
		reader.readAsDataURL(f);
	});
}
function handleImgFileSelect8(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img8").attr("src",e.target.result);
			$("#img8").show();
		}
		reader.readAsDataURL(f);
	});
}
function handleImgFileSelect9(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img9").attr("src",e.target.result);
			$("#img9").show();
		}
		reader.readAsDataURL(f);
	});
}
function handleImgFileSelect10(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img10").attr("src",e.target.result);
			$("#img10").show();
		}
		reader.readAsDataURL(f);
	});
}

function handleImgFileSelect11(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".img11").attr("src",e.target.result);
			$("#img11").show();
		}
		reader.readAsDataURL(f);
	});
}



</script>
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
    
    <!-- 데이트피커 ver.2(bootstrap) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<!-- 데이트피커ver.2(bootstrap_design) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
    
<!-- 타임피커 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link href="${pageContext.servletContext.contextPath}/resources/css/jquery-ui.css?version=1.3" rel="stylesheet" type="text/css" media="screen">
    
    <title>petsitterinfo</title>
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
                <a href="petsitterinfo.me?id=${id}"><span class="font-size-14" >${name }님</span></a>&nbsp;&nbsp;&nbsp;
                <a href="logout.me"><span class="font-size-14">로그아웃</span></a>
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
                  <li><a href="reservation2.br" class="nav-link" id="main_whitefont2" style = "font-size:15px">방문 돌봄</a></li>
                  <li><a href="reservation1.br" class="nav-link" id="main_whitefont2" style = "font-size:15px">위탁 돌봄</a></li>
                  <li><a href="home.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">반려동물 전문가 상담</a></li>
                  <li><a href="postscript_board.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">후기 게시판</a></li>
                  <li><a href="home.me" class="nav-link" id="main_whitefont2" style = "font-size:15px">공지사항</a></li>
                </ul>
              </nav>

            </div>

            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>
        </div>
      </header>
      
      
      
      
<!-- 본 기능 추가 시작 -->

<!-- 상세정보 시작!! -->
<section class="myinfo">
  <div class="container" style = "margin-top :60px;">
    <div class = "row">
	  <div class="col-md-7" style = "padding : 0;">
	    <div class="box1">
		    <div class="row">
		      <div class="col-5" style = "margin : 3.5% 0 0 0;">  
			    <div class="roundimg">
				  <div class="profile aspect_1_1" style="background: #BDBDBD;">
				  <%if(vo.getPETSITTER_PHOTO_PROFILE_FILE().equals("N")){ %>
				  	<img src="resources/images/defaultprofile02.png">
				  	<%}else{ %>
					<img src="/filepath/<%=vo.getPETSITTER_PHOTO_PROFILE_FILE() %>">
					<%} %>
				  </div>
				</div>
			  </div> 
			  <div class="col-7" style = "padding : 0;">
			  	 <h3 class="mypage font-size-24">PETSITTER MY PAGE</h3>
			    <div class="mpbody">
				  <div class="row" style = "margin-to">
				  <div class = "col-04" style = "padding : 0 15px;">
				    <h2 class="mpname float-left"><%=name %></h2>
						<h5 class="mpneem float-none">님</h5>
				    <h3 class="mpnick">닉네임 : <%=vo.getPETSITTER_NICKNAME() %></h3>
				    <h5 class="mpgrade">등급 : <%=vo.getPETSITTER_RANK() %></h5>
				    <h5 class="mpdate font-size-16">가입일 : <%=vo.getPETSITTER_DATE().substring(0,10) %></h5>
				  </div>
				  <div class = "col-md-5" style = "margin-top : 50px;">
				  	<button type="button" style = "padding : 0;" class="font-size-16 main_whitefont mybtn" data-toggle="modal" data-target="#staticBackdrop03">스케쥴 관리
						</button>
				  	<button type="button" style = "padding : 0;" class="font-size-16 main_whitefont mybtn" data-toggle="modal" data-target="#staticBackdrop">회원정보 변경
						</button>
				  </div>
				  </div>
				</div>							
			  </div> 
			</div>
		  </div>
		</div>
			
			
		<div class="col-md-5" style = "color : #5e5e5e;">
			<div class="mptext">
			  <div class="row">
			  <div class = "col-6">
				<h5 class="font-size-15">돌본 횟수 : <%=vo.getPETSITTER_COUNT() %></h5>
				</div>
				<div class = "col-6">
				<h5 class="font-size-15">이번달 돌본 횟수 : </h5>
				</div>
				<div class = "col-12">
				<hr class ="line" color="#949494" width="100%">
				</div>
				<div class = "col-6">
				<h5 class="font-size-15">총 매출금액 : <%=vo.getPETSITTER_AMOUNT() %></h5>
				</div>
				<div class = "col-6">
				<h5 class="font-size-15">이번달 매출 금액: </h5>
				</div>
				<div class = "col-12">
				<hr class ="line" color="#949494" width="100%">
				</div>
			</div>		
		  </div>
	    </div>	
	  </div>
	</div>
</section>
<!-- 상세정보 끝!! -->




<!-- 이용현황 및 내역 시작!!-->
<section class="list">
  <div class="container" style = "margin-top : 25px;">
    <div class="row justify-content-center">
	  <img class ="middle_img" src="resources/images/pet/Cuty_Dog1.png" width="150px" height="150px">
	  <h4 class="middle_head">이용 현황 및 내역</h4> 
	</div>
		
	<div id = "button1" class="row main_grayfont3" style = "margin-top : 25px;">
	  <div class = "float-left">
		  <div class="date_row">
			<input type="button" class="middle_bt1" id="middle_bt1" onclick ="button_7d();" value="1주일">
			<input type="button" class="middle_bt1" id="middle_bt2" onclick ="button_1m();" value="1개월">
			<input type="button" class="middle_bt1" id="middle_bt3" onclick ="button_3m();" value="3개월">
			<input type="button" class="middle_bt1" id="middle_bt4" onclick ="button_all();" value="전체 시기">
		  </div>
		</div>
		<form id = "search_form" method="post">
		<input type="hidden" name = "PETSITTER_ID" value = '<%=id %>'>
		<div class = "col-3 float-left" style = "padding : 8px 0 0 3px">	
	      	<input type="text" name = "STRING_STARTDATE" id="datePicker_start1" class="form-control dateP" placeholder="시작 날짜" style = "height : 41px;" width ="150px" autocomplete=off>
	    </div>
	    <div class = "col-3 float-left" style = "padding : 8px 0 0 3px">
	      	<input type="text" name = "STRING_ENDDATE" id="datePicker_end1" class="form-control dateP" placeholder="종료 날짜" style = "height : 41px;" width ="150px" autocomplete=off>
		</div>
		<div class = "col-1 float-left" style = "padding : 20px 0 0 3px">
			<input type="button" class="middle_bt2" id="search_data" value="조회" onclick = "button_select();">
		</div>			  
	  </form>
	</div>
	
  <table>
 	<colgroup>
	  <col style="width:15%">
	  <col style="width:20%">
	  <col style="width:20%">
	  <col style="width:20%">
	  <col style="width:15%">
	  <col style="width:15%">
	  <col style="width:15%">
	</colgroup> 
      <thead>
		<tr class="table_headRow" style = "color : #5e5e5e;">
		  <td>진행 현황</td>
		  <td id="td1">고객 사진</td>
		  <td>고객 정보</td>
		  <td>이용 일자</td>
		  <td>주문 번호</td>
		  <td>이용 금액</td>
		  <td>소통 게시판</td>
		</tr>	
	  </thead>
	  <!--목록 한묶음  시작-->
	  <tbody id = "output">

	  </tbody>

	</table>	
	<div id = "output1" style="text-align:center"></div>
  </div>
</section>
<!-- 이용현황 및 내역 끝!!-->

<!-- Modal 스케쥴 관리 시작-->
<div class="modal fade" id="staticBackdrop03" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title main_mintfont" id="staticBackdropLabel">스케쥴 관리</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class = "row">

      		<div class = "col-12">
      		<form action = "petsitterSchedule.me" method = "post">
      			<input type = "hidden" value = ${id } name = "PETSITTER_ID">
      			<table>
      				<tr>
      					<th class = "font-size-14">제외 날짜 : </th>
      					<td class = "tset2" width = "270px">제외 시작날짜
      					<input type="text" name = "START_DATE" id="datePicker_start" class="form-control dateP" placeholder="시작 날짜" style = "height : 41px;" width ="150px" autocomplete=off>
      					제외 종료날짜
      					<input type="text" name = "END_DATE" id="datePicker_end" class="form-control dateP" placeholder="종료 날짜" style = "height : 41px;" width ="150px" autocomplete=off>
      					</td>
      				</tr>
      				<tr>
      					<td></td>
      					<td class = ""><div class = "font-size-12">2020.5.20 ~2020.5.22 제외</div><div class = "font-size-12">2020.5.27 ~2020.5.29 제외</div></td>
      				</tr>
      				<tr>
      					<td></td>
      					<td><button class="modalbt04">추가</button></td>
      				</tr>
      
      			</table>
      			</form>
      		</div>
      		
        </div>
      </div>
     
      <div class="modal-footer">
        <button type="button" class="btn modalbt01" data-dismiss="modal">닫기</button>
        <button type="button" class="btn modalbt02">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal 스케쥴 관리종료-->

<!-- Modal 회원정보변경시작-->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title main_mintfont" id="staticBackdropLabel">회원정보변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class = "row">
      		<div class = "col-12">
      		    <form action = "petsitterUpdate.me" method = "post" id = "petsitterUpdate" enctype="multipart/form-data">
      			<input type = "hidden" value = <%=vo.getPETSITTER_ID() %> name = "PETSITTER_ID">
      			
      			<table class="table table-sm table-hover table-striped" style = "font-size : 15px;">
      				<tr>
      					<th width = "300px">닉네임 :</th>
      					<td colspan = "2" ><input id="userNickname" type = "text" size = "12" name = "nickname" class = "float-left" value = "<%=vo.getPETSITTER_NICKNAME() %>"><div class = "check_font" id = "nickname_check"></div></td>
      				</tr>
      				<tr>
      					<th>새 비밀번호 :</th>
      					<td colspan = "2"><input type = "password" name = "pw" size = "12" class = "float-left" value = "<%=vo.getPETSITTER_PW()%>"></td>
      				</tr>
      				<tr>
      					<th>새 비밀번호 확인 :</th>
      					<td colspan = "2"><input type = "password" size = "12" class = "float-left" value = "<%=vo.getPETSITTER_PW()%>">
      					</td>
      					
      				</tr>
      				<tr>
      					<th>이메일 변경 :</th>
      					<td colspan = "2" >
      					<input type="text" name="email" id="str_email01" style="width:124px" class= "float-left" value = "<%=email[0]%>">
								<div class= "float-left">@</div>
   							<input type="text" name="email" id="str_email02" style="width:124px;" class= "float-left" width = "124px" value = "<%=email[1]%>"> 
						    
      				</tr>
					<tr>
      					<th>주소 변경 :</th>
      					<td><input type = "text" name="address" value = "<%=address[0] %>" size = "30"  class = "float-left" id="sample4_postcode">
      					<input type="button" class="modalbt05 float-left" onclick="sample4_execDaumPostcode();" value="주소 검색 ">
      					</td>
      				</tr>
      				<tr>
      					<th>도로명 주소 :</th>
      					<td><input type = "text" name = "address" value = "<%=address[1] %>" size = "30"  class = "float-left" id="sample4_roadAddress">
      					<input type="hidden" id="guide" style="color:#999;display:none">
      					<input type="hidden" id="sample4_extraAddress" class="inpt" placeholder="참고항목" readonly>
      					<input type="hidden" id="sample4_jibunAddress" class="inpt" placeholder="지번주소" readonly>
      				</tr>
      				<tr>
      					<th>상세 주소 :</th>
      					<td colspan = "2" ><input type = "text" name="address" value = "<%=address[2] %>" size = "30" class = "float-left"></td>
      				</tr>
      				<tr>
      					<th>전화번호 :</th>
      					<td colspan = "2"><input type = "text" name = "tel" value = "<%=vo.getPETSITTER_TEL() %>" size = "10" class = "float-left">
      					</td>
      				</tr>
      				
      				<%for(int i = 0; i < 3;i++){ %>
      				<tr>
      					<th>자격증<%=i+1 %> :</th>
      					<td colspan = "2"><input name = "certName" type = "text" value = <%if(cert>i){ %>"<%=certName[i] %>"<% %>}else{ %>""<%} %>  size = "50" class = "float-left"></td>
      				</tr>
      				<tr>
      					<th>자격증 사진<%=i+1 %> :</th>
      					<td colspan = "2">
									<div class="filebox float-left"> 
							<div class = "img_wrap" id = "img<%=i+1 %>" <%if(!(cert>i)){ %>style = "display:none"<%} %> >
      						<img id= "img" class="img<%=i+1 %>" <%if(cert>i){ %> src= "/filepath/<%=certFile[i] %>"<%} %>/>
      					</div>
      						<input type= "text" name = "certState" class="upload-name" <%if(cert>i){ %>value="파일변경"<%}else{ %>value="파일선택"<%} %> readonly> 
      						<label for="ex_filename0<%=i+1 %>">업로드</label><input type="file" name = "certFile" id="ex_filename0<%=i+1 %>" class="upload-hidden"> </div>
      					</td>
      				</tr>
      				<%} %>
      				
      				<tr>
      					<th>케어 종류 : </th>
      					<td>
      						<input type = "checkbox" name = "type" class = "float-left radioC2" value = "방문" <%if(pet1.equals("checked")){ %>checked<%} %>><div class = "float-left">방문</div>
      						<input type = "checkbox" name = "type" class = "float-left radioC2" value = "위탁" <%if(pet2.equals("checked")){ %>checked<%} %>><div class = "float-left">위탁</div>
      					</td>
      				</tr>
      				<tr>
      					<th>위탁 1시간 가격 :</th>
      					<td colspan = "2" style = "text-align : left;"><input type = "text" name = "price60m" value = "<%=vo.getPETSITTER_PRICE_60M() %>" size = "10" class = "float-left">원</td>
      				</tr>
      				<tr>
      					<th>방문 30분 가격 :</th>
      					<td colspan = "2" style = "text-align : left;"><input type = "text" name = "price30m" value = "<%=vo.getPETSITTER_PRICE_30M() %>" size = "10" class = "float-left">원</td>
      				</tr>
      				<tr>
      					<th>대형견 가능 : </th>
      					<td>
									<input type="checkbox" name="servicelist" value="bigsize" class = "float-left radioC" <%if(bigsize.equals("checked")){ %>checked<%} %>/><div class = "float-left">가능</div>					
								</td>
							</tr>
							<tr>
      					<th>노견 케어가능 : </th>
      					<td>
									<input type="checkbox" name="servicelist" value="olddog" class = "float-left radioC" <%if(olddog.equals("checked")){ %>checked<%} %>/><div class = "float-left">가능</div>
									
								</td>
							</tr>
							<tr>
      					<th>고객 집 픽업 : </th>
      					<td>
									<input type="checkbox" name="servicelist" value="pickup" class = "float-left radioC" <%if(pickup.equals("checked")){ %>checked<%} %>/><div class = "float-left">가능</div>
									
								</td>
							</tr>
							<tr>
      					<th>마당 유무 : </th>
      					<td>
									<input type="checkbox" name="servicelist" value="yard" class = "float-left radioC" <%if(yard.equals("checked")){ %>checked<%} %>/><div class = "float-left">있음</div>
									
								</td>
							</tr>
      				<tr>
								<th class = "font-size-14">소개(예약페이지에서 고객 확인.) :</th>
								<td><textarea name="introduce" class = "tset4 float-left"><%=vo.getPETSITTER_INTRODUCE() %></textarea></td>
							</tr>
      				<tr>

      					<th>프로필 사진 :</th>
      					<td colspan = "2">
      					<div class = "img_wrap">
      						<%
      							if(vo.getPETSITTER_PHOTO_PROFILE_FILE().equals("N")) {
      						%>
      						<img id= "img" class="img4" src= "resources/images/defaultprofile02.png"/>
      						<%
      							} else {
      						%>
      						<img id= "img" class="img4" src= "/filepath/<%=vo.getPETSITTER_PHOTO_PROFILE_FILE() %>"/>
      						<%
      							}
      						%>
      					</div>
      					<div class="filebox float-left"> 
      						<input class="upload-name" value="파일선택" disabled="disabled"> 
      						<label for="ex_filename04">업로드</label><input type="file" name = "profile" id="ex_filename04" class="upload-hidden"> </div>
      						
      					</td>
      				</tr>
      				<tr>
      					<th>증명 사진 :</th>
      					<td colspan = "2">
      					<div class = "img_wrap">
      						<%
      							if(vo.getPETSITTER_PHOTO_UPFILE().equals("N")) {
      						%>
      						<img id= "img" class="img4" src= "resources/images/defaultprofile02.png"/>
      						<%
      							} else {
      						%>
      						<img id= "img" class="img5" src= "/filepath/<%=vo.getPETSITTER_PHOTO_UPFILE() %>"/>
      						<%
      							}
      						%>
      					</div>
									<div class="filebox float-left"> 
      						<input class="upload-name" value="파일선택" disabled="disabled"> 
      						<label for="ex_filename05">업로드</label><input type="file" name = "photo" id="ex_filename05" class="upload-hidden"> </div>
      						
      					</td>
      				</tr>
      				<%for(int j= 0; j < 3 ; j++){ %>
      				<tr>
      					<th>실내 사진<%=j+1 %> :</th>
      					<td colspan = "2">
      					<div class = "img_wrap" id = "img<%=j+6 %>" <%if(!(home>j)){ %>style = "display:none"<%} %> >
      						<img id= "img" class="img<%=j+6 %>" <%if(home>j){ %> src= "/filepath/<%=homeFile[j] %>"<%} %>/>
      					</div>
									<div class="filebox float-left"> 
      						<input class="upload-name" type ="text" name = "homeState" <%if(home>j){ %>value="파일변경"<%}else{ %>value="파일선택"<%} %> readonly> 
      						<label for="ex_filename0<%=j+6 %>">업로드</label><input type="file" name = "photoHome" id="ex_filename0<%=j+6 %>" class="upload-hidden"> </div>
      						
      					</td>
      				</tr> 
      				<%} %>
      				<tr>
      				<%for(int k = 0;k < 3; k++){ %>
      					<th>어필 사진<%=k+1 %> :</th>
      					<td colspan = "2">
      					<div class = "img_wrap" id = "img<%=k+9 %>" <%if(!(appeal>k)){ %>style = "display:none"<%} %>>
      						<img id= "img" class="img<%=k+9%>" <%if(appeal>k){ %> src= "/filepath/<%=appealFile[k] %>"<%} %>/>
      					</div>
									<div class="filebox float-left"> 
      						<input class="upload-name" type ="text" name = "AppealState" <%if(appeal>k){ %>value="파일변경"<%}else{ %>value="파일선택"<%} %> readonly> 
      						<label for="ex_filename0<%=k+9%>">업로드</label><input type="file" name = "photoAppeal" id="ex_filename0<%=k+9%>" class="upload-hidden"> </div>
      						
      					</td>
      				</tr>
      				<%} %>
       			</table>
       		</form>
      		</div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn modalbt01" data-dismiss="modal">닫기</button>
        <input type = "button" id = "Update_submit" onclick="document.getElementById('petsitterUpdate').submit();" class="btn modalbt02" value = "확인">
      </div>
      
    </div>
  </div>
</div>
<!-- Modal 회원정보변경종료-->



<!-- Modal 답글 남기기 시작-->
<div class="modal fade" id="staticBackdrop02" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title main_mintfont" id="staticBackdropLabel">답글 남기기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class = "row">
      		<div id = "imgoutput" class = "col-3">
      		</div>
      		<div class = "col-7">
						<div class = "float-left" style= "padding : 3px 0 0 3px; margin-left : 10px;">

							<table id = "output2">
							
							
							</table>

						</div>	
      		</div>
      		
      		<div class = "col-12" style = "padding : 0;">
      			<hr/>
      		</div>
      		
      		<div class = "col-12">
      		<form action = "reflyUpdate.me" method = "post" id = "reflyUpdate" >
      			<table id = "output3">

      			</table>
      			</form>
      		</div>
      		
        </div>
      </div>
     
      <div class="modal-footer">
        <button type="button" class="btn modalbt01" data-dismiss="modal">닫기</button>
        <button type="button" onclick="document.getElementById('reflyUpdate').submit();" class="btn modalbt02">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal 답글 남기기종료-->

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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	
		<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.sticky.js"/>"></script>	

    <script src="<c:url value="./resources/js/aos.js"/>"></script><!-- nav 상단바 반응형웹 적용1 -->

    <script src="<c:url value="/resources/js/main.js"/>"></script><!-- nav 상단바 반응형웹 적용2 -->
      
		<!-- 모달 구현 제이쿼리(부트스트랩용) 회원정보 수정 시작-->
    <script type="text/javascript">
    $('#myModal').on('shown.bs.modal', function () {
    	  $('#myInput').trigger('focus')
    	})
    </script>
    <!-- 모달 구현 제이쿼리(부트스트랩용) 회원정보 수정 종료-->
    
    <!-- 모달 구현 제이쿼리(부트스트랩용) 후기 남기기 시작-->
    <script type="text/javascript">
    $('#myModal').on('shown.bs.modal', function () {
    	  $('#myInput').trigger('focus')
    	})
    </script>
    <!-- 모달 구현 제이쿼리(부트스트랩용) 후기 남기기 종료-->
    
		<!-- 주소 창 불러오기 api 시작-->    
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
		</script>
		<!-- 주소 창 불러오기 api 종료-->
		
		<script type="text/javascript">
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
		</script>
		
		<script type="text/javascript">
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
			  
			 /* var btn = document.querySelector('#btnToggleOverflow'); 해당 아이디의 버튼이 없음.
			  btn.onClick = function() {
			    var val = divs[0].style.overflow == 'hidden' ? 'visible' : 'hidden';
			    for (var i = 0; i < divs.length; ++i)
			      divs[i].style.overflow = val;
			  };*/
			};
			/*사진 가로 세로 이미지 크기 맞추고 가운데 위치로 보이게 하기  종료*/ 
	  </script> 
	  
	 	
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
		<script type="text/javascript"> 
		//이메일 입력방식 선택 시작
		$('#selectEmail').change(function(){ 
			$("#selectEmail option:selected").each(function () { 
				if($(this).val()== '1'){ //직접입력일 경우 
					$("#str_email02").val(''); //값 초기화 
					$("#str_email02").attr("disabled",false); //활성화
					}else{ //직접입력이 아닐경우 
						$("#str_email02").val($(this).text()); //선택값 입력 
						$("#str_email02").attr("disabled",true); //비활성화 
						} 
				}); 
			}); 
		//이메일 입력방식 선택 종료
		</script>

	<!-- 데이트피커 ver.2 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<!-- 달력(한국어버젼_) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
	
	<!-- 데이트피커 자스코드 -->
	<script type="text/javascript">
		$('#datePicker_start').datepicker({
				format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
				language : "ko", // 언어(<ㅡ js추가필요해서 했음.)
				autoclose: true,
				orientation: "bottom auto"
		});
		
		$('#click-btn').on('click', function() { 
				var date = $('#dateRangePicker').val(); //클릭이벤
				alert(date);
		});
		
		
	</script>
  
  <script type="text/javascript">
		$('#datePicker_end').datepicker({
				format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
				language : "ko", // 언어(<ㅡ js추가필요해서 했음.)
				autoclose: true,
				orientation: "bottom auto"
		});
		
		$('#click-btn').on('click', function() { 
				var date = $('#dateRangePicker').val(); //클릭이벤
				alert(date);
		});
		


		
	</script>      
	
		<script type="text/javascript">
		$('#datePicker_start1').datepicker({
				format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
				language : "ko", // 언어(<ㅡ js추가필요해서 했음.)
				autoclose: true,
				orientation: "bottom auto"
		});
		
		$('#click-btn').on('click', function() { 
				var date = $('#dateRangePicker').val(); //클릭이벤
				alert(date);
		});

		
	</script>
  
  <script type="text/javascript">
		$('#datePicker_end1').datepicker({
				format : "yyyy-mm-dd", //달력에서 클릭시 표시할 값 형식
				language : "ko", // 언어(<ㅡ js추가필요해서 했음.)
				autoclose: true,
				orientation: "bottom auto"
		});
		
		$('#click-btn').on('click', function() { 
				var date = $('#dateRangePicker').val(); //클릭이벤
				alert(date);
		});
		


		
	</script>      

	<!-- 타임피커 ver.1 -->
	<script src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.js?version=1.3"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

	<!-- 타임피커 자스코드 -->
	<script type="text/javascript">
	$('.timepicker').timepicker({
	    timeFormat: 'p h:mm',
	    interval: 60,
	    minTime: '00',
	    maxTime: '11:00pm',
	    defaultTime: '24',
	    startTime: '00:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true,
	    autoclose: true
	});
	</script>
	
	<script type="text/javascript">
	$('.timepicker2').timepicker({
	    timeFormat: 'p h:mm',
	    interval: 60,
	    minTime: '07',
	    maxTime: '11:00pm',
	    defaultTime: '12',
	    startTime: '07:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true,
	    autoclose: true
	});
	</script>	 
	  


</body>
</html>