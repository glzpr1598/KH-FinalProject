package com.kh.hamo.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.HamoFreeBbsInter;

@Service
public class HamoFreeBbsService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    HamoFreeBbsInter inter;
    
    //자유게시판 글 리스트 조회
	public void freeBbsList() {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		HashMap<String, String> map = new HashMap<>();
		map = inter.freeBbsList();
	}

}
