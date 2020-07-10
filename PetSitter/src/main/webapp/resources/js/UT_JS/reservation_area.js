//지역별 (서울/경기)
let areaa1 = document.getElementById("area_btn1");
	areaa1.addEventListener("click", function() {
	
		if(areaa1.value	=== "서울/경기"){
			function selectData() {
				$('#petsitter_middle_box').empty();
				$.ajax({
					url: '/petsitter/getPetsitterList_We_Area1.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="col-12">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_box_img">';
							output += '</div>'; // middle_box_img 종료 태그
							output += '<div class="middle_box_view">';
							output += '<div class="middle_box_view_start">';
							output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
							output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
							output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
							output += '</div>'; // middle_box_view_start 종료 태그
							output += '<div class="middle_box_view_center">';
							
							if(item.petsitter_SERVICE !== null) {
								for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
									output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
									if(i !== item.petsitter_SERVICE.length - 1) {
										output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
									}
								}
							}
							output += '</div>'; // middle_box_view_center 종료 태그
							output += '<div class="middle_box_view_end">'; // 별점
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

							output += '<span class="v_review">'
							output += '</div>'; // middle_box_view_end 종료 태그
							output += '</div>'; // middle_box_view 종료 태그
							output += '</div>'; // middle_box_row 종료 태그
							output += '</div>'; // col-12 종료 태그
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
			else if(areaa1.value === "서울/경기 "){
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
								output += '<div class="col-12">';
								output += '<div class="middle_box_row">';
								output += '<div class="middle_box_img">';
								output += '</div>'; // middle_box_img 종료 태그
								output += '<div class="middle_box_view">';
								output += '<div class="middle_box_view_start">';
								output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
								output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
								output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
								output += '</div>'; // middle_box_view_start 종료 태그
								output += '<div class="middle_box_view_center">';
								
								if(item.petsitter_SERVICE !== null) {
									for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
										output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
										if(i !== item.petsitter_SERVICE.length - 1) {
											output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
										}
									}
								}
								output += '</div>'; // middle_box_view_center 종료 태그
								output += '<div class="middle_box_view_end">'; // 별점
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

								output += '<span class="v_review">'
								output += '</div>'; // middle_box_view_end 종료 태그
								output += '</div>'; // middle_box_view 종료 태그
								output += '</div>'; // middle_box_row 종료 태그
								output += '</div>'; // col-12 종료 태그
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
		
//지역별 (인천/부천)
let areaa2 = document.getElementById("area_btn2");
	areaa2.addEventListener("click", function() {
			
	if(areaa2.value	=== "인천/부천"){
		function selectData() {
			$('#petsitter_middle_box').empty();
				$.ajax({
					url: '/petsitter/getPetsitterList_We_Area2.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="col-12">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_box_img">';
							output += '</div>'; // middle_box_img 종료 태그
							output += '<div class="middle_box_view">';
							output += '<div class="middle_box_view_start">';
							output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
							output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
							output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
							output += '</div>'; // middle_box_view_start 종료 태그
							output += '<div class="middle_box_view_center">';
							
							if(item.petsitter_SERVICE !== null) {
								for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
									output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
									if(i !== item.petsitter_SERVICE.length - 1) {
										output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
									}
								}
							}
							output += '</div>'; // middle_box_view_center 종료 태그
							output += '<div class="middle_box_view_end">'; // 별점
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

							output += '<span class="v_review">'
							output += '</div>'; // middle_box_view_end 종료 태그
							output += '</div>'; // middle_box_view 종료 태그
							output += '</div>'; // middle_box_row 종료 태그
							output += '</div>'; // col-12 종료 태그		
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
		else if(areaa2.value === "인천/부천 "){
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
								output += '<div class="col-12">';
								output += '<div class="middle_box_row">';
								output += '<div class="middle_box_img">';
								output += '</div>'; // middle_box_img 종료 태그
								output += '<div class="middle_box_view">';
								output += '<div class="middle_box_view_start">';
								output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
								output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
								output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
								output += '</div>'; // middle_box_view_start 종료 태그
								output += '<div class="middle_box_view_center">';
								
								if(item.petsitter_SERVICE !== null) {
									for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
										output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
										if(i !== item.petsitter_SERVICE.length - 1) {
											output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
										}
									}
								}
								output += '</div>'; // middle_box_view_center 종료 태그
								output += '<div class="middle_box_view_end">'; // 별점
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

								output += '<span class="v_review">'
								output += '</div>'; // middle_box_view_end 종료 태그
								output += '</div>'; // middle_box_view 종료 태그
								output += '</div>'; // middle_box_row 종료 태그
								output += '</div>'; // col-12 종료 태그

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
	
//지역별 (춘천/강원)
let areaa3 = document.getElementById("area_btn3");
areaa3.addEventListener("click", function() {
	
if(areaa3.value	=== "춘천/강원"){
function selectData() {
	$('#petsitter_middle_box').empty();
		$.ajax({
			url: '/petsitter/getPetsitterList_We_Area3.br',
			type: 'post',
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				$.each(data, function(index, item) {
					var output = '';
					output += '<div class="col-12">';
					output += '<div class="middle_box_row">';
					output += '<div class="middle_box_img">';
					output += '</div>'; // middle_box_img 종료 태그
					output += '<div class="middle_box_view">';
					output += '<div class="middle_box_view_start">';
					output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
					output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
					output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
					output += '</div>'; // middle_box_view_start 종료 태그
					output += '<div class="middle_box_view_center">';
					
					if(item.petsitter_SERVICE !== null) {
						for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
							output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
							if(i !== item.petsitter_SERVICE.length - 1) {
								output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
							}
						}
					}
					output += '</div>'; // middle_box_view_center 종료 태그
					output += '<div class="middle_box_view_end">'; // 별점
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

					output += '<span class="v_review">'
					output += '</div>'; // middle_box_view_end 종료 태그
					output += '</div>'; // middle_box_view 종료 태그
					output += '</div>'; // middle_box_row 종료 태그
					output += '</div>'; // col-12 종료 태그			
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
else if(areaa3.value === "춘천/강원 "){
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
						output += '<div class="col-12">';
						output += '<div class="middle_box_row">';
						output += '<div class="middle_box_img">';
						output += '</div>'; // middle_box_img 종료 태그
						output += '<div class="middle_box_view">';
						output += '<div class="middle_box_view_start">';
						output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
						output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
						output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
						output += '</div>'; // middle_box_view_start 종료 태그
						output += '<div class="middle_box_view_center">';
						
						if(item.petsitter_SERVICE !== null) {
							for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
								output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
								if(i !== item.petsitter_SERVICE.length - 1) {
									output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
								}
							}
						}
						output += '</div>'; // middle_box_view_center 종료 태그
						output += '<div class="middle_box_view_end">'; // 별점
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

						output += '<span class="v_review">'
						output += '</div>'; // middle_box_view_end 종료 태그
						output += '</div>'; // middle_box_view 종료 태그
						output += '</div>'; // middle_box_row 종료 태그
						output += '</div>'; // col-12 종료 태그

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
		
//지역별 (부산/울산/경남)
let areaa4 = document.getElementById("area_btn4");
areaa4.addEventListener("click", function() {
		
if(areaa4.value	=== "부산/울산/경남"){
function selectData() {
	$('#petsitter_middle_box').empty();
		$.ajax({
			url: '/petsitter/getPetsitterList_We_Area4.br',
			type: 'post',
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				$.each(data, function(index, item) {
					var output = '';
					output += '<div class="col-12">';
					output += '<div class="middle_box_row">';
					output += '<div class="middle_box_img">';
					output += '</div>'; // middle_box_img 종료 태그
					output += '<div class="middle_box_view">';
					output += '<div class="middle_box_view_start">';
					output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
					output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
					output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
					output += '</div>'; // middle_box_view_start 종료 태그
					output += '<div class="middle_box_view_center">';
					
					if(item.petsitter_SERVICE !== null) {
						for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
							output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
							if(i !== item.petsitter_SERVICE.length - 1) {
								output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
							}
						}
					}
					output += '</div>'; // middle_box_view_center 종료 태그
					output += '<div class="middle_box_view_end">'; // 별점
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

					output += '<span class="v_review">'
					output += '</div>'; // middle_box_view_end 종료 태그
					output += '</div>'; // middle_box_view 종료 태그
					output += '</div>'; // middle_box_row 종료 태그
					output += '</div>'; // col-12 종료 태그		
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
else if(areaa4.value === "부산/울산/경남 "){
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
						output += '<div class="col-12">';
						output += '<div class="middle_box_row">';
						output += '<div class="middle_box_img">';
						output += '</div>'; // middle_box_img 종료 태그
						output += '<div class="middle_box_view">';
						output += '<div class="middle_box_view_start">';
						output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
						output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
						output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
						output += '</div>'; // middle_box_view_start 종료 태그
						output += '<div class="middle_box_view_center">';
						
						if(item.petsitter_SERVICE !== null) {
							for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
								output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
								if(i !== item.petsitter_SERVICE.length - 1) {
									output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
								}
							}
						}
						output += '</div>'; // middle_box_view_center 종료 태그
						output += '<div class="middle_box_view_end">'; // 별점
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

						output += '<span class="v_review">'
						output += '</div>'; // middle_box_view_end 종료 태그
						output += '</div>'; // middle_box_view 종료 태그
						output += '</div>'; // middle_box_row 종료 태그
						output += '</div>'; // col-12 종료 태그

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
			
//지역별 (대구/경북)
let areaa5 = document.getElementById("area_btn5");
	areaa5.addEventListener("click", function() {
			
	if(areaa5.value	=== "대구/경북"){
		function selectData() {
			$('#petsitter_middle_box').empty();
				$.ajax({
					url: '/petsitter/getPetsitterList_We_Area5.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="col-12">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_box_img">';
							output += '</div>'; // middle_box_img 종료 태그
							output += '<div class="middle_box_view">';
							output += '<div class="middle_box_view_start">';
							output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
							output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
							output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
							output += '</div>'; // middle_box_view_start 종료 태그
							output += '<div class="middle_box_view_center">';
							
							if(item.petsitter_SERVICE !== null) {
								for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
									output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
									if(i !== item.petsitter_SERVICE.length - 1) {
										output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
									}
								}
							}
							output += '</div>'; // middle_box_view_center 종료 태그
							output += '<div class="middle_box_view_end">'; // 별점
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

							output += '<span class="v_review">'
							output += '</div>'; // middle_box_view_end 종료 태그
							output += '</div>'; // middle_box_view 종료 태그
							output += '</div>'; // middle_box_row 종료 태그
							output += '</div>'; // col-12 종료 태그		
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
		else if(areaa5.value === "대구/경북 "){
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
								output += '<div class="col-12">';
								output += '<div class="middle_box_row">';
								output += '<div class="middle_box_img">';
								output += '</div>'; // middle_box_img 종료 태그
								output += '<div class="middle_box_view">';
								output += '<div class="middle_box_view_start">';
								output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
								output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
								output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
								output += '</div>'; // middle_box_view_start 종료 태그
								output += '<div class="middle_box_view_center">';
								
								if(item.petsitter_SERVICE !== null) {
									for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
										output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
										if(i !== item.petsitter_SERVICE.length - 1) {
											output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
										}
									}
								}
								output += '</div>'; // middle_box_view_center 종료 태그
								output += '<div class="middle_box_view_end">'; // 별점
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

								output += '<span class="v_review">'
								output += '</div>'; // middle_box_view_end 종료 태그
								output += '</div>'; // middle_box_view 종료 태그
								output += '</div>'; // middle_box_row 종료 태그
								output += '</div>'; // col-12 종료 태그

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
				
//지역별 (전주/전북)
let areaa6 = document.getElementById("area_btn6");
	areaa6.addEventListener("click", function() {
			
	if(areaa6.value	=== "전주/전북"){
		function selectData() {
			$('#petsitter_middle_box').empty();
				$.ajax({
					url: '/petsitter/getPetsitterList_We_Area6.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="col-12">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_box_img">';
							output += '</div>'; // middle_box_img 종료 태그
							output += '<div class="middle_box_view">';
							output += '<div class="middle_box_view_start">';
							output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
							output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
							output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
							output += '</div>'; // middle_box_view_start 종료 태그
							output += '<div class="middle_box_view_center">';
							
							if(item.petsitter_SERVICE !== null) {
								for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
									output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
									if(i !== item.petsitter_SERVICE.length - 1) {
										output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
									}
								}
							}
							output += '</div>'; // middle_box_view_center 종료 태그
							output += '<div class="middle_box_view_end">'; // 별점
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

							output += '<span class="v_review">'
							output += '</div>'; // middle_box_view_end 종료 태그
							output += '</div>'; // middle_box_view 종료 태그
							output += '</div>'; // middle_box_row 종료 태그
							output += '</div>'; // col-12 종료 태그			
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
		else if(areaa6.value === "전주/전북 "){
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
								output += '<div class="col-12">';
								output += '<div class="middle_box_row">';
								output += '<div class="middle_box_img">';
								output += '</div>'; // middle_box_img 종료 태그
								output += '<div class="middle_box_view">';
								output += '<div class="middle_box_view_start">';
								output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
								output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
								output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
								output += '</div>'; // middle_box_view_start 종료 태그
								output += '<div class="middle_box_view_center">';
								
								if(item.petsitter_SERVICE !== null) {
									for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
										output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
										if(i !== item.petsitter_SERVICE.length - 1) {
											output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
										}
									}
								}
								output += '</div>'; // middle_box_view_center 종료 태그
								output += '<div class="middle_box_view_end">'; // 별점
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

								output += '<span class="v_review">'
								output += '</div>'; // middle_box_view_end 종료 태그
								output += '</div>'; // middle_box_view 종료 태그
								output += '</div>'; // middle_box_row 종료 태그
								output += '</div>'; // col-12 종료 태그

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
					
//지역별 (광주/전남)
let areaa7 = document.getElementById("area_btn7");
	areaa7.addEventListener("click", function() {
			
	if(areaa7.value	=== "광주/전남"){
		function selectData() {
			$('#petsitter_middle_box').empty();
				$.ajax({
					url: '/petsitter/getPetsitterList_We_Area7.br',
					type: 'post',
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						$.each(data, function(index, item) {
							var output = '';
							output += '<div class="col-12">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_box_img">';
							output += '</div>'; // middle_box_img 종료 태그
							output += '<div class="middle_box_view">';
							output += '<div class="middle_box_view_start">';
							output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
							output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
							output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
							output += '</div>'; // middle_box_view_start 종료 태그
							output += '<div class="middle_box_view_center">';
							
							if(item.petsitter_SERVICE !== null) {
								for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
									output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
									if(i !== item.petsitter_SERVICE.length - 1) {
										output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
									}
								}
							}
							output += '</div>'; // middle_box_view_center 종료 태그
							output += '<div class="middle_box_view_end">'; // 별점
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

							output += '<span class="v_review">'
							output += '</div>'; // middle_box_view_end 종료 태그
							output += '</div>'; // middle_box_view 종료 태그
							output += '</div>'; // middle_box_row 종료 태그
							output += '</div>'; // col-12 종료 태그		
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
		else if(areaa7.value === "광주/전남 "){
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
								output += '<div class="col-12">';
								output += '<div class="middle_box_row">';
								output += '<div class="middle_box_img">';
								output += '</div>'; // middle_box_img 종료 태그
								output += '<div class="middle_box_view">';
								output += '<div class="middle_box_view_start">';
								output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
								output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
								output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
								output += '</div>'; // middle_box_view_start 종료 태그
								output += '<div class="middle_box_view_center">';
								
								if(item.petsitter_SERVICE !== null) {
									for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
										output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
										if(i !== item.petsitter_SERVICE.length - 1) {
											output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
										}
									}
								}
								output += '</div>'; // middle_box_view_center 종료 태그
								output += '<div class="middle_box_view_end">'; // 별점
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

								output += '<span class="v_review">'
								output += '</div>'; // middle_box_view_end 종료 태그
								output += '</div>'; // middle_box_view 종료 태그
								output += '</div>'; // middle_box_row 종료 태그
								output += '</div>'; // col-12 종료 태그

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
						
//지역별(청주/충북)
let areaa8 = document.getElementById("area_btn8");
areaa8.addEventListener("click", function() {
		
if(areaa8.value	=== "청주/충북"){
	function selectData() {
		$('#petsitter_middle_box').empty();
			$.ajax({
				url: '/petsitter/getPetsitterList_We_Area8.br',
				type: 'post',
				dataType: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(data) {
					$.each(data, function(index, item) {
						var output = '';
						output += '<div class="col-12">';
						output += '<div class="middle_box_row">';
						output += '<div class="middle_box_img">';
						output += '</div>'; // middle_box_img 종료 태그
						output += '<div class="middle_box_view">';
						output += '<div class="middle_box_view_start">';
						output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
						output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
						output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
						output += '</div>'; // middle_box_view_start 종료 태그
						output += '<div class="middle_box_view_center">';
						
						if(item.petsitter_SERVICE !== null) {
							for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
								output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
								if(i !== item.petsitter_SERVICE.length - 1) {
									output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
								}
							}
						}
						output += '</div>'; // middle_box_view_center 종료 태그
						output += '<div class="middle_box_view_end">'; // 별점
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

						output += '<span class="v_review">'
						output += '</div>'; // middle_box_view_end 종료 태그
						output += '</div>'; // middle_box_view 종료 태그
						output += '</div>'; // middle_box_row 종료 태그
						output += '</div>'; // col-12 종료 태그			
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
	else if(areaa8.value === "청주/충북 "){
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
							output += '<div class="col-12">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_box_img">';
							output += '</div>'; // middle_box_img 종료 태그
							output += '<div class="middle_box_view">';
							output += '<div class="middle_box_view_start">';
							output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
							output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
							output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
							output += '</div>'; // middle_box_view_start 종료 태그
							output += '<div class="middle_box_view_center">';
							
							if(item.petsitter_SERVICE !== null) {
								for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
									output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
									if(i !== item.petsitter_SERVICE.length - 1) {
										output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
									}
								}
							}
							output += '</div>'; // middle_box_view_center 종료 태그
							output += '<div class="middle_box_view_end">'; // 별점
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

							output += '<span class="v_review">'
							output += '</div>'; // middle_box_view_end 종료 태그
							output += '</div>'; // middle_box_view 종료 태그
							output += '</div>'; // middle_box_row 종료 태그
							output += '</div>'; // col-12 종료 태그

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

//지역별(대전/충남)
let areaa9 = document.getElementById("area_btn9");
areaa9.addEventListener("click", function() {
		
if(areaa9.value	=== "대전/충남"){
	function selectData() {
		$('#petsitter_middle_box').empty();
			$.ajax({
				url: '/petsitter/getPetsitterList_We_Area9.br',
				type: 'post',
				dataType: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(data) {
					$.each(data, function(index, item) {
						var output = '';
						output += '<div class="col-12">';
						output += '<div class="middle_box_row">';
						output += '<div class="middle_box_img">';
						output += '</div>'; // middle_box_img 종료 태그
						output += '<div class="middle_box_view">';
						output += '<div class="middle_box_view_start">';
						output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
						output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
						output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
						output += '</div>'; // middle_box_view_start 종료 태그
						output += '<div class="middle_box_view_center">';
						
						if(item.petsitter_SERVICE !== null) {
							for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
								output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
								if(i !== item.petsitter_SERVICE.length - 1) {
									output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
								}
							}
						}
						output += '</div>'; // middle_box_view_center 종료 태그
						output += '<div class="middle_box_view_end">'; // 별점
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

						output += '<span class="v_review">'
						output += '</div>'; // middle_box_view_end 종료 태그
						output += '</div>'; // middle_box_view 종료 태그
						output += '</div>'; // middle_box_row 종료 태그
						output += '</div>'; // col-12 종료 태그		
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
	else if(areaa9.value === "대전/충남 "){
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
							output += '<div class="col-12">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_box_img">';
							output += '</div>'; // middle_box_img 종료 태그
							output += '<div class="middle_box_view">';
							output += '<div class="middle_box_view_start">';
							output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
							output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
							output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
							output += '</div>'; // middle_box_view_start 종료 태그
							output += '<div class="middle_box_view_center">';
							
							if(item.petsitter_SERVICE !== null) {
								for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
									output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
									if(i !== item.petsitter_SERVICE.length - 1) {
										output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
									}
								}
							}
							output += '</div>'; // middle_box_view_center 종료 태그
							output += '<div class="middle_box_view_end">'; // 별점
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

							output += '<span class="v_review">'
							output += '</div>'; // middle_box_view_end 종료 태그
							output += '</div>'; // middle_box_view 종료 태그
							output += '</div>'; // middle_box_row 종료 태그
							output += '</div>'; // col-12 종료 태그

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

//지역별(제주)
let areaa10 = document.getElementById("area_btn10");
areaa10.addEventListener("click", function() {
		
if(areaa10.value === "제주"){
	function selectData() {
		$('#petsitter_middle_box').empty();
			$.ajax({
				url: '/petsitter/getPetsitterList_We_Area10.br',
				type: 'post',
				dataType: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(data) {
					$.each(data, function(index, item) {
						var output = '';
						output += '<div class="col-12">';
						output += '<div class="middle_box_row">';
						output += '<div class="middle_box_img">';
						output += '</div>'; // middle_box_img 종료 태그
						output += '<div class="middle_box_view">';
						output += '<div class="middle_box_view_start">';
						output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
						output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
						output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
						output += '</div>'; // middle_box_view_start 종료 태그
						output += '<div class="middle_box_view_center">';
						
						if(item.petsitter_SERVICE !== null) {
							for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
								output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
								if(i !== item.petsitter_SERVICE.length - 1) {
									output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
								}
							}
						}
						output += '</div>'; // middle_box_view_center 종료 태그
						output += '<div class="middle_box_view_end">'; // 별점
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

						output += '<span class="v_review">'
						output += '</div>'; // middle_box_view_end 종료 태그
						output += '</div>'; // middle_box_view 종료 태그
						output += '</div>'; // middle_box_row 종료 태그
						output += '</div>'; // col-12 종료 태그			
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
	else if(areaa10.value === "제주 "){
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
							output += '<div class="col-12">';
							output += '<div class="middle_box_row">';
							output += '<div class="middle_box_img">';
							output += '</div>'; // middle_box_img 종료 태그
							output += '<div class="middle_box_view">';
							output += '<div class="middle_box_view_start">';
							output += '<span class="v_location">' + item.petsitter_ADDRESS + '</span>&nbsp;';
							output += '<span class="v_grade">' + item.petsitter_RANK + '</span><br />';
							output += '<span class="v_title">' + item.petsitter_INTRODUCE + '</span>';
							output += '</div>'; // middle_box_view_start 종료 태그
							output += '<div class="middle_box_view_center">';
							
							if(item.petsitter_SERVICE !== null) {
								for(let i = 0; i < item.petsitter_SERVICE.length; i++) {
									output += '<span class="v_option" id="option${i+1}">' + item.petsitter_SERVICE[i] + '</span>';
									if(i !== item.petsitter_SERVICE.length - 1) {
										output += '<span class="v_option" id="optionJum">' + '&nbsp;' + '</span>';
									}
								}
							}
							output += '</div>'; // middle_box_view_center 종료 태그
							output += '<div class="middle_box_view_end">'; // 별점
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

							output += '<span class="v_review">'
							output += '</div>'; // middle_box_view_end 종료 태그
							output += '</div>'; // middle_box_view 종료 태그
							output += '</div>'; // middle_box_row 종료 태그
							output += '</div>'; // col-12 종료 태그

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