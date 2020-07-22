package com.spring.petsitter.pay;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.petsitter.MemberService;
import com.spring.petsitter.MemberVO;
import com.spring.petsitter.PetsitterService;
import com.spring.petsitter.PetsitterVO;
import com.spring.petsitter.UsinglistService;
import com.spring.petsitter.UsinglistVO;

@Controller
public class PayController {
	
	@Autowired
	PayService payService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	UsinglistService usinglistService;
	
	@Autowired
	PetsitterService petsitterService;
	
	@RequestMapping(value = "payinsert.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public void insertPay(PayVO payvo, HttpSession session) {
		try {
			payvo.setPAY_ID((String)session.getAttribute("id"));
			String[] pay_start_date = payvo.getSTART_DATE().split(",");
			String[] pay_end_date = payvo.getEND_DATE().split(",");
			payvo.setSTART_DATE(pay_start_date[0] + " " + pay_start_date[1]);
			payvo.setEND_DATE(pay_end_date[0] + " " + pay_end_date[1]);
			payService.insertPay(payvo);
			
			PetsitterVO petsitter = petsitterService.selectPetsitter(payvo.getPETSITTER_ID());
			String addr = petsitter.getPETSITTER_ADDRESS().split(",")[1].split(" ")[0] + " " + petsitter.getPETSITTER_ADDRESS().split(",")[1].split(" ")[1];
			
			UsinglistVO usinglist = new UsinglistVO();
			usinglist.setPETSITTER_ID(payvo.getPETSITTER_ID());
			usinglist.setMEMBER_ID(payvo.getPAY_ID());
			usinglist.setPETSITTER_ADDR(addr);
			usinglist.setSTRING_STARTDATE(payvo.getSTART_DATE());
			usinglist.setSTRING_ENDDATE(payvo.getEND_DATE());
			usinglist.setLIST_PRICE(payvo.getPAY_AMOUNT());
			usinglist.setLIST_TYPE(payvo.getPAY_TYPE());
			usinglist.setMERCHANT_UID(payvo.getMERCHANT_UID());
			int res = usinglistService.insertUsinglist(usinglist);
			if(res == 1) {
				System.out.println("등록 완료");
			} else {
				System.out.println("등록 실패");
			}
		} catch(Exception e) {
			System.out.println("결제에 실패했습니다.");
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "paycheck.br")
	public String payPage(PayVO payvo, Model model) {
		MemberVO member = memberService.selectMember(payvo.getPAY_ID());
		
		model.addAttribute("member", member);
		model.addAttribute("payvo", payvo);
		return "pay";
	}
	
	@RequestMapping(value = "payConfirm.br")
	public String payConfirm(@RequestParam(value = "mid") String merchant_uid, Model model) {
		PayVO payvo = payService.selectPay(merchant_uid);
		model.addAttribute("payvo", payvo);
		return "payConfirm";
	}
	
	@RequestMapping(value = "cancel.br")
	public String patCalcel(@RequestParam(value = "merchant_uid") String merchant_uid, Model model) {
		PayVO payvo = payService.selectPay(merchant_uid);
		model.addAttribute("payvo", payvo);
		return "payCancel";
	}
	
	@RequestMapping(value = "payCancel.br", method = RequestMethod.POST)
	@ResponseBody
	public String cancel(String merchant_uid) {
		System.out.println("merchant_uid=" + merchant_uid);
		PayCheck obj = new PayCheck();
		String token = obj.getImportToken();
		int res = obj.cancelPayment(token, merchant_uid);
		System.out.println("res=" + res);
		if (res == 1)
			return "Success";
		else
			return "Failure";
	}
	
	@RequestMapping(value = "payUpdate.br", method = RequestMethod.POST)
	@ResponseBody
	public void payUpdate(String merchant_uid) {
		payService.updatePay(merchant_uid);
	}
}
