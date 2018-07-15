package com.kh.hamo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.kh.hamo.dao.ClubMemberInter;
import com.kh.hamo.dao.HamoMemberInter;

@Service
public class ClubMemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    ClubMemberInter inter;

    // 회원 리스트
	public void clubMemberList(Model model, String club_id) {
		inter = sqlSession.getMapper(ClubMemberInter.class);
		
		// 특정 동호회의 멤버 리스트 가져오기
		ArrayList<HashMap<String, Object>> result = 
				inter.clubMemberList(Integer.parseInt(club_id));
		
		model.addAttribute("list", result);
	}
	
	// 회원 강퇴
	@Transactional
	public void clubMemberFire(String clubJoin_id, String club_id, String member_id) {
		inter = sqlSession.getMapper(ClubMemberInter.class);
		
		// clubjoin_id로 동호회 가입 컬럼 삭제
		inter.clubMemberFire(Integer.parseInt(clubJoin_id));
		
		// 블랙리스트 추가
		inter.clubMemberBlacklist(Integer.parseInt(club_id), member_id);
		
	}
	
	public HashMap<String, Object> memberCheck(String userId, String club_id) {
		inter = sqlSession.getMapper(ClubMemberInter.class);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int isMember = inter.memberCheck(userId, club_id);
		int isMaster = inter.masterCheck(userId, club_id);
		
		result.put("isMember", isMember);
		result.put("isMaster", isMaster);
		
		return result;
	}

}
