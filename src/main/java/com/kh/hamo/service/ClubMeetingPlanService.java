package com.kh.hamo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.ClubMeetingPlanInter;
import com.kh.hamo.dao.HamoMainInter;
import com.kh.hamo.dto.ClubMeetingDTO;
import com.kh.hamo.dto.HamoMainDTO;

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
	public ModelAndView clubMeetingDetail(String meetingPlan_id) {
		logger.info("모임 일정 상세보기  서비스");
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		ClubMeetingDTO dto = new ClubMeetingDTO();
		dto= inter.clubMeetingDetail(Integer.parseInt(meetingPlan_id));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",dto);
		
		mav.setViewName("c19");
		return mav;
	}
	public HashMap<String, Object> meetingAttend(String meetingPlan_id, String club_id) {
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		ArrayList<String> attend= inter.meetingAttend(Integer.parseInt(meetingPlan_id),Integer.parseInt(club_id));
		HashMap<String, Object> result = new HashMap<String, Object>();
		System.out.println("++++++++++++++++++++++++++");
		System.out.println("서비스"+club_id);
		System.out.println("++++++++++++++++++++++++++");
		result.put("list", attend);
		
		return result;
	}

}
