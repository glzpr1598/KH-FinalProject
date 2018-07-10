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
	
	//공지사항 글쓰기
	//사진 업로드 에러 발생 시 글작성 X
	@Transactional
	public ModelAndView clubNoticeWrite(HashMap<String, String> params, String member_id) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/clubNoticeForm?club_id="+params.get("club_id");
		
		//최근 글번호 가져오기
		ArrayList<ClubBbsDTO> list = clubBbsInter.findIdx(params.get("club_id"));
		int clubBbs_idx = list.get(0).getClubBbs_idx() + 1;
		
		//파라미터 값 추출
		ClubBbsDTO dto = new ClubBbsDTO();
		dto.setMember_id(member_id);
		dto.setClubBbs_subject(params.get("subject"));
		dto.setClubBbs_content(params.get("editor"));
		dto.setClub_id(Integer.parseInt(params.get("club_id")));
		dto.setClubBbs_sort(params.get("sort"));
		dto.setClubBbs_idx(clubBbs_idx);
		
		if(clubBbsInter.clubNoticeWrite(dto) == 1) {
			page = "redirect:/clubNoticeDetail?club_id="+params.get("club_id")+"&clubBbs_id="+dto.getClubBbs_id();
		}
		mav.setViewName(page);
		return mav;
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
