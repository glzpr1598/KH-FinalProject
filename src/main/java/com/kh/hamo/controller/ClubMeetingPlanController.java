package com.kh.hamo.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.service.ClubMeetingPlanService;

@Controller
public class ClubMeetingPlanController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ClubMeetingPlanService service;
	
	//모임 일정 리스트 페이지 이동
	@RequestMapping(value = "/clubMeetingList")
	public String meetingMain() {
		logger.info("clubMeetingList 요청");
		return "c17";
	}
	//모임 일정 리스트
	@RequestMapping(value = "/MeetingList")
	public @ResponseBody HashMap<String, Object> clubMeetingList(@RequestParam String club_id) {
		logger.info("모임 일정 리스트 요청");
		return service.clubMeetingList(club_id);
	}
	//모임 일정 등록페이지 이동  
	@RequestMapping(value = "/clubMeetingWriteForm")
	public String clubMeetingWriteForm() {
		logger.info("clubMeetingWriteForm 요청");
		return "c18";
	}
	//모임 일정 등록 
	@RequestMapping(value = "/clubMeetingWrite")
	public String clubMeetingWrite(@RequestParam HashMap<String, String> list) {
		logger.info("clubMeetingWriteForm 요청");
		String club_id=  list.get("club_id");
		service.clubMeetingWrite(list);
		
		return "redirect:/clubMeetingList?club_id="+club_id;
	}
	//모임 일정 상세보기 페이지 이동
		@RequestMapping(value = "/clubMeetingDetailForm")
		public String clubMeetingDetailForm() {
			logger.info("clubMeetingDetailForm 요청");
			return "c19";
		}
}
