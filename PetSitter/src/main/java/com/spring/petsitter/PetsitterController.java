package com.spring.petsitter;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class PetsitterController {

	@Autowired
	private PetsitterService petsitterService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "member_info_list.me")
	public String memberInfo(PetsitterVO vo,Model model) {
		ArrayList<PetsitterVO> petsitterList = new ArrayList<PetsitterVO>();
		petsitterList = petsitterService.petsitterList();
		model.addAttribute("petsitter_list", petsitterList);
		
		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
		memberList = memberService.memberList();
		model.addAttribute("member_list", memberList);
		
		return "admin/admin_member_info_list";
	}
	
	@RequestMapping(value = "petsitter_refusal.me")
	public String petsitterRefusal(PetsitterVO vo) {
		int res = petsitterService.petsitterRefusal(vo);
		if(res == 1) {
			System.out.println("회원 거절 완료");
		}
		return "redirect:/admin_main.me";
	}
	
	@RequestMapping(value = "petsitter_approval.me")
	public String petsitterApproval(PetsitterVO vo) {
		int res = petsitterService.petsitterApproval(vo);
		if(res == 1) {
			System.out.println("회원 승인 완료");
		}
		return "redirect:/admin_main.me";
	}
	@RequestMapping(value = "admin_main.me", method = RequestMethod.GET)
	public String admin_main(Model model) {
		ArrayList<PetsitterVO> petsitterList = new ArrayList<PetsitterVO>();
		petsitterList = petsitterService.petsitterList();
		model.addAttribute("petsitter_list", petsitterList);
		return "admin/admin_main";
	}
	
	@RequestMapping(value = "apply_petsitter.me", method = RequestMethod.GET)
	public String apply_petsitter(Model model,PetsitterVO vo) {
		PetsitterVO petsitter = new PetsitterVO();
		petsitter = petsitterService.selectPetsitter(vo.getPETSITTER_ID());
		model.addAttribute("petsitter", petsitter);
		return "apply_petsitter";
	}
	
	
	@RequestMapping(value = "petsitter_login.me")
	public String petsiiterLogin(PetsitterVO vo,HttpSession session) {
		int res = petsitterService.petsitterCheck(vo);
		
		if(res == 1) {
			session.setAttribute("id", vo.getPETSITTER_ID());
			System.out.println("로그인 성공");
			return "home";
		}else {
			return "loginform";
		}
	}
	
	@RequestMapping(value = "petsitter_join.me")
	public String petsitter_join(PetsitterVO vo) throws Exception{
		vo.setPETSITTER_SERVICE_LIST("");
		vo.setPETSITTER_PHOTO_HOME_FILE("");
		vo.setPETSITTER_PHOTO_CERT_FILE("");
		vo.setPETSITTER_PHOTO_UPFILE("");
		vo.setPETSITTER_PHOTO_PROFILE_FILE("");
		vo.setPETSITTER_CERT_LIST("");
		
		MultipartFile mf = vo.getPETSITTER_PHOTO();
		String uploadPath = "C:\\Project156\\upload\\";

		if(mf.getSize() != 0) {
			String originalFileExtension1 = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName1 = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension1;
			mf.transferTo(new File(uploadPath+storedFileName1));
			vo.setPETSITTER_PHOTO_UPFILE(storedFileName1);
		}

		
		mf = vo.getPETSITTER_PHOTO_PROFILE();
		
		
		if(mf.getSize() != 0) {
			String originalFileExtension2 = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName2 = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension2;
			mf.transferTo(new File(uploadPath+storedFileName2));
			vo.setPETSITTER_PHOTO_PROFILE_FILE(storedFileName2);
		}
		
		ArrayList<String> CERT_PHOTO = new ArrayList<String>();
		for(int i =0; i < vo.getPETSITTER_PHOTO_CERT().length;i++) {
			mf = vo.getPETSITTER_PHOTO_CERT()[i];
			System.out.println(mf.getOriginalFilename());
			if(mf.getSize() != 0) {
			String originalFileExtension3 = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName3 = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension3;
			
				mf.transferTo(new File(uploadPath+storedFileName3));
				CERT_PHOTO.add(storedFileName3);
			}
		}
		vo.setPETSITTER_PHOTO_CERT_FILE(String.join(",", CERT_PHOTO));
		
		
		ArrayList<String> HOME_PHOTO = new ArrayList<String>();
		for(int i =0; i < vo.getPETSITTER_PHOTO_HOME().length;i++) {
			mf = vo.getPETSITTER_PHOTO_HOME()[i];
			if(mf.getSize() != 0) {
			String originalFileExtension4 = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName4 = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension4;
			
				mf.transferTo(new File(uploadPath+storedFileName4));
				HOME_PHOTO.add(storedFileName4);
			}
		}
		vo.setPETSITTER_PHOTO_HOME_FILE(String.join(",", HOME_PHOTO));
		
		ArrayList<String> CERT_LIST = new ArrayList<String>();
		for(int i = 0; i < vo.getPETSITTER_CERT().length; i++) {
			if(!(vo.getPETSITTER_CERT()[i].equals(""))) {
				CERT_LIST.add(vo.getPETSITTER_CERT()[i]);
			}
		}
		vo.setPETSITTER_CERT_LIST(String.join(",",CERT_LIST));
		
		if(vo.getPETSITTER_SERVICE() != null) {
			vo.setPETSITTER_SERVICE_LIST(String.join(",", vo.getPETSITTER_SERVICE()));
		}else {
			vo.setPETSITTER_SERVICE_LIST("N");
		}
		
		
		if(vo.getPETSITTER_TYPE_LIST()!=null) {
			vo.setPETSITTER_TYPE(String.join(",", vo.getPETSITTER_TYPE_LIST()));
		}else {
			vo.setPETSITTER_TYPE("N");
		}
		
		System.out.println("ID = "+vo.getPETSITTER_ID());
		System.out.println("PW = "+vo.getPETSITTER_PW());
		System.out.println("TEL = "+vo.getPETSITTER_TEL());
		System.out.println("EMAIL = "+vo.getPETSITTER_EMAIL());
		System.out.println("ADDRESS = "+vo.getPETSITTER_ADDRESS());
		System.out.println("PRICE_12H = "+vo.getPETSITTER_PRICE_12H());
		System.out.println("PRICE_24H = "+vo.getPETSITTER_PRICE_24H());
		System.out.println("PRICE_30M = "+vo.getPETSITTER_PRICE_30M());
		System.out.println("PRICE_60M = "+vo.getPETSITTER_PRICE_60M());

		if(vo.getPETSITTER_PHOTO_HOME_FILE().equals("")) {
			vo.setPETSITTER_PHOTO_HOME_FILE("N");
		}
		if(vo.getPETSITTER_PHOTO_CERT_FILE().equals("")) {
			vo.setPETSITTER_PHOTO_CERT_FILE("N");
		}
		if(vo.getPETSITTER_CERT_LIST().equals("")) {
			vo.setPETSITTER_CERT_LIST("N");
		}
		if(vo.getPETSITTER_PRICE_12H().equals("")) {
			vo.setPETSITTER_PRICE_12H("N");
		}
		if(vo.getPETSITTER_PRICE_24H().equals("")) {
			vo.setPETSITTER_PRICE_24H("N");
		}
		if(vo.getPETSITTER_PRICE_30M().equals("")) {
			vo.setPETSITTER_PRICE_30M("N");
		}
		if(vo.getPETSITTER_PRICE_60M().equals("")) {
			vo.setPETSITTER_PRICE_60M("N");
		}
		if(vo.getPETSITTER_PHOTO_UPFILE().equals("")) {
			vo.setPETSITTER_PHOTO_UPFILE("N");
		}
		if(vo.getPETSITTER_PHOTO_PROFILE_FILE().equals("")) {
			vo.setPETSITTER_PHOTO_PROFILE_FILE("N");
		}
		System.out.println(vo.getPETSITTER_SERVICE_LIST());
		System.out.println(vo.getPETSITTER_PHOTO_HOME_FILE());
		System.out.println(vo.getPETSITTER_PHOTO_CERT_FILE());
		System.out.println(vo.getPETSITTER_CERT_LIST());
		System.out.println(vo.getPETSITTER_TYPE());
		
		int res = petsitterService.petsitterInsert(vo);
		
		if(res == 1) {
			System.out.println("회원가입 성공");
		}
		
		return "home";
	}
}
