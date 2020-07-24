package com.spring.petsitter;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReservationController {
		
	@Autowired
	private PetsitterService petsitterService;
	
	@Autowired
	private PetService petService;
	
	// 위탁 돌봄 예약 페이지 이동
	@RequestMapping(value = "reservation1.br")
	public String reservation1() {
		
		return "reservation";
	}
	
	// 방문 돌봄 예약 페이지 이동
	@RequestMapping(value = "reservation2.br")
	public String reservation2() {
		
		return "reservation2";
	}
	
	// ajax와 맞춤조건을 이용한 펫시터목록 뿌려주기
	@RequestMapping(value = "getPetsitterList_We.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We( String btn1, String btn2, String btn3, String btn4, 
												  String btn_a, String btn_b, String btn_c, String btn_g, String btn_type)
	{
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
	
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);

			if(!petsitter.getPETSITTER_ADDRESS().equals("N")) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(!petsitter.getPETSITTER_SERVICE_LIST().equals("N")) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}

	@RequestMapping(value = "foster_view.me", method = RequestMethod.POST)
	public String foster_view(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		ArrayList<PetVO> list = petService.selectPet(id);
		model.addAttribute("list", list);
		return "foster_view";
	}

}
