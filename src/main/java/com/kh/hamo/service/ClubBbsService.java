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
    
    /*************************************공지사항***************************************/
    
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
	
	/*************************************댓글***************************************/
	
	//댓글 리스트
	public HashMap<String, Object> clubReplyList(String clubBbs_id) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		
		//댓글 수 조회
		ClubBbsDTO replyCount = clubBbsInter.findReply(clubBbs_id);
		logger.info("댓글 수"+replyCount.getClubBbs_replyCount());
		
		//리스트 조회
		ArrayList<ClubBbsDTO> list = clubBbsInter.clubReplyList(clubBbs_id);
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("replyCount", replyCount);
		return map;
	}
	
	//댓글 작성
	@Transactional
	public HashMap<String, Object> clubReply(HashMap<String, String> params, String member_id) {
		logger.info("게시글 댓글 작성 서비스 호출");
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		HashMap<String, Object> map = new HashMap<>();
		
		ClubBbsDTO dto = new ClubBbsDTO();
		dto.setClubBbsReply_content(params.get("replyContent"));
		dto.setClubBbs_id(Integer.parseInt(params.get("clubBbs_id")));
		dto.setMember_id(member_id);
		System.out.println("회원 아이디 : "+dto.getMember_id());
		
		//댓글 작성
		if(clubBbsInter.clubReply(dto) == 1) {
			//댓글 수 증가
			String clubBbs_id = params.get("clubBbs_id");
			clubBbsInter.replyUp(clubBbs_id);
			//리스트 reload
			ArrayList<ClubBbsDTO> list = clubBbsInter.clubReplyList(clubBbs_id);
			//댓글 수 조회
			ClubBbsDTO replyCount = clubBbsInter.findReply(clubBbs_id);
			map.put("list", list);
			map.put("replyCount", replyCount);
		}
		return map;
	}
	
	//댓글 삭제
	@Transactional
	public HashMap<String, Object> clubReplyDelete(String clubBbs_id, String clubBbsReply_id) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		//댓글 삭제
		clubBbsInter.replyDelete(clubBbsReply_id);
		//댓글 수 감소
		clubBbsInter.replyDown(clubBbs_id);
		//댓글 리스트 조회
		ArrayList<ClubBbsDTO> list = clubBbsInter.clubReplyList(clubBbs_id);
		//댓글 수 조회
		ClubBbsDTO replyCount = clubBbsInter.findReply(clubBbs_id);
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("replyCount", replyCount);
		return map;
	}


}
