
//<!-- 맞춤조건 기능 -->
//<!-- (조건x)기본 게시판 불러오기 -->
var btn1= "N";
var btn2= "N";
var btn3= "N";
var btn4= "N";
   
var btn_a = "F";
var btn_b = "F";
var btn_c = "F";
var btn_g = "F";
var btn_type = "WE";

let loading = false;

var k = 1;	//반복될시 carousel 맞춤 지정

	function selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type) {
		$('#petsitter_middle_box').empty();
		
		if(loading) {
			return;
		}
		
		loading = true;
		
		$.ajax({
			url: '/petsitter/getPetsitterList_We.br',
			type: 'post',
			data : {
					btn1: btn1, 
					btn2: btn2, 
					btn3: btn3, 
					btn4: btn4,
					btn_a: btn_a,
					btn_b: btn_b,
					btn_c: btn_c,
					btn_g: btn_g,
					btn_type: btn_type
					},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				$.each(data, function(index, item) {
					var address = item.petsitter_ADDRESS.split(' ');
					var real_addr = address[0] + ' ' + address[1];
					var home_photo = item.petsitter_PHOTO_HOME_FILE.split(',');
					var output = '';
					output += '<div class="row">'
					output += '<div class="col">';
					output += '<div class="middle_box_row">';
					output += '<div class="middle_room_img">';
					
					output += '<div class = "col-12 float-none">';
		    		output += '<center>';
		    		
			    		if(item.petsitter_PHOTO_HOME_FILE != "N" && home_photo[1] != null){
			    		output += '<div id="carouselExampleIndicators'+k+'" class="carousel slide" data-ride="carousel"  >';
			    		output += '<ol class="carousel-indicators">';
			    		if(home_photo[2] != null){
			    		output += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="0" class="active"></li>';
			    		output += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="1"></li>';
			    		output += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="2"></li>';
			    		output += '</ol>';
			    		output += '<div class="carousel-inner">';
			    		output += '<div class="carousel-item active">';
			    		output += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
			    		output += '<img src="/filepath/'+home_photo[0]+'" class="d-block w-100" alt="...">';
			    		output += '</div></div></div>';
			    		output += '</div>';
			    		output += '<div class="carousel-item">';
			    		output += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
			    		output += '<img src="/filepath/'+home_photo[1]+'" class="d-block w-100" alt="...">';
			    		output += '</div></div></div>';
			    		output += '</div>';
			    		
			    		output += '<div class="carousel-item">';
			    		output += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
			    		output += '<img src="/filepath/'+home_photo[2]+'" class="d-block w-100" alt="...">';
			    		output += '</div></div></div>';
			    		output += '</div>';
			    		
			    		
			    		}
			    		if(home_photo[2] == null){
			    		output += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="0" class="active"></li>';
			    		output += '<li data-target="#carouselExampleIndicators'+k+'" data-slide-to="1"></li>';
			    		output += '</ol>';
			    		output += '<div class="carousel-inner">';
			    		output += '<div class="carousel-item active">';
			    		output += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
			    		output += '<img src="/filepath/'+home_photo[0]+'" class="d-block w-100" alt="...">';
			    		output += '</div></div></div>';
			    		output += '</div>';
			    		output += '<div class="carousel-item">';
			    		output += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
			    		output += '<img src="/filepath/'+home_photo[1]+'" class="d-block w-100" alt="...">';
			    		output += '</div></div></div>';
			    		output += '</div>';
			    		
			    		}
			    		
			    		output += '<a class="carousel-control-prev" href="#carouselExampleIndicators'+k+'" role="button" data-slide="prev">';
			    		output += '<svg style = "color : #949494; padding-right : 4px;"width="40px" height="32px" viewBox="0 0 16 16" class="bi bi-chevron-compact-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223z"/></svg>';
			    		output += '<span class="sr-only">Previous</span>';
			    		output += '</a>';
			    		output += '<a class="carousel-control-next" href="#carouselExampleIndicators'+k+'" role="button" data-slide="next">';
			    		output += '<svg style = "color : #949494; padding-left : 4px;"width="40px" height="32px" viewBox="0 0 16 16" class="bi bi-chevron-compact-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/></svg>';
			    		output += '<span class="sr-only">Next</span>';
			    		output += '</a>';
			    		output +=	'</div>';   	    		
			    		}
			    		
			    		if(item.petsitter_PHOTO_HOME_FILE != "N" && home_photo[1] == null){
		    			output += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
			    		output += '<img src="/filepath/'+home_photo[0]+'" class="d-block w-100" alt="...">';
			    		output += '</div></div></div>';	
			    		}
			    		
			    		if(item.petsitter_PHOTO_HOME_FILE == "N"){
			    		output += '<div class="thumbnail-wrapper"> <div class="thumbnail"> <div class="centered">';
			    		output += '<img src="resources/images/dogmark.png" class="d-block w-100" alt="...">';
			    		output += '</div></div></div>';
			    		}
			    		
		    		output += '</center>';
		    		output += '</div>';	

					output += '</div>';
					output += '<a href ="call_view.me" class="go_view" style="width: 600px;">';
					output += '<div class="view_top">';
					output += '<p class="v_location">' + real_addr;
					output += '<span class="v_i">  </span>';
					output += '<span class="v_grade">';
					if(item.petsitter_RANK == 'Pro') {
						output += '<img src="resources/images/petsitter_pro.png" style="width: 25px; margin-bottom: 5px;">';
					} else if(item.petsitter_RANK == 'GoldPro') {
						output += '<img src="resources/images/petsitter_goldpro.png" style="width: 25px; margin-bottom: 5px;">';
					}
					output += '</span>';
					output += '</p>';
					output += '<p class="v_introduce">' + item.petsitter_INTRODUCE + '</p>';
					output += '</div>';
					output += '<div class="view_middle_left">';
					output += '<div class="view_middle_left1">'; 
				
					//추가
					output += '<div class="v_option">';
					
					if(item.petsitter_SERVICE !== null) {
						for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
							output += item.petsitter_SERVICE[i];
							
							if(i !== item.petsitter_SERVICE.length - 1) {
								output += '<span class="v_i"> · </span>';
							}

						}
					}
					
					output += '</div>';
					output += '<div class="view_middle_left2">';
					if(item.petsitter_SCORE == 0)
					{
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
					}
					
					else if (0 < item.petsitter_SCORE && item.petsitter_SCORE < 1)
					{
						output += '<img class="starhalf" src="./resources/images/starhalf.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
					}	
						
						
					else if (item.petsitter_SCORE == 1)
					{
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
					}
					
					else if (1 < item.petsitter_SCORE && item.petsitter_SCORE < 2)
					{
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="starhalf" src="./resources/images/starhalf.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
					}
					
					else if (item.petsitter_SCORE == 2)
					{
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						
					}
					
					else if (2 < item.petsitter_SCORE && item.petsitter_SCORE < 3)
					{
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="starhalf" src="./resources/images/starhalf.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
					}
					
					else if (item.petsitter_SCORE == 3)
					{
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
					}
					
					else if (3 < item.petsitter_SCORE && item.petsitter_SCORE < 4)
					{
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="starhalf" src="./resources/images/starhalf.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
					}
					
					else if (item.petsitter_SCORE == 4)
					{
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star_empty.png">';
					}
					
					else if (4 < item.petsitter_SCORE && item.petsitter_SCORE < 5)
					{
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="starhalf" src="./resources/images/starhalf.png">';
					}
					
					else if (item.petsitter_SCORE == 5)
					{
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
						output += '<img class="star" src="./resources/images/star.png">';
					}
						
					output += '<span class="v_review">후기' + item.petsitter_REVIEWCOUNT + '개 </span>';
					output += '</div>';
					output += '</div>';
					output += '<div class="view_middle_right">';
					output += '<div class="view_middle_right1" style="margin-left: 10px;">';
					output += '<p class="v_money1">₩' + item.petsitter_PRICE_60M + '</p>';
					output += '<div class="v_1bak">';
					output += '<p class="oneNight">60분</p>';
					output += '</div>';
					output += '</div>';
					output += '</div></div></a></div></div></div>';
							
					$('#petsitter_middle_box').append(output);
					k++;
				});
				setTimeout(function() {
					loading = false;
				}, 100);
			},
			error: function() {
				alert("ajax 통신 실패!");
				setTimeout(function() {
					loading = false;
				}, 100);
			}
		});
	}
	
	$(document).ready(function() {
		
		btn_type ="WE";
	
	//픽업
	let pick = document.getElementById("custom_lb1");
		pick.addEventListener("click", function() {

		$("#custom_ck1").change(function(){
		if ($("#custom_ck1").is(":checked") == true)
		{
			btn1= "T"; 
			selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
		}
		else if ($("#custom_ck1").is(":checked") == false)
		{
			btn1= "N";
			selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
		}
		});
		
	});

	//대형견
	let bigDog = document.getElementById("custom_lb2");
		bigDog.addEventListener("click", function() {

		$("#custom_ck2").change(function(){
		if ($("#custom_ck2").is(":checked") == true)
		{			
			btn2= "T"; 
			selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
		}
		else if ($("#custom_ck2").is(":checked") == false)
		{
			btn2= "N";
			selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
		}
		});
		
	});
	
	//마당
	let yard = document.getElementById("custom_lb3");
		yard.addEventListener("click", function() {

		$("#custom_ck3").change(function(){
		if ($("#custom_ck3").is(":checked") == true)
		{			
			btn3= "T"; //파라미터 전달
		
			selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
		}
		else if ($("#custom_ck3").is(":checked") == false)
		{
			btn3= "N";
			selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
		}
		});
		
	});
	
	//노견
	let oldDog = document.getElementById("custom_lb4");
		oldDog.addEventListener("click", function() {
			
			$("#custom_ck4").change(function(){
			if ($("#custom_ck4").is(":checked") == true)
			{			
				btn4= "T"; //파라미터 전달
			
				selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
			}
			else if ($("#custom_ck3").is(":checked") == false)
			{
				btn4= "N";
				selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
				
			}
			});
			
		});
	

	//지역
	for(let i = 1; i <= 10; i++)
	{
		$("#area_lb"+i).on("click", function() {
			$("#area_ck"+i).change(function() {
			if ($("#area_ck"+i).is(":checked")  == true)
			{
				
				btn_a= $(this).val().split("/")[0]; //파라미터 전달
				btn_b="N";
				btn_c="N";
	
				
				if($(this).val().split("/").length == 2)
				{
					btn_b= $(this).val().split("/")[1];
				}
				else if($(this).val().split("/").length == 3)
				{
					btn_b= $(this).val().split("/")[1];
					btn_c= $(this).val().split("/")[2];
				}

				console.log("ㅊㅊㅊㅊ");
				selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
			}
			else if($("#area_ck"+i).is(":checked") == false)
			{
				btn_a= "F";
				btn_b="F";
				btn_c="F";
				
				selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
			}
			});
			
		});
	}
	
	
	
	let grade = document.getElementById("order_lb2");
		grade_ck = document.getElementById("order_ck2");
		
		grade.addEventListener("click", function() {
			$("#order_ck2").change(function(){ 
				if($("order_ck2").is(":checked") == true)
				{
					btn_g="F";
			
					selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
					console.log("성공적으로 F값을줌");
				}
				else if($("order_ck2").is(":checked") == false)
				{
					btn_g="T";
					selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
					console.log("성공적으로 T값을줌");
				}

		});
			
	});
	
		let newOrder = document.getElementById("order_lb1");
		newOrder_ck = document.getElementById("order_ck1");
		
		grade.addEventListener("click", function() {
			$("#order_ck1").change(function(){ 
				if($("order_ck1").is(":checked") == true)
				{
					btn_g="T";
			
					selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
					console.log("성공적으로 T값을줌");
				}
				else if($("order_ck1").is(":checked") == false)
				{
					btn_g="F";
					selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
					console.log("성공적으로 N값을줌");
				}

		});
			
	});
		selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
	
});	//함수 종료태그
		
		
		
