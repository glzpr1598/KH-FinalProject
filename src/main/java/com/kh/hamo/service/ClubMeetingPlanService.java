package com.kh.hamo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.ClubMeetingPlanInter;
import com.kh.hamo.dto.ClubMeetingDTO;

@Service
public class ClubMeetingPlanService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    ClubMeetingPlanInter inter;
    
    //모임 일정 리스트
	public HashMap<String, Object> clubMeetingList(String club_id, String member_id) {
		logger.info("모임 일정 리스트 서비스");
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		ArrayList<ClubMeetingDTO> clubMeetingList = inter.clubMeetingList(Integer.parseInt(club_id),member_id);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", clubMeetingList);
		return result;
		
		
	}
	// 동호회 정보(지역) 가져오기 서비스
	public ModelAndView clubLocation(Model model, String club_id, String member_id) {
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		String club_location = inter.clubLocation(club_id);
		int clubJoinCheck = inter.clubJoinCheck(club_id,member_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("club_location", club_location);
		mav.setViewName("c18");
		if(clubJoinCheck==0) {
			mav.setViewName("c18-error");
		}
		return mav;
	}
	//모임 일정 등록 
	public void clubMeetingWrite(HashMap<String, String> list) {
		logger.info("모임 일정 등록  서비스");
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		String club_id=  list.get("club_id");
		String member_id=list.get("member_id");
		String meetingPlan_subject =(String) list.get("subject");
		String meetingPlan_locationX = (String) list.get("locationX");
		String meetingPlan_locationY= (String) list.get("locationY");
		String meetingPlan_when = (String) list.get("day");
		String meetingPlan_money = (String) list.get("money");
		String meetingPlan_content = (String) list.get("content");
		
		int meetingCount = inter.clubMeetingCount(club_id);
		if(meetingCount == 0) {
			inter.clubMeetingWriteFirst(Integer.parseInt(club_id),member_id,meetingPlan_subject,meetingPlan_locationX,meetingPlan_locationY,
					meetingPlan_when,meetingPlan_money,meetingPlan_content);
		} else {
			inter.clubMeetingWrite(Integer.parseInt(club_id),member_id,meetingPlan_subject,meetingPlan_locationX,meetingPlan_locationY,
					meetingPlan_when,meetingPlan_money,meetingPlan_content);
		}
	}
	
	//모임 일정 상세보기 
	public ModelAndView clubMeetingDetail(String meetingPlan_id, String club_id, String member_id) {
		logger.info("모임 일정 상세보기  서비스");
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		ClubMeetingDTO dto = new ClubMeetingDTO();
		dto= inter.clubMeetingDetail(Integer.parseInt(meetingPlan_id));
		int clubJoinCheck = inter.clubJoinCheck(club_id,member_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",dto);
		mav.setViewName("c19");
		if(clubJoinCheck==0) {
			mav.setViewName("c18-error");
		}
		return mav;
	}
	//모임 참석자 리스트
	public HashMap<String, Object> meetingAttendList(String meetingPlan_id, String club_id, String member_id) {
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		ArrayList<String> attend= inter.meetingAttendList(Integer.parseInt(meetingPlan_id),Integer.parseInt(club_id));
		int btn =inter.meetingAttendBtn(member_id,Integer.parseInt(meetingPlan_id));
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", attend);
		result.put("btn", btn);
		return result;
	}
	//모임 참석
	public HashMap<String, Object> meetingAttend(String member_id, String meetingPlan_id) {
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		int success =inter.meetingAttend(member_id,Integer.parseInt(meetingPlan_id));
		HashMap<String , Object> map = new HashMap<String , Object>();
		map.put("list", success);
		logger.info("참석 성공 : "+success);
		return map;
	}
	//모임 참석취소
	public HashMap<String, Object> meetingAttendCancel(String member_id, String meetingPlan_id) {
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		int success =inter.meetingAttendCancel(member_id,Integer.parseInt(meetingPlan_id));
		HashMap<String , Object> map = new HashMap<String , Object>();
		map.put("list", success);
		logger.info("참석 취소  성공 : "+success);
		return map;
	}
	//모임참석 댓글 등록
	public HashMap<String, Object> replyAdd(String meetingPlan_id, String member_id, String replyContent) {
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		if(replyContent.isEmpty()) {
			
		}else {
			int success = inter.replyAdd(Integer.parseInt(meetingPlan_id),member_id,replyContent);
			int replyCount = inter.replyCount(meetingPlan_id);
			HashMap<String , Object> map = new HashMap<String , Object>();
			map.put("list", success);
			map.put("replyCount",replyCount);
			return map;
		}
		return null;
		
	}
	//모임 댓글 리스트
	public HashMap<String, Object> replyList(String meetingPlan_id, String club_id) {
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		ArrayList<String> replyList= inter.replyList(Integer.parseInt(meetingPlan_id),Integer.parseInt(club_id));
		int replyCount = inter.replyCount(meetingPlan_id);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", replyList);
		result.put("replyCount",replyCount);
		return result;
	}
	//모임 댓글 삭제
	public HashMap<String, Object> replyDel(String meetingPlanReply_id, String member_id) {
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		int success = inter.replyDel(Integer.parseInt(meetingPlanReply_id),member_id);
		HashMap<String , Object> map = new HashMap<String , Object>();
		map.put("list", success);
		logger.info("삭제 : "+success);
		return map;
	}
	//모임 일정 수정 페이지 이동
	public ModelAndView clubMeetingUpdateForm(String meetingPlan_id, String member_id) {
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		ClubMeetingDTO dto = new ClubMeetingDTO();
		dto=  inter.clubMeetingUpdateForm(Integer.parseInt(meetingPlan_id),member_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",dto);
		mav.setViewName("c20");
		return mav;
	}
	//모임 일정 수정 
	public void clubMeetingUpdate(HashMap<String, String> list) {
		logger.info("모임 일정 수정  서비스");
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		String club_id=  list.get("club_id");
		String member_id=list.get("member_id");
		String meetingPlan_subject =(String) list.get("subject");
		String meetingPlan_locationX = (String) list.get("locationX");
		String meetingPlan_locationY= (String) list.get("locationY");
		String meetingPlan_when = (String) list.get("day");
		String meetingPlan_money = (String) list.get("money");
		String meetingPlan_content = (String) list.get("content");
		String meetingPlan_id=list.get("meetingPlan_id");
		
		int meetingCount = inter.clubMeetingUpdate(Integer.parseInt(club_id),member_id,Integer.parseInt(meetingPlan_id),meetingPlan_subject,meetingPlan_locationX,meetingPlan_locationY,
				meetingPlan_when,meetingPlan_money,meetingPlan_content);
		logger.info("수정 성공 :"+meetingCount);
	}
	//모임 일정 삭제
	public void clubMeetingDel(String meetingPlan_id, String member_id) {
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		int success = inter.clubMeetingDel(meetingPlan_id,member_id);
		logger.info("삭제 성공 :"+success);
	}

	

}
