package com.kh.hamo.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.ClubBbsInter;

@Service
public class ClubBbsService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    ClubBbsInter clubBbsInter = null;
    
	//공지사항 리스트
	public ModelAndView clubNoticeList(String member_id, int club_id,String sort) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		ModelAndView mav = new ModelAndView();
		logger.info("리스트 불러오기");
		mav.addObject("list", clubBbsInter.clubNoticeList(club_id, sort,member_id));
		mav.setViewName("c05");
		return mav;
	}

}
