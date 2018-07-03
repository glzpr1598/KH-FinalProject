package com.kh.hamo.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.service.HamoMemberService;

@Controller
public class HamoMemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	HamoMemberService service;
	
	/**로그인페이지이동 - 김응주 */	
	@RequestMapping(value="/login")
	public String login() {
		logger.info("로그인페이지이동");
		return "login";
	}
	
	/**회원가입페이지이동 - 김응주 */	
	@RequestMapping(value="/hamoJoin")
	public String hamoJoin() {
		logger.info("회원가입페이지이동");
		return "hamoJoin";
	}
	
	/**회원가입페 아이디 중복체크 - 김응주 */	
	@RequestMapping(value="/idOverlay")
	public ModelAndView idOverlay(@RequestParam String id) {
		logger.info("아이디중복검사");
		
		return service.idOverlay(id);
	}
	
	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃 요청");
		
		session.removeAttribute("userId");
		
		return "main";
	}
	
}
