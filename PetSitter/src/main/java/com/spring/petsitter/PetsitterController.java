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

import com.spring.petsitter.board.ReviewBoardVO;

@Controller
public class PetsitterController {

	@Autowired
	private PetsitterService petsitterService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private PUsinglistService usinglistService;
	
	@RequestMapping(value = "reflyUpdate.me")
	public String reflyUpdate(HttpSession session,ReviewBoardVO vo) {
		String id = (String)session.getAttribute("id");
		vo.setPETSITTER_ID(id);
		int res = petsitterService.reflyUpdate(vo);
		if(res == 1) {
			System.out.println("리뷰 답변 작성성공");
		}else {
			System.out.println("리뷰 답변 작성실패");
		}
		return "redirect:/petsitterinfo.me";
	}
	
	@RequestMapping(value = "petsitterUpdate.me")
	public String petsitterUpdate(PetsitterUpdateVO vo) {
		PetsitterVO petsitter = new PetsitterVO();
		petsitter.setPETSITTER_ID(vo.getPETSITTER_ID()); 
		petsitter = petsitterService.selectPetsitter(petsitter);
		String uploadPath = "C:\\Project156\\upload\\";
		
		
		
		MultipartFile mf = vo.getPhoto();
		if(mf.getSize() != 0) {
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
			//mf.transferTo(new File(uploadPath+storedFileName));
			petsitter.setPETSITTER_PHOTO_UPFILE(storedFileName);
		}
		
		mf = vo.getProfile();
		if(mf.getSize() != 0) {
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
			//mf.transferTo(new File(uploadPath+storedFileName));
			petsitter.setPETSITTER_PHOTO_PROFILE_FILE(storedFileName);
		}
		
		String CertState="";
		String CertNames = "";
		for(int i = 0; i < 3; i++) {
			if(vo.getCertState()[i].equals("파일선택")) {
				break;
			}else if(vo.getCertState()[i].equals("파일변경")) {
				CertState += petsitter.getPETSITTER_PHOTO_CERT_FILE().split(",")[i]+",";
				CertNames += petsitter.getPETSITTER_CERT_LIST().split(",")[i]+",";
			}else {
				mf = vo.getCertFile()[i];
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
				//mf.transferTo(new File(uploadPath+storedFileName));
				CertState += storedFileName+",";
				CertNames += vo.getCertName()[i]+",";
			}
		}
		
		if(!CertState.equals("")) {
			if(CertState.substring(CertState.length()-1, CertState.length()).equals(",")) {
				CertState = CertState.substring(0,CertState.length()-1);
			}
			petsitter.setPETSITTER_PHOTO_CERT_FILE(CertState);
		}else {
			petsitter.setPETSITTER_PHOTO_CERT_FILE("N");
		}
		
		if(!CertNames.equals("")) {
			if(CertNames.substring(CertNames.length()-1, CertNames.length()).equals(",")) {
				CertNames = CertNames.substring(0,CertNames.length()-1);
			}
			petsitter.setPETSITTER_CERT_LIST(CertNames);
		}else {
			petsitter.setPETSITTER_CERT_LIST("N");
		}
		
		String homeState="";
		for(int i = 0; i < 3; i++) {
			if(vo.getHomeState()[i].equals("파일선택")) {
				break;
			}else if(vo.getHomeState()[i].equals("파일변경")) {
				homeState += petsitter.getPETSITTER_PHOTO_HOME_FILE().split(",")[i]+",";
			}else {
				mf = vo.getPhotoHome()[i];
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
				//mf.transferTo(new File(uploadPath+storedFileName));
				homeState += storedFileName+",";
			}
		}
		
		
		
		if(!homeState.equals("")) {
			if(homeState.substring(homeState.length()-1, homeState.length()).equals(",")) {
				homeState = homeState.substring(0,homeState.length()-1);
			}
			petsitter.setPETSITTER_PHOTO_HOME_FILE(homeState);
		}else {
			petsitter.setPETSITTER_PHOTO_HOME_FILE("N");
		}
		
		String appealState="";
		for(int i = 0; i < 3; i++) {
			if(vo.getAppealState()[i].equals("파일선택")) {
				break;
			}else if(vo.getAppealState()[i].equals("파일변경")) {
				appealState += petsitter.getPETSITTER_PHOTO_APPEAL().split(",")[i]+",";
			}else {
				mf = vo.getPhotoAppeal()[i];
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
				//mf.transferTo(new File(uploadPath+storedFileName));
				appealState += storedFileName+",";
			}
		}
		
		if(!appealState.equals("")) {
			if(appealState.substring(appealState.length()-1, appealState.length()).equals(",")) {
				appealState = appealState.substring(0,appealState.length()-1);
			}
			petsitter.setPETSITTER_PHOTO_APPEAL(appealState);
		}else {
			petsitter.setPETSITTER_PHOTO_APPEAL("N");
		}
		
		petsitter.setPETSITTER_PW(vo.getPw());
		petsitter.setPETSITTER_NICKNAME(vo.getNickname());
		String email = String.join("@",vo.getEmail());
		petsitter.setPETSITTER_EMAIL(email);
		petsitter.setPETSITTER_ADDRESS(vo.getAddress());
		petsitter.setPETSITTER_TEL(vo.getTel());
		String type = String.join(",", vo.getType());
		petsitter.setPETSITTER_TYPE(type);
		petsitter.setPETSITTER_PRICE_60M(vo.getPrice60m());
		petsitter.setPETSITTER_PRICE_30M(vo.getPrice30m());
		String service = String.join(",", vo.getServicelist());
		petsitter.setPETSITTER_SERVICE_LIST(service);
		petsitter.setPETSITTER_INTRODUCE(vo.getIntroduce());
		
		/*
		 * System.out.println("getPETSITTER_ID = "+petsitter.getPETSITTER_ID());
		 * System.out.println("getPETSITTER_NICKNAME = "+petsitter.getPETSITTER_NICKNAME())
		 * ; System.out.println("getPETSITTER_NAME = "+petsitter.getPETSITTER_NAME());
		 * System.out.println("getPETSITTER_PW = "+petsitter.getPETSITTER_PW());
		 * System.out.println("getPETSITTER_TEL = "+petsitter.getPETSITTER_TEL());
		 * System.out.println("getPETSITTER_EMAIL = "+petsitter.getPETSITTER_EMAIL());
		 * System.out.println("getPETSITTER_SCORE = "+petsitter.getPETSITTER_SCORE());
		 * System.out.println("getPETSITTER_COUNT = "+petsitter.getPETSITTER_COUNT());
		 * System.out.println("getPETSITTER_RANK = "+petsitter.getPETSITTER_RANK());
		 * System.out.println("getPETSITTER_ADDRESS = "+petsitter.getPETSITTER_ADDRESS());
		 * System.out.println("getPETSITTER_INTRODUCE = "+petsitter.getPETSITTER_INTRODUCE());
		 * System.out.println("getPETSITTER_PRICE_30M = "+petsitter.getPETSITTER_PRICE_30M());
		 * System.out.println("getPETSITTER_PRICE_60M = "+petsitter.getPETSITTER_PRICE_60M()); 
		 * System.out.println("getPETSITTER_SERVICE_LIST = "+petsitter.getPETSITTER_SERVICE_LIST());
		 * System.out.println("getPETSITTER_PHOTO_UPFILE = "+petsitter.getPETSITTER_PHOTO_UPFILE());
		 * System.out.println("getPETSITTER_PHOTO_PROFILE_FILE = "+petsitter.getPETSITTER_PHOTO_PROFILE_FILE());
		 * System.out.println("getPETSITTER_CERT_LIST = "+petsitter.getPETSITTER_CERT_LIST()); 
		 * System.out.println("getPETSITTER_PHOTO_CERT_FILE = "+petsitter.getPETSITTER_PHOTO_CERT_FILE());
		 * System.out.println("getPETSITTER_PHOTO_HOME_FILE = "+petsitter.getPETSITTER_PHOTO_HOME_FILE());
		 * System.out.println("getPETSITTER_DATE = "+petsitter.getPETSITTER_DATE());
		 * System.out.println("getPETSITTER_TYPE = "+petsitter.getPETSITTER_TYPE());
		 * System.out.println("getPETSITTER_REPORT = "+petsitter.getPETSITTER_REPORT());
		 * System.out.println("getPETSITTER_PHOTO_APPEAL = "+petsitter.getPETSITTER_PHOTO_APPEAL());
		 */
		int res = petsitterService.petsitterUpdate(petsitter);
		if(res == 1) {
			System.out.println("업데이트 성공");
		}else {
			System.out.println("업데이트 실패");
		}
		return "redirect:/petsitterinfo.me";
	}

	@RequestMapping(value = "petsitterSchedule.me")
	public String petsitterSchedule(PetsitterScheduleVO vo) {
		int res = petsitterService.petsitterSchedule(vo);
		if (res == 1) {
			System.out.println("스케줄 추가 성공");
		}
		return "redirect:/petsitterinfo.me";
	}

	@RequestMapping(value = "petsitterinfo.me")
	public String petsitterinfo(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		PetsitterVO petsitter = new PetsitterVO();
		petsitter.setPETSITTER_ID(id);
		PetsitterVO vo = new PetsitterVO();
		vo = petsitterService.selectPetsitter(petsitter);

		ArrayList<PetsitterUsinglistVO> list = new ArrayList<PetsitterUsinglistVO>();
		PUsinglistVO usinglist = new PUsinglistVO();
		usinglist.setPETSITTER_ID(id);
		list = usinglistService.petsitterSelectUsingList(usinglist);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return "petsitterinfo";

	}

	@RequestMapping(value = "member_info_list.me")
	public String memberInfo(PetsitterVO vo, Model model) {
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
		if (res == 1) {
			System.out.println("회원 거절 완료");
		}
		return "redirect:/admin_main.me";
	}

	@RequestMapping(value = "petsitter_approval.me")
	public String petsitterApproval(PetsitterVO vo) {
		int res = petsitterService.petsitterApproval(vo);
		if (res == 1) {
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
	public String apply_petsitter(Model model, PetsitterVO vo) {
		PetsitterVO petsitter = new PetsitterVO();
		petsitter = petsitterService.selectPetsitter(vo);
		model.addAttribute("petsitter", petsitter);
		return "apply_petsitter";
	}

	@RequestMapping(value = "petsitter_login.me")
	public String petsiiterLogin(PetsitterVO vo, HttpSession session) {
		int res = petsitterService.petsitterCheck(vo);
		vo = petsitterService.selectPetsitter(vo);
		if (res == 1) {
			session.setAttribute("id", vo.getPETSITTER_ID());
			session.setAttribute("name", vo.getPETSITTER_NAME());
			System.out.println("로그인 성공");

			return "home";
		} else {
			return "loginform";
		}
	}

	@RequestMapping(value = "petsitter_join.me")
	public String petsitter_join(PetsitterVO vo) throws Exception {
		vo.setPETSITTER_SERVICE_LIST("");
		vo.setPETSITTER_PHOTO_HOME_FILE("");
		vo.setPETSITTER_PHOTO_CERT_FILE("");
		vo.setPETSITTER_PHOTO_UPFILE("");
		vo.setPETSITTER_PHOTO_PROFILE_FILE("");
		vo.setPETSITTER_CERT_LIST("");

		MultipartFile mf = vo.getPETSITTER_PHOTO();
		String uploadPath = "C:\\Project156\\upload\\";

		if (mf.getSize() != 0) {
			String originalFileExtension1 = mf.getOriginalFilename()
					.substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName1 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension1;
			mf.transferTo(new File(uploadPath + storedFileName1));
			vo.setPETSITTER_PHOTO_UPFILE(storedFileName1);
		}

		mf = vo.getPETSITTER_PHOTO_PROFILE();

		if (mf.getSize() != 0) {
			String originalFileExtension2 = mf.getOriginalFilename()
					.substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName2 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension2;
			mf.transferTo(new File(uploadPath + storedFileName2));
			vo.setPETSITTER_PHOTO_PROFILE_FILE(storedFileName2);
		}

		ArrayList<String> CERT_PHOTO = new ArrayList<String>();
		for (int i = 0; i < vo.getPETSITTER_PHOTO_CERT().length; i++) {
			mf = vo.getPETSITTER_PHOTO_CERT()[i];
			System.out.println(mf.getOriginalFilename());
			if (mf.getSize() != 0) {
				String originalFileExtension3 = mf.getOriginalFilename()
						.substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName3 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension3;

				mf.transferTo(new File(uploadPath + storedFileName3));
				CERT_PHOTO.add(storedFileName3);
			}
		}
		vo.setPETSITTER_PHOTO_CERT_FILE(String.join(",", CERT_PHOTO));

		ArrayList<String> HOME_PHOTO = new ArrayList<String>();
		for (int i = 0; i < vo.getPETSITTER_PHOTO_HOME().length; i++) {
			mf = vo.getPETSITTER_PHOTO_HOME()[i];
			if (mf.getSize() != 0) {
				String originalFileExtension4 = mf.getOriginalFilename()
						.substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName4 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension4;

				mf.transferTo(new File(uploadPath + storedFileName4));
				HOME_PHOTO.add(storedFileName4);
			}
		}

		vo.setPETSITTER_PHOTO_HOME_FILE(String.join(",", HOME_PHOTO));

		ArrayList<String> CERT_LIST = new ArrayList<String>();
		for (int i = 0; i < vo.getPETSITTER_CERT().length; i++) {
			if (!(vo.getPETSITTER_CERT()[i].equals(""))) {
				CERT_LIST.add(vo.getPETSITTER_CERT()[i]);
			}
		}
		vo.setPETSITTER_CERT_LIST(String.join(",", CERT_LIST));

		if (vo.getPETSITTER_SERVICE() != null) {
			vo.setPETSITTER_SERVICE_LIST(String.join(",", vo.getPETSITTER_SERVICE()));
		} else {
			vo.setPETSITTER_SERVICE_LIST("N");
		}

		if (vo.getPETSITTER_TYPE_LIST() != null) {
			vo.setPETSITTER_TYPE(String.join(",", vo.getPETSITTER_TYPE_LIST()));
		} else {
			vo.setPETSITTER_TYPE("N");
		}

		System.out.println("ID = " + vo.getPETSITTER_ID());
		System.out.println("PW = " + vo.getPETSITTER_PW());
		System.out.println("TEL = " + vo.getPETSITTER_TEL());
		System.out.println("EMAIL = " + vo.getPETSITTER_EMAIL());
		System.out.println("ADDRESS = " + vo.getPETSITTER_ADDRESS());
		System.out.println("PRICE_30M = " + vo.getPETSITTER_PRICE_30M());
		System.out.println("PRICE_60M = " + vo.getPETSITTER_PRICE_60M());

		if (vo.getPETSITTER_PHOTO_HOME_FILE().equals("")) {
			vo.setPETSITTER_PHOTO_HOME_FILE("N");
		}
		if (vo.getPETSITTER_PHOTO_CERT_FILE().equals("")) {
			vo.setPETSITTER_PHOTO_CERT_FILE("N");
		}
		if (vo.getPETSITTER_CERT_LIST().equals("")) {
			vo.setPETSITTER_CERT_LIST("N");
		}
		if (vo.getPETSITTER_PRICE_30M().equals("")) {
			vo.setPETSITTER_PRICE_30M("N");
		}
		if (vo.getPETSITTER_PRICE_60M().equals("")) {
			vo.setPETSITTER_PRICE_60M("N");
		}
		if (vo.getPETSITTER_PHOTO_UPFILE().equals("")) {
			vo.setPETSITTER_PHOTO_UPFILE("N");
		}
		if (vo.getPETSITTER_PHOTO_PROFILE_FILE().equals("")) {
			vo.setPETSITTER_PHOTO_PROFILE_FILE("N");
		}
		System.out.println(vo.getPETSITTER_SERVICE_LIST());
		System.out.println(vo.getPETSITTER_PHOTO_HOME_FILE());
		System.out.println(vo.getPETSITTER_PHOTO_CERT_FILE());
		System.out.println(vo.getPETSITTER_CERT_LIST());
		System.out.println(vo.getPETSITTER_TYPE());

		int res = petsitterService.petsitterInsert(vo);

		if (res == 1) {
			System.out.println("회원가입 성공");
		}

		return "home";
	}
}
