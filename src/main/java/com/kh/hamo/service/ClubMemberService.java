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
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.ClubMemberInter;
import com.kh.hamo.dto.ClubMemberDTO;
import com.kh.hamo.dto.HamoMainDTO;

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
		
		// 회장 아이디 가져오기
		String masterId = inter.clubMasterId(club_id);
		model.addAttribute("masterId", masterId);
	}
	
	// 회원 강퇴
	@Transactional
	public void clubMemberFire(String clubJoin_id, String club_id, String member_id) {
		inter = sqlSession.getMapper(ClubMemberInter.class);
		
		// clubjoin_id로 동호회 가입 컬럼 삭제
		inter.clubMemberFire(Integer.parseInt(clubJoin_id));
		
		// 블랙리스트 추가
		inter.clubMemberBlacklist(Integer.parseInt(club_id), member_id);
		
		// 회원수 업데이트
		inter.clubMemberCountUpdate(club_id);
		
	}
	
	// 회원 확인(동호회 가입 여부, 회장 여부, 동호회 폐쇄 여부)
	public HashMap<String, Object> memberCheck(String userId, String club_id) {
		inter = sqlSession.getMapper(ClubMemberInter.class);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int isMember = inter.memberCheck(userId, club_id);
		int isMaster = inter.masterCheck(userId, club_id);
		int isClose = inter.clubCloseCheck(club_id);
		
		result.put("isMember", isMember);
		result.put("isMaster", isMaster);
		result.put("isClose", isClose);
		
		return result;
	}
	/***********윤지현************/
	//동호회 소개글 가져오기
	public void club_introduce(String club_id,Model model) {
		inter = sqlSession.getMapper(ClubMemberInter.class);
		String introduce = inter.introduce(club_id);
		model.addAttribute("introduce", introduce);
		model.addAttribute("club_id", club_id);
	}
	
	//동호회 닉네임 체크
		public HashMap<String, Object> club_overLap( 
				String club_id , String nickName){
			inter = sqlSession.getMapper(ClubMemberInter.class);
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			// true 일 경우 중복 X -> 승인 O
			boolean success = true;
			ArrayList<String> nameList = new ArrayList<String>();
			nameList = inter.club_overLap(club_id);
			if(nameList.size()>0) {
				if(nameList.contains(nickName)) {
					success = false; //중복 O ->승인 X
				}
			}
			logger.info("승인 여부 : "+success);
			resultMap.put("success", success);
			return resultMap;
		}
		//동호회 가입하기
		public String clubJoin(HashMap<String, String> map) {
			logger.info("동호회 가입하기 서비스 요청");
			//동호회 가입 실패시 이동 할 페이지
			inter = sqlSession.getMapper(ClubMemberInter.class);
			String page = "redirect:/clubJoinForm";
			ClubMemberDTO dto = new ClubMemberDTO();
			dto.setClub_id(Integer.parseInt(map.get("club_id")));
			dto.setMember_id(map.get("member_id"));
			dto.setNickName(map.get("nickname"));
			int success = inter.clubJoin(map);
			if(success > 0 ) {
				logger.info("동호회 가입 성공");
				page = "redirect:/clubMain?club_id="+map.get("club_id");
			}
			return page;
		}

		public ModelAndView clubMemberOut(String member_id, String club_id) {
			logger.info("동호회 탈퇴하기 서비스 요청");
			inter = sqlSession.getMapper(ClubMemberInter.class);
			ModelAndView mav = new ModelAndView();
			
			//탈퇴하기 실패 시 경고창과 함께 다시 시도 		
			String page ="redirect:/clubOutForm?club_id=" + club_id;
			int success = inter.clubMemberOut(member_id,club_id);
			if(success > 0 ) {
				logger.info("탈퇴 성공!");
				page = "redirect:/clubMain?club_id="+club_id;
			}
			
			mav.setViewName(page);
			return mav;
			
		}
}
