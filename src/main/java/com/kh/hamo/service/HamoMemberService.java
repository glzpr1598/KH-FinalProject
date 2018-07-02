package com.kh.hamo.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.kh.hamo.dao.HamoMemberInter;

@Service
public class HamoMemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
	HamoMemberInter inter = null;

	
	
	public ModelAndView idOverlay(String id) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(HamoMemberInter.class);
		inter.idOverlay(id);
		return null;
	}
}
