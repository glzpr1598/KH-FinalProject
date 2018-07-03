package com.kh.hamo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hamo.service.ClubMemberService;

@Controller
public class ClubMemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ClubMemberService service;
	
	@RequestMapping(value = "/clubMemberList")
	public String clubMemberList(Model model, @RequestParam("club_id") String club_id) {
		logger.info("동호회 멤버 리스트 요청");
		
		service.clubMemberList(model, club_id);
		
		return "c25";
	}
	
}
