
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

	function selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type) {
		$('#petsitter_middle_box').empty();
		
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
					var output = '';
						output += '<div class="row">'
						output += '<div class="col">';
						output += '<div class="middle_box_row">';
						output += '<div class="middle_room_img">';
						
						if(item.petsitter_PHOTO_HOME_FILE === "N") 
						{
							output += '<img class="noImg" src="resources/images/room/noimg.png">';
						}
						else 
						{
							output  += '<img class="room" src="/filepath/' + item.petsitter_PHOTO_HOME_FILE + '">';
						}		

						output += '</div>';
						output += '<a href ="call_view.me" class="go_view">';
						output += '<div class="view_top">';
						output += '<p class="v_location">' + item.petsitter_ADDRESS;
						output += '<span class="v_i"> · </span>';
						output += '<span class="v_grade">' + item.petsitter_RANK + '</span>';
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
						if(0 <= item.petsitter_SCORE && item.petsitter_SCORE < 0.5)
						{
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
						}
						
						else if (0.5 <= item.petsitter_SCORE && item.petsitter_SCORE < 1)
						{
							output += '<img class="starhalf" src="./resources/images/function/starhalf.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
						}	
							
							
						else if (1 <= item.petsitter_SCORE && item.petsitter_SCORE < 1.5 )
						{
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
						}
						
						else if ( 1.5 <= item.petsitter_SCORE && item.petsitter_SCORE < 2)
						{
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="starhalf" src="./resources/images/function/starhalf.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
						}
						
						else if ( 2 <= item.petsitter_SCORE && item.petsitter_SCORE < 2.5)
						{
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							
						}
						
						else if ( 2.5 <= item.petsitter_SCORE && item.petsitter_SCORE < 3)
						{
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="starhalf" src="./resources/images/function/starhalf.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
						}
						
						else if ( 3 <= item.petsitter_SCORE && item.petsitter_SCORE < 3.5)
						{
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
						}
						
						else if ( 3.5 <= item.petsitter_SCORE && item.petsitter_SCORE < 4)
						{
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="starhalf" src="./resources/images/function/starhalf.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
						}
						
						else if ( 4 <= item.petsitter_SCORE && item.petsitter_SCORE < 4.5)
						{
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star_empty.png">';
						}
						
						else if ( 4.5 <= item.petsitter_SCORE && item.petsitter_SCORE < 5)
					  {
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="starhalf" src="./resources/images/function/starhalf.png">';
					  }
						
						else if (item.petsitter_SCORE === 5)
						{
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
							output += '<img class="star" src="./resources/images/function/star.png">';
						}
						
							output += '<span class="v_review">후기' + item.petsitter_REVIEWCOUNT + '개 </span>';
							output += '</div>';
							output += '</div>';
							output += '<div class="view_middle_right">';
							output += '<div class="view_middle_right1">';
							output += '<p class="v_money1">₩' + item.petsitter_PRICE_12H + '</p>';
							output += '<div class="v_1bak">';
							output += '<p class="oneNight">데이케어</p>';
							output += '</div>';
							output += '</div>';
							output += '<div class="view_middle_right2">';
							output += '<p class="v_money2">₩' + item.petsitter_PRICE_24H + '</p>';
							output += '<div class="v_1bak">';
							output += '<p class="oneDay">1박케어</p>';
							output += '</div></div></div></div></a></div></div></div>';
							$('#petsitter_middle_box').append(output);		
				});
			},
			error: function() {
				alert("ajax 통신 실패!");
			}
		});
	}
	
	$(document).ready(function() {
		selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
		
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
			
	
});	//함수 종료태그
		
		
		
