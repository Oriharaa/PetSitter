package com.spring.petsitter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "notice.me")
	public String notice(Model model) {
		return "notice";
	}
	
	@RequestMapping(value = "profile.me")
	public ModelAndView profile(MemberVO vo, @RequestParam(value = "id") String id) {
		ModelAndView mv = new ModelAndView();
		MemberVO membervo = memberService.selectMember(id);
		mv.addObject("membervo", membervo);
		mv.setViewName("profile");
		return mv;
	}
	
	@RequestMapping(value = "reportlist.me")
	public String reportlist(Model model) {
		return "reportlist";
	}
	
	@RequestMapping(value = "write.me")
	public String write(Model model) {
		return "write";
	}
	
	
	@RequestMapping(value = "basicform.me")
	public String basicform(Model model) {

	
		return "basicform";
	}
	
	@RequestMapping(value = "home.me")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "loginform.me")
	public String loginform() {
		return "loginform";
	}
	
	@RequestMapping(value="member_login.me")
	public String memberLogin(MemberVO vo, HttpSession session) {
		int res = memberService.memberCheck(vo);
		MemberVO membervo = memberService.selectMember(vo.getMEMBER_ID());
		
		if(res == 1) {
			session.setAttribute("id", membervo.getMEMBER_ID());
			session.setAttribute("name", membervo.getMEMBER_NAME());
			session.setAttribute("rank", membervo.getMEMBER_RANK());
			return "home";
		}else {
			return "loginform";
		}
		
	}

	@RequestMapping(value = "updatemember.me")
	public String member_update(MemberVO vo, HttpServletResponse response) throws Exception {
		memberService.updateMember(vo.getMEMBER_ID());
		
		return "redirect:/profile.me";
	}
	
	@RequestMapping(value = "logout.me")
	public String member_logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.me";
	}
	
	@RequestMapping(value = "member_join.me")
	public String member_join(MemberVO vo) {
		int res = memberService.memberInsert(vo);
		if(res == 1) {
		}
		return "home";
	}
}
