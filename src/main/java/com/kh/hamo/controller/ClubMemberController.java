package com.kh.hamo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.service.ClubMemberService;

@Controller
public class ClubMemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ClubMemberService service;
	
	// 동호회 회원관리(리스트)
	@RequestMapping(value = "/clubMemberList")
	public String clubMemberList(Model model, @RequestParam("club_id") String club_id) {
		logger.info("동호회 멤버 리스트 요청");
		
		service.clubMemberList(model, club_id);
		
		return "c25";
	}
	
	// 회원 강퇴
	@RequestMapping(value = "/clubMemberFire")
	public String clubMemberFire(Model model, 
			@RequestParam("clubJoin_id") String clubJoin_id,
			@RequestParam("club_id") String club_id,
			@RequestParam("member_id") String member_id) {
		logger.info("멤버 강퇴 요청");
		
		service.clubMemberFire(clubJoin_id, club_id, member_id);
		
		return "redirect:/clubMemberList?club_id="+club_id;
	}
	
	// 회원 확인(동호회 가입 여부, 회장 여부, 동호회 폐쇄 여부)
	@RequestMapping(value = "/memberCheck")
	public @ResponseBody HashMap<String, Object> memberCheck(
			@RequestParam String userId, String club_id) {
		logger.info("회원 확인 요청");

		return service.memberCheck(userId, club_id);
	}
	
	
	/******윤지현***********/
	
	// 동호회 가입하기 페이지 + 소개를 DB에 요청
	@RequestMapping(value = "/clubJoinForm")
	public String clubJoinForm(HttpSession session, 
			@RequestParam String club_id, Model model) {
		logger.info("동호회 가입하기 페이지 요청");
		
		//동호회 소개글 가져오기
		service.club_introduce(club_id,model);
		return "c23";
	}
	
	//동호회 닉네임 체크
	@RequestMapping(value = "/club_overLap")
	public @ResponseBody HashMap<String, Object> club_overLap(
			@RequestParam String club_id , String nickName ) {
		logger.info("동호회 닉네임 체크 요청");
		return service.club_overLap(club_id,nickName);
	}
	
	//동호회 가입하기
	@RequestMapping(value = "/clubJoin")
	public String clubJoin(HttpSession session, 
			@RequestParam HashMap<String, String> map) {
		logger.info("동호회 가입하기 페이지 요청");
		logger.info("닉네임 : "+map.get("nickname"));
		logger.info("동호회 ID :"+map.get("club_id"));
		map.put("member_id",(String)session.getAttribute("userId"));
		logger.info("회원 ID : "+map.get("member_id"));
		
		return 	service.clubJoin(map);
	}
	
	
	// 동호회 탈퇴하기 페이지
	@RequestMapping(value = "/clubOutForm")
	public String clubOutForm(@RequestParam String club_id,Model model) {
		logger.info("동호회 탈퇴 페이지 요청");
		model.addAttribute("club_id", club_id);
		return "c24";
	}
	
	// 동호회 탈퇴
	@RequestMapping(value="/clubMemberOut")
	public ModelAndView clubMemberOut(HttpSession session,
			@RequestParam("club_id") String club_id) {
		logger.info("동호회 탈퇴 요청");
		String member_id = (String)session.getAttribute("userId");
		
		return service.clubMemberOut(member_id,club_id) ;
	}
	
	
	

}
