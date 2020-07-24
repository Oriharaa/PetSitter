
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
var btn_type = "BANG";

	//펫시터 클릭시 예약페이지로 넘어감.
	function go_foster(index)
	{
		let submit = document.getElementById("track_button"+index)
		submit.click();
	
	}

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
					
					//날짜, 시간 값
					var start_date = $('#datePicker_start').val();
					var end_date =  $('#datePicker_end').val();
					var start_time = $('#timePicker_start').val();
					var end_time = $('#timePicker_end').val();
					
					//위탁 방문 구분
					var radio_basic = "bang";
					
					//주소, 집사진x3, 자격증x3
					var address = item.petsitter_ADDRESS.split(' ');
					var real_addr = address[0] + ' ' + address[1];
					var home_photo = item.petsitter_PHOTO_HOME_FILE.split(',');
					var home_photo1 = home_photo[0];
					var home_photo2 = home_photo[1];
					var home_photo3 = home_photo[2];
					
					var cert_photo = item.petsitter_PHOTO_CERT_FILE.split(',');
					var cert_photo1 = cert_photo[0];
					var cert_photo2 = cert_photo[1];
					var cert_photo3 = cert_photo[2];
					
					//자격증 개수
					var cert_count = "";
					if( !(cert_photo1==="N" || cert_photo1==="null") )
					{
						cert_count = "1";
						
						if( !(cert_photo2==="N" || cert_photo2==="null") )
						{
							cert_count = "2";
							if( !(cert_photo3==="N" || cert_photo3==="null") )
							{
								cert_count = "3";
							}
						}
							
					}

					//위탁 1박 가격 , 대형견 1박 가격
					var price24 = 24 * (parseInt)(item.petsitter_PRICE_60M);
					var bigPrice = 1000 + (parseInt)(item.petsitter_PRICE_60M);
						
					//방문 1시간가격
					var price60 = 2 * (parseInt)(item.petsitter_PRICE_30M);
					var bigPrice2 = 1000 + (parseInt)(item.petsitter_PRICE_30M);
					
					var output = '';
					//히든값으로 펫시터 정보 넘겨줌..
						output += '<form action="foster_view.me" name="foster_form" method="POST" >';
					
					//분류 (아이디 / 주소 / 닉네임 / 등급 / 후기개수 / 자격증이름 / 자기소개 / 가능서비스 / 60분,30분가격 / 자격증개수)
						output += '<input type="hidden" name="petsitter_id" value="' + item.petsitter_ID+ '">';						
						output += '<input type="hidden" name="address" value="' + real_addr+ '">';
						output += '<input type="hidden" name="nickname" value="' + item.petsitter_NICKNAME+ '">';
						output += '<input type="hidden" name="rank" value="' + item.petsitter_RANK+ '">';
						output += '<input type="hidden" name="review_count"  value="' + item.petsitter_REVIEWCOUNT+ '">';
						output += '<input type="hidden" name="cert_list" value= "' + item.petsitter_CERT_LIST+ '">';
						output += '<input type="hidden" name="introduce" value="' + item.petsitter_INTRODUCE+ '">';
						output += '<input type="hidden" name="service" value="' + item.petsitter_SERVICE+ '">';
						output += '<input type="hidden" name="price" value="' + item.petsitter_PRICE_60M+ '">';
						output += '<input type="hidden" name="price2" value="' + item.petsitter_PRICE_30M+ '">';
						output += '<input type="hidden" name="cert_count" value="' + cert_count+ '">';
						
					//분류 (사진 ㅡ 펫시터프로필 / 펫시터 집x3 / 펫시터 자격증x3 / 펫시터 증명사진)
						output += '<input type="hidden" name="profile" value="' + item.petsitter_PHOTO_PROFILE_FILE+ '">';	
						output += '<input type="hidden" name="home_photo1" value="' + home_photo1+ '">';
						output += '<input type="hidden" name="home_photo2" value="' + home_photo2+ '">';
						output += '<input type="hidden" name="home_photo3" value="' + home_photo3+ '">';
						output += '<input type="hidden" name="cert_photo1"  value="' + cert_photo1+ '">';
						output += '<input type="hidden" name="cert_photo2"  value="' + cert_photo2+ '">';
						output += '<input type="hidden" name="cert_photo3"  value="' + cert_photo3+ '">';
						output += '<input type="hidden" name="photo_upfile" value="' +item.petsitter_PHOTO_UPFILE+'">';
	
					//분류 (날짜, 시간, 위탁방문라디오 )
						output += '<input type="hidden" name="start_date" value="' + start_date+ '">';
						output += '<input type="hidden" name="end_date" value="' + end_date+ '">';
						output += '<input type="hidden" name="start_time" value="' + start_time+ '">';
						output += '<input type="hidden" name="end_time" value="' + end_time+ '">';
						output += '<input type="hidden" name="radio_basic" value="' +radio_basic+ '">';
						
					//분류 (위탁1박가격 / 위탁1박(대형견)가격 / 방문1시간 가격 / 방문1시간(대형견)가격
						output += '<input type="hidden" name="price24" value="' +price24+ '">';
						output += '<input type="hidden" name="bigPrice" value="' +bigPrice+ '">';
						output += '<input type="hidden" name="price60" value="' +price60+ '">';
						output += '<input type="hidden" name="bigPrice2" value="' +bigPrice2+ '">';

						
						//펫시터뷰 기본틀
						output += '<div class="row">'
						output += '<div class="col">';
						output += '<div class="middle_box_row" onclick="go_foster(' +index+ ');">';
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
							output += '<a class="go_view">';
							output += '<div class="view_top">';
							output += '<p class="v_location">' + real_addr;
							output += '<span class="v_i"> · </span>';
							
							output += '<span class="v_grade">';
							if(item.petsitter_RANK == 'Pro') 
							{
								output += '<img src="resources/images/petsitter_pro.png">';
							} 
							else if(item.petsitter_RANK == 'GoldPro') 
							{
								output += '<img src="resources/images/petsitter_goldpro.png">';
							}
							output += '</span>';
	
							output += '</p>';
							output += '<p class="v_introduce">' + item.petsitter_INTRODUCE.substr(0,26);
							
							if(item.petsitter_INTRODUCE.length > 26)
							{
								output += '...';
							}
	
							
							//submit 버튼(display:hidden)
							output += '<button type="submit" class="track_button" id="track_button' +index+'"></button></p>';
							
							output += '</div>';
							output += '<div class="view_middle_left">';
							output += '<div class="view_middle_left1">'; 
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
								output += '<div class="view_middle_right2">';
								output += '<p class="v_money2">₩' + item.petsitter_PRICE_30M + '</p>';
								output += '<div class="v_1bak">';
								output += '<p class="oneDay">30분</p>';		
								output += '</div>';
	
								output +='</div></div></div></a></div></div></div></form>';
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
		
		btn_type ="BANG";

	
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
				}
				else if($("order_ck2").is(":checked") == false)
				{
					btn_g="T";
					selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
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
				}
				else if($("order_ck1").is(":checked") == false)
				{
					btn_g="F";
					selectData(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
				}
		});
	});
			
		
});	//함수 종료태그
		
		
		
