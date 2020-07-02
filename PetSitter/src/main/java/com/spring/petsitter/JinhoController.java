package com.spring.petsitter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class JinhoController {

	
	@RequestMapping(value = "foster_view.me", method = RequestMethod.GET)
	public String foster_view() {
	
		return "foster_view";
	}
	
	@RequestMapping(value = "call_view.me", method = RequestMethod.GET)
	public String call_view() {
				
		return "call_view";
	}
	
	@RequestMapping(value = "postscript_board.me", method = RequestMethod.GET)
	public String postscript_board() {
				
		return "postscript_board";
	}	
}
