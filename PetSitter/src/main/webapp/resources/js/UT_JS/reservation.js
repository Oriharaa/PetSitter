// 원하는 조건 선택시 버튼 색상 변화 + 다른 버튼 비활성화
// 픽업, 대형견, 마당, 노견 
   let btn1 = document.getElementById("custom_btn1");
   let btn2 = document.getElementById("custom_btn2");
   let btn3 = document.getElementById("custom_btn3");
   let btn4 = document.getElementById("custom_btn4");
        
   btn1.addEventListener("click", function() {
	    if(btn1.style.background === "rgb(83, 220, 152)"){
		   btn1.style.background = "rgb(0, 200, 83)";
		   btn2.disabled = true;
		   btn3.disabled = true;
		   btn4.disabled = true;
		   
 } else if(btn1.style.background === "rgb(0, 200, 83)") {
	 	   btn1.style.background = "rgb(83, 220, 152)";
	 	   btn2.disabled = false;
 		   btn3.disabled = false;
 		   btn4.disabled = false;

 } else { 
	 	  btn1.style.background = "rgb(0, 200, 83)"; 
 		  btn2.disabled = true;
 		  btn3.disabled = true;
 		  btn4.disabled = true; }  			
   });
 
   btn2.addEventListener("click", function() {
	    if(btn2.style.background === "rgb(83, 220, 152)"){
	       btn2.style.background = "rgb(0, 200, 83)";
	       btn1.disabled = true;
		   btn3.disabled = true;
		   btn4.disabled = true;
		   
 } else if(btn2.style.background === "rgb(0, 200, 83)") {
	       btn2.style.background = "rgb(83, 220, 152)";
	       btn1.disabled = false;
 		   btn3.disabled = false;
 		   btn4.disabled = false;
 		   
 } else { 
	 	  btn2.style.background = "rgb(0, 200, 83)"; 
	 	  btn1.disabled = true;
		  btn3.disabled = true;
		  btn4.disabled = true; }			
   });
      		 
       
   btn3.addEventListener("click", function() {
	 	if(btn3.style.background === "rgb(83, 220, 152)"){
	 	   btn3.style.background = "rgb(0, 200, 83)";
	 	   btn1.disabled = true;
		   btn2.disabled = true;
		   btn4.disabled = true;
		   
 } else if(btn3.style.background === "rgb(0, 200, 83)") {
		   btn3.style.background = "rgb(83, 220, 152)";
		   btn1.disabled = false;
 		   btn2.disabled = false;
 		   btn4.disabled = false;
		   
 } else { 
	 	  btn3.style.background = "rgb(0, 200, 83)"; 
	 	  btn1.disabled = true;
		  btn2.disabled = true;
		  btn4.disabled = true; }
   });

       
   btn4.addEventListener("click", function() {
		if(btn4.style.background === "rgb(83, 220, 152)"){
		   btn4.style.background = "rgb(0, 200, 83)";
		   btn1.disabled = true;
		   btn2.disabled = true;
		   btn3.disabled = true;
		   
 } else if(btn4.style.background === "rgb(0, 200, 83)") {
 		   btn4.style.background = "rgb(83, 220, 152)";
 		   btn1.disabled = false;
		   btn2.disabled = false;
		   btn3.disabled = false;
 		   
 } else { 
	 	  btn4.style.background = "rgb(0, 200, 83)";
	 	  btn1.disabled = false;
		  btn2.disabled = false;
		  btn3.disabled = false; }
   });



// 원하는 조건 선택시 버튼 색상 변화
// 최신순, 평점순 
   let btn5 = document.getElementById("newOrder");
   let btn6 = document.getElementById("gradeOrder");
			
   btn5.addEventListener("click", function() {
	    if(btn5.style.background === "rgb(83, 220, 152)"){
	       btn5.style.background = "rgb(0, 200, 83)";
 } else if(btn5.style.background === "rgb(0, 200, 83)") {
 		   btn5.style.background = "rgb(83, 220, 152)";
 } else { btn5.style.background = "rgb(0, 200, 83)"; }
   });


   btn6.addEventListener("click", function() {
		if(btn6.style.background === "rgb(83, 220, 152)"){
		   btn6.style.background = "rgb(0, 200, 83)";
 } else if(btn6.style.background === "rgb(0, 200, 83)") {
		   btn6.style.background = "rgb(83, 220, 152)";
 } else { btn6.style.background = "rgb(0, 200, 83)"; }
   });	 


// 원하는 조건 선택시 버튼 색상 변화
// 지역 

	let area1 = document.getElementById("area_btn1");
	let area2 = document.getElementById("area_btn2");
	let area3 = document.getElementById("area_btn3");
	let area4 = document.getElementById("area_btn4");
	let area5 = document.getElementById("area_btn5");
	let area6 = document.getElementById("area_btn6");
	let area7 = document.getElementById("area_btn7");
	let area8 = document.getElementById("area_btn8");
	let area9 = document.getElementById("area_btn9");
	let area10 = document.getElementById("area_btn10");

	area1.addEventListener("click", function() {
	if (area1.style.background === "white") {
		area1.style.background = "rgb(0, 200, 83)";
		area1.style.color = "white";
	} else if (area1.style.background === "rgb(0, 200, 83)") {
		area1.style.background = "white";
		area1.style.color = "#5E5E5E";
	} else {
		area1.style.background = "rgb(0, 200, 83)";
		area1.style.color = "white";
	}
});
			
	area2.addEventListener("click", function() {
	if (area2.style.background === "white") {
		area2.style.background = "rgb(0, 200, 83)";
		area2.style.color = "white";
	} else if (area2.style.background === "rgb(0, 200, 83)") {
		area2.style.background = "white";
		area2.style.color = "#5E5E5E";
	} else {
		area2.style.background = "rgb(0, 200, 83)";
		area2.style.color = "white";
	}
});
			
	area3.addEventListener("click", function() {
	if (area3.style.background === "white") {
		area3.style.background = "rgb(0, 200, 83)";
		area3.style.color = "white";
	} else if (area3.style.background === "rgb(0, 200, 83)") {
		area3.style.background = "white";
		area3.style.color = "#5E5E5E";
	} else {
		area3.style.background = "rgb(0, 200, 83)";
		area3.style.color = "white";
	}
});
			
	area4.addEventListener("click", function() {
	if (area4.style.background === "white") {
		area4.style.background = "rgb(0, 200, 83)";
		area4.style.color = "white";
	} else if (area4.style.background === "rgb(0, 200, 83)") {
		area4.style.background = "white";
		area4.style.color = "#5E5E5E";
	} else {
		area4.style.background = "rgb(0, 200, 83)";
		area4.style.color = "white";
	}
});
			
	area5.addEventListener("click", function() {
	if (area5.style.background === "white") {
		area5.style.background = "rgb(0, 200, 83)";
		area5.style.color = "white";
	} else if (area5.style.background === "rgb(0, 200, 83)") {
		area5.style.background = "white";
		area5.style.color = "#5E5E5E";
	} else {
		area5.style.background = "rgb(0, 200, 83)";
		area5.style.color = "white";
	}
});
			
	area6.addEventListener("click", function() {
	if (area6.style.background === "white") {
		area6.style.background = "rgb(0, 200, 83)";
		area6.style.color = "white";
	} else if (area6.style.background === "rgb(0, 200, 83)") {
		area6.style.background = "white";
		area6.style.color = "#5E5E5E";
	} else {
		area6.style.background = "rgb(0, 200, 83)";
		area6.style.color = "white";
	}
});
			
	area7.addEventListener("click", function() {
	if (area7.style.background === "white") {
		area7.style.background = "rgb(0, 200, 83)";
		area7.style.color = "white";
	} else if (area7.style.background === "rgb(0, 200, 83)") {
		area7.style.background = "white";
		area7.style.color = "#5E5E5E";
	} else {
		area7.style.background = "rgb(0, 200, 83)";
		area7.style.color = "white";
	}
});
			
	area8.addEventListener("click", function() {
	if (area8.style.background === "white") {
		area8.style.background = "rgb(0, 200, 83)";
		area8.style.color = "white";
	} else if (area8.style.background === "rgb(0, 200, 83)") {
		area8.style.background = "white";
		area8.style.color = "#5E5E5E";
	} else {
		area8.style.background = "rgb(0, 200, 83)";
		area8.style.color = "white";
	}
});
			
	area9.addEventListener("click", function() {
	if (area9.style.background === "white") {
		area9.style.background = "rgb(0, 200, 83)";
		area9.style.color = "white";
	} else if (area9.style.background === "rgb(0, 200, 83)") {
		area9.style.background = "white";
		area9.style.color = "#5E5E5E";
	} else {
		area9.style.background = "rgb(0, 200, 83)";
		area9.style.color = "white";
	}
});
			
	area10.addEventListener("click", function() {
	if (area10.style.background === "white") {
		area10.style.background = "rgb(0, 200, 83)";
		area10.style.color = "white";
	} else if (area10.style.background === "rgb(0, 200, 83)") {
		area10.style.background = "white";
		area10.style.color = "#5E5E5E";
	} else {
		area10.style.background = "rgb(0, 200, 83)";
		area10.style.color = "white";
	}
});
			
			
// 버튼 클릭시 데이터
$(function() {
      let service_list = new Array();
      $("#custom_btn1").click(function() {
         let service_item1 = $("#custom_btn1").val();
         if(service_list.includes("픽업")) {
            const index1 = service_list.indexOf("픽업");
            service_list.splice(index1, 1);
            console.log(service_list);
         } else {
            service_list.push(service_item1);
            console.log(service_list);
         }
      });
      $("#custom_btn2").click(function() {
         let service_item2 = $("#custom_btn2").val();
         if(service_list.includes("대형견")) {
            const index2 = service_list.indexOf("대형견");
            service_list.splice(index2, 1);
            console.log(service_list);
         } else {
            service_list.push(service_item2);
            console.log(service_list);
         }
      });
      $("#custom_btn3").click(function() {
         let service_item3 = $("#custom_btn3").val();
         if(service_list.includes("마당")) {
            const index3 = service_list.indexOf("마당");
            service_list.splice(index3, 1);
            console.log(service_list);
         } else {
            service_list.push(service_item3);
            console.log(service_list);
         }
      });
      $("#custom_btn4").click(function() {
         let service_item4 = $("#custom_btn4").val();
         if(service_list.includes("노견")) {
            const index4 = service_list.indexOf("노견");
            service_list.splice(index4, 1);
            console.log(service_list);
         } else {
            service_list.push(service_item4);
            console.log(service_list);
         }
      });
   });




//<!-- 버튼 클릭시 value값 변경 -->
//<!-- 원하는 조건 -->
$(function() {
  $('#custom_btn1').click( function() {
    if( $(this).val() == '픽업' ) {
      $(this).val('픽업 OK!');
    }
    else {
      $(this).val('픽업');
    } 
  });
});

$(function() {
	  $('#custom_btn2').click( function() {
	    if( $(this).val() == '대형견' ) {
	      $(this).val('대형견 OK!');
	    }
	    else {
	      $(this).val('대형견');
	    } 
	  });
	});
	
$(function() {
	  $('#custom_btn3').click( function() {
	    if( $(this).val() == '마당' ) {
	      $(this).val('마당 OK!');
	    }
 	    else {
	      $(this).val('마당');
	    } 
	  });
	});
	
$(function() {
	  $('#custom_btn4').click( function() {
	    if( $(this).val() == '노견' ) {
	      $(this).val('노견 OK!');
	    }
 	    else {
	      $(this).val('노견');
	    } 
	  });
	});	

//<!-- 지역별 -->
$(function() {
	$('#area_btn1').click( function() {
	  if( $(this).val() == '서울/경기' ) {
		  $(this).val('서울/경기 ');
	  }
	  else {
		  $(this).val('서울/경기')
	  }
	});	
  });
$(function() {
	$('#area_btn2').click( function() {
	  if( $(this).val() == '인천/부천' ) {
		  $(this).val('인천/부천 ');
	  }
	  else {
		  $(this).val('인천/부천')
	  }
	});	
  });
$(function() {
	$('#area_btn3').click( function() {
	  if( $(this).val() == '춘천/강원' ) {
		  $(this).val('춘천/강원 ');
	  }
	  else {
		  $(this).val('춘천/강원')
	  }
	});	
  });
$(function() {
	$('#area_btn4').click( function() {
	  if( $(this).val() == '부산/울산/경남' ) {
		  $(this).val('부산/울산/경남 ');
	  }
	  else {
		  $(this).val('부산/울산/경남')
	  }
	});	
  });
$(function() {
	$('#area_btn5').click( function() {
	  if( $(this).val() == '대구/경북' ) {
		  $(this).val('대구/경북 ');
	  }
	  else {
		  $(this).val('대구/경북')
	  }
	});	
  });
$(function() {
	$('#area_btn6').click( function() {
	  if( $(this).val() == '전주/전북' ) {
		  $(this).val('전주/전북 ');
	  }
	  else {
		  $(this).val('전주/전북')
	  }
	});	
  });
$(function() {
	$('#area_btn7').click( function() {
	  if( $(this).val() == '광주/전남' ) {
		  $(this).val('광주/전남 ');
	  }
	  else {
		  $(this).val('광주/전남')
	  }
	});	
  });
$(function() {
	$('#area_btn8').click( function() {
	  if( $(this).val() == '청주/충북' ) {
		  $(this).val('청주/충북 ');
	  }
	  else {
		  $(this).val('청주/충북')
	  }
	});	
  });
$(function() {
	$('#area_btn9').click( function() {
	  if( $(this).val() == '대전/충남' ) {
		  $(this).val('대전/충남 ');
	  }
	  else {
		  $(this).val('대전/충남')
	  }
	});	
  });
$(function() {
	$('#area_btn10').click( function() {
	  if( $(this).val() == '제주' ) {
		  $(this).val('제주 ');
	  }
	  else {
		  $(this).val('제주')
	  }
	});	
  });

