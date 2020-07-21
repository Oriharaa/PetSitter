let date1 = document.getElementById("datePicker_start");
let date2 = document.getElementById("datePicker_end");

let hide1 = document.getElementById("hide1");
let hide2 = document.getElementById("hide2");

$(document).ready(function(){
	    $("#custom_rd2").change(function(){
	        if($("#custom_rd2").is(":checked"))
	        {
	        	date1.style.width = "330px";
	        	date2.style.display = "none";
	        	hide1.style.marginRight = '30px';
	        	hide2.style.display = "none";	
	        }
	    });
	    
	    $("#custom_rd1").change(function(){
	        if($("#custom_rd1").is(":checked"))
	        {
	        	date1.style.width = "152px";
	        	date2.style.display = "block";
	     
	        	hide2.style.display = "block";
	        	hide2.style.marginLeft = '-25px';
	        }
	    });
	});