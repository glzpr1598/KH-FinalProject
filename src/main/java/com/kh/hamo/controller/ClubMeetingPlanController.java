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
	public @ResponseBody HashMap<String, Object> clubMeetingList(@RequestParam String club_id ,@RequestParam String member_id) {
		logger.info("모임 일정 리스트 요청");
		return service.clubMeetingList(club_id,member_id);
	}
	//모임 일정 등록페이지 이동  
	@RequestMapping(value = "/clubMeetingWriteForm")
	public String clubMeetingWriteForm(Model model, @RequestParam String club_id) {
		logger.info("clubMeetingWriteForm 요청");
		// 동호회 정보(지역) 가져오기 서비스
		service.clubLocation(model, club_id);
		return "c18";
	}
	//모임 일정 등록 
	@RequestMapping(value = "/clubMeetingWrite")
	public String clubMeetingWrite(@RequestParam HashMap<String, String> list) {
		logger.info("clubMeetingWriteForm 요청");
		String club_id=  list.get("club_id");
		String member_id=list.get("member_id");
		System.out.println(member_id);
		service.clubMeetingWrite(list);
		return "redirect:/clubMeetingList?club_id="+club_id;
	}
	//모임 일정 상세보기 페이지 이동
	@RequestMapping(value = "/clubMeetingDetailForm")
	public String clubMeetingDetailForm() {
		logger.info("clubMeetingDetailForm 요청");
		return "c19";
	}
	//모임 일정 상세보기 
	@RequestMapping(value = "/clubMeetingDetail")
	public ModelAndView clubMeetingDetail(@RequestParam ("meetingPlan_id") String meetingPlan_id) {
		logger.info("clubMeetingDetail 요청");
		logger.info(meetingPlan_id);
		return service.clubMeetingDetail(meetingPlan_id);
	}
	//모임 참석자 리스트 
	@RequestMapping(value = "/meetingAttendList")
	public @ResponseBody HashMap<String, Object> meetingAttendList(@RequestParam ("meetingPlan_id") String meetingPlan_id,
			@RequestParam String club_id,@RequestParam ("member_id") String member_id) {
		logger.info("모임 참석자");
		return service.meetingAttendList(meetingPlan_id,club_id,member_id);
	}
	//모임 참석
	@RequestMapping(value = "/meetingAttend")
	public @ResponseBody HashMap<String, Object> meetingAttend(@RequestParam ("meetingPlan_id") String meetingPlan_id,@RequestParam ("member_id") String member_id,
			@RequestParam String club_id) {
		logger.info("모임 참석");
		return service.meetingAttend(member_id,meetingPlan_id);
	}
	//모임 참석 취소
	@RequestMapping(value = "/meetingAttendCancel")
	public @ResponseBody HashMap<String, Object> meetingAttendCancel(@RequestParam ("meetingPlan_id") String meetingPlan_id,@RequestParam ("member_id") String member_id,
			@RequestParam String club_id) {
		logger.info("모임 참석");
		return service.meetingAttendCancel(member_id,meetingPlan_id);
	}
	//모임참석 댓글 등록
		@RequestMapping(value = "/replyAdd")
		public @ResponseBody HashMap<String, Object> replyAdd(@RequestParam ("meetingPlan_id") String meetingPlan_id,@RequestParam ("member_id") String member_id,
				@RequestParam  ("replyContent") String replyContent) {
			logger.info("모임참석 댓글");
			logger.info(replyContent);
			logger.info(meetingPlan_id);
			return service.replyAdd(meetingPlan_id,member_id,replyContent);
		}
	//모임 댓글 리스트 
	@RequestMapping(value = "/replyList")
	public @ResponseBody HashMap<String, Object> replyList(@RequestParam ("meetingPlan_id") String meetingPlan_id,
			@RequestParam ("member_id") String member_id) {
		logger.info("모임 댓글 리스트");
		return service.replyList(meetingPlan_id,member_id);
	}
	//모임 댓글 삭제 
		@RequestMapping(value = "/replyDel")
		public @ResponseBody HashMap<String, Object> replyDel(@RequestParam ("meetingPlanReply_id") String meetingPlanReply_id,
				@RequestParam ("member_id") String member_id) {
			logger.info("모임 댓글 삭제 ");
			logger.info(meetingPlanReply_id);
			return service.replyDel(meetingPlanReply_id,member_id);
			
		}
	
}
