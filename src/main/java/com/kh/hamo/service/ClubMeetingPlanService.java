package com.kh.hamo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public HashMap<String, Object> clubMeetingList(String club_id) {
		logger.info("종합검색 서비스 실행");
		inter = sqlSession.getMapper(ClubMeetingPlanInter.class);
		ArrayList<ClubMeetingDTO> clubMeetingList = inter.clubMeetingList(Integer.parseInt(club_id));
		HashMap<String, Object> result = new HashMap<>();
		result.put("list", clubMeetingList);
		return result;
		
		
	}

}
