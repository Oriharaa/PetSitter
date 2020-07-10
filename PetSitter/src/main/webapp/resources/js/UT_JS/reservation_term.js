//<!-- 맞춤조건 기능 -->
//<!-- (조건x)기본 게시판 불러오기 -->
	function selectData() {
		$('#petsitter_middle_box').empty();
		
		$.ajax({
			url: '/petsitter/getPetsitterList_We.br',
			type: 'post',
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				$.each(data, function(index, item) {
					var output = '';
						output += '<div class="row">'
						output += '<div class="col">';
						output += '<div class="middle_box_row">';
						output += '<div class="middle_room_img">';
						/*이부분 사용자 방 사진 추가 */
						output +='<img class="room" src="./resources/images/room/bang1.jpg">'
							
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
		selectData();
	});	
	


//픽업 버튼
	
let pick = document.getElementById("custom_btn1");
	pick.addEventListener("click", function() {
		if(pick.value	 === "픽업"){
			function selectData() {
				$('#petsitter_middle_box').empty();
				$.ajax({
					url: '/petsitter/getPetsitterList_We_Pick.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="row">'
							output += '<div class="col">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_room_img">';
								
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
				selectData();
			});
		}
		else if(pick.value === "픽업 OK!"){
			function selectData() {
				$('#petsitter_middle_box').empty();
				
				$.ajax({
					url: '/petsitter/getPetsitterList_We.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="row">'
							output += '<div class="col">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_room_img">';
								
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
				selectData();
			});
		}
	});

//<!-- 대형견 버튼 클릭시 조건에 맞는 펫시터 뷰 뿌리기 -->
let bigDog = document.getElementById("custom_btn2");
	bigDog.addEventListener("click", function() {
		if(bigDog.value	 === "대형견"){
			
			function selectData() {
				$('#petsitter_middle_box').empty();

				$.ajax({
					url: '/petsitter/getPetsitterList_We_Big.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {

						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="row">'
							output += '<div class="col">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_room_img">';
								
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
				
				selectData();
			});
		}
		else if(bigDog.value === "대형견 OK!"){
			function selectData() {
				$('#petsitter_middle_box').empty();
				
				$.ajax({
					url: '/petsitter/getPetsitterList_We.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="row">'
							output += '<div class="col">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_room_img">';
								
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
				selectData();
			});
		}
	});
	
//마당 버튼 클릭시 조건에 맞는 펫시터 뷰 뿌리기 
let yard = document.getElementById("custom_btn3");
	yard.addEventListener("click", function() {
		if(yard.value	 === "마당"){
			
			function selectData() {
				$('#petsitter_middle_box').empty();
				
				$.ajax({
					url: '/petsitter/getPetsitterList_We_Yard.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="row">'
							output += '<div class="col">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_room_img">';
								
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
				
				selectData();
			});
		}
		else if(yard.value === "마당 OK!"){
			function selectData() {
				$('#petsitter_middle_box').empty();
				
				$.ajax({
					url: '/petsitter/getPetsitterList_We.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="row">'
							output += '<div class="col">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_room_img">';
								
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
				
				selectData();
			});
		}
	});
	
//노견 버튼 클릭시 조건에 맞는 펫시터 뷰 뿌리기 
let oldDog = document.getElementById("custom_btn4");
	oldDog.addEventListener("click", function() {
		if(oldDog.value	 === "노견"){
			
			function selectData() {
				$('#petsitter_middle_box').empty();
				
				$.ajax({
					url: '/petsitter/getPetsitterList_We_Old.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="row">'
							output += '<div class="col">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_room_img">';
								
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
				
				selectData();
			});
		}
		else if(oldDog.value === "노견 OK!"){
			function selectData() {
				$('#petsitter_middle_box').empty();
				
				$.ajax({
					url: '/petsitter/getPetsitterList_We.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						
						$.each(data, function(index, item) {
							var output = '';
							var output = '';
							output += '<div class="row">'
							output += '<div class="col">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_room_img">';
								
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
				
				selectData();
			});
		}
	});
	
	
//최신순, 평점순  
//평점순 
let gradeOrder = document.getElementById("gradeOrder");
	gradeOrder.addEventListener("click", function() {
	if(gradeOrder.style.background === "rgb(0, 200, 83)"){
	
	function selectData() {
		$('#petsitter_middle_box').empty();
	
	$.ajax({
		url: '/petsitter/getPetsitterList_We_Grade.br',
		type: 'post',
		dataType: 'json',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			
			$.each(data, function(index, item) {
				var output = '';
				output += '<div class="row">'
				output += '<div class="col">';
				output += '<div class="middle_box_row">';
				output += '<div class="middle_room_img">';
					
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
			selectData();
		});
	}
	
	else if(gradeOrder.style.background === "rgb(83, 220, 152)"){
	function selectData() {
		$('#petsitter_middle_box').empty();
	
	$.ajax({
		url: '/petsitter/getPetsitterList_We.br',
		type: 'post',
		dataType: 'json',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			
			$.each(data, function(index, item) {
				var output = '';
				output += '<div class="row">'
				output += '<div class="col">';
				output += '<div class="middle_box_row">';
				output += '<div class="middle_room_img">';
					
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
				
				selectData();
			});
		}
	});
	
//<!-- 최신순 --> 
let newOrder = document.getElementById("newOrder");
	newOrder.addEventListener("click", function() {
	if(newOrder.style.background === "rgb(0, 200, 83)"){
		
		function selectData() {
			$('#petsitter_middle_box').empty();
			
			$.ajax({
				url: '/petsitter/getPetsitterList_We.br',
				type: 'post',
				dataType: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(data) {
					
					$.each(data, function(index, item) {
						var output = '';
						output += '<div class="row">'
						output += '<div class="col">';
						output += '<div class="middle_box_row">';
						output += '<div class="middle_room_img">';
							
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
			selectData();
		});
	}
	
	else if(newOrder.style.background === "rgb(83, 220, 152)"){
		function selectData() {
			$('#petsitter_middle_box').empty();
			
			$.ajax({
				url: '/petsitter/getPetsitterList_We.br',
				type: 'post',
				dataType: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(data) {
					
					$.each(data, function(index, item) {
						var output = '';
						output += '<div class="row">'
						output += '<div class="col">';
						output += '<div class="middle_box_row">';
						output += '<div class="middle_room_img">';
							
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
			selectData();
		});
	}
});