package com.kh.hamo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hamo.service.ClubMainService;

@Controller
public class ClubMainController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ClubMainService service;
	
	// 동호회 메인 페이지 이동
	@Transactional
	@RequestMapping(value = "/clubMain")
	public String clubMain(Model model, @RequestParam String club_id) {
		logger.info("동호회 메인 페이지 요청");
		
		// 동호회 사진, 소개글 전송
		service.clubMain(model, club_id);
		
		return "c01";
	}
	
	// 동호회 정보를 Ajax로 반환
	@RequestMapping(value = "/clubInfo")
	public @ResponseBody HashMap<String, Object> clubInfo(
			@RequestParam String club_id) {
		logger.info("동호회 정보 요청");
		
		return service.clubInfo(club_id);
	}
	
}
