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
	@RequestMapping(value = "/clubMeetingWriteForm")
	public String clubMeetingWriteForm() {
		logger.info("clubMeetingWriteForm 요청");
		return "c18";
	}
}
