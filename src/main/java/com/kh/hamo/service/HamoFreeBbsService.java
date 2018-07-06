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

import com.kh.hamo.dao.HamoFreeBbsInter;
import com.kh.hamo.dto.HamoBbsDTO;

@Service
public class HamoFreeBbsService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    HamoFreeBbsInter inter;
    
    //자유게시판 글 리스트 조회
	public void freeBbsList(Model model) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		ArrayList<HamoBbsDTO> freeList = inter.freeBbsList();
		model.addAttribute("freeList", freeList);
	}
	//자유게시판 글 상세보기 
	public void freeBbsdetail(String idx, int flag, Model model) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		logger.info("글 번호"+idx);
		if(flag==0) { //flag가 0인 경우에만 조회수 +1
			inter.freeBbsHit(idx);
		}
		HamoBbsDTO freeBbsdetail = inter.freeBbsdetail(idx);
		model.addAttribute("detail", freeBbsdetail);
	}
	//자유게시판 글 수정하기
	public void update(HashMap<String, String> map) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		String idx = map.get("idx");
		String content = map.get("content");
		int success = inter.freeBbsUpdate(idx,content);
		logger.info("글 수정 성공 여부 :  "+success); 

	}
	//자유게시판 글쓰기
	public void freeBbsWrite(HashMap<String, String> map) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		String subject =  map.get("subject");
		String content =  map.get("content");
		int success = inter.freeBbsWrite(subject,content);	
		logger.info("글쓰기 성공 여부: "+success);
	}
	//자유게시판 글삭제
	public void freeBbsWrite(String idx) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		int success = inter.freeBbsDelete(idx);
		logger.info("글쓰기 삭제 여부: "+success);
	}


}
