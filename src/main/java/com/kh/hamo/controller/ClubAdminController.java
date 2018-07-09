package com.kh.hamo.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hamo.service.ClubAdminService;

@Controller
public class ClubAdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ClubAdminService service;
	
	// 폐쇄하기 페이지 이동
	@RequestMapping(value = "/clubCloseForm")
	public String clubCloseForm() {
		logger.info("폐쇄하기 페이지 요청");
		
		return "c26";
	}
	
	// 동호회 폐쇄 등록
	@RequestMapping(value = "/clubClose")
	public String clubClose(@RequestParam String club_id) {
		logger.info("동호회 폐쇄 등록 요청");
		
		// 폐쇄 테이블에 추가
		service.clubClose(club_id);
		
		return "c26-close";
	}
	
	// 동호회 폐쇄 검사
	@RequestMapping(value = "/clubCloseCheck")
	public @ResponseBody HashMap<String, Object> clubCloseCheck(
			@RequestParam String club_id) {
		logger.info("동호회 폐쇄 검사 요청");
		
		// 동호회 폐쇄 검사
		return service.clubCloseCheck(club_id);
	}
	
	// 동호회 폐쇄 알림창
	@RequestMapping(value = "/clubCloseAlert")
	public String clubCloseAlert() {
		logger.info("동호회 폐쇄 알림창 요청");
		return "c28";
	}
	
}
