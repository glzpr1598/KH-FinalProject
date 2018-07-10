package com.kh.hamo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.ClubBbsInter;
import com.kh.hamo.dto.ClubBbsDTO;

@Service
public class ClubBbsService {
	
	// 업로드 한 파일명을 저장 후 나중에 DB 에 추가
	//newFileName,oldFileName
	HashMap<String,String> fileList = new HashMap<String,String>();	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    ClubBbsInter clubBbsInter = null;
    
	//회장 아이디 찾기
	public HashMap<String, Object> findMaster(HashMap<String, String> params) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		String nick = clubBbsInter.findMaster(params);
		HashMap<String, Object> map = new HashMap<>();
		map.put("nick", nick);
		return map;
	}
    
	//공지사항 리스트
	public HashMap<String, Object> clubNoticeList(int club_id,String sort) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		logger.info("리스트 불러오기");
		ArrayList<ClubBbsDTO> list = clubBbsInter.clubNoticeList(club_id, sort);
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}
	
	//공지사항 상세보기
	@Transactional
	public ModelAndView clubNoticeDetail(HashMap<String, String> params) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		
		String clubBbs_id = params.get("clubBbs_id");
		
		//조회수 올리기
		clubBbsInter.clubBbsHit(clubBbs_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", clubBbsInter.clubNoticeDetail(clubBbs_id));
		mav.setViewName("c07");
		return mav;
	}


}
