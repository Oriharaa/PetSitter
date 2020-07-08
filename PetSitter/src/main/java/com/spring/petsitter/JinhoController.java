package com.spring.petsitter;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class JinhoController {

	@RequestMapping(value = "home.me", method = RequestMethod.GET)
	public String home( Model model) {
	
		return "home";
	}

	
	@RequestMapping(value = "foster_view.me", method = RequestMethod.GET)
	public String foster_view( Model model) {
	
		return "foster_view";
	}
	
	@RequestMapping(value = "call_view.me", method = RequestMethod.GET)
	public String call_view( Model model) {
				
		return "call_view";
	}
	
	@RequestMapping(value = "postscript_board.me", method = RequestMethod.GET)
	public String postscript_board( Model model) {
				
		return "board/review_board";
	}	
}
