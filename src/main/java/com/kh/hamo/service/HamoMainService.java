package com.kh.hamo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.HamoMainInter;
import com.kh.hamo.dto.HamoMainDTO;

@Service
public class HamoMainService {
	@Autowired SqlSession sqlSession;
	HamoMainInter inter =null;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	public ModelAndView m08move(String search) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search",search);
		mav.setViewName("m08");
		return mav;
	}
	public HashMap<String, Object> totalClubSearch(HashMap<String, String> map) {
		logger.info("종합검색 서비스 실행");
		inter = sqlSession.getMapper(HamoMainInter.class);
		ArrayList<HamoMainDTO> totalClubSearch = inter.totalClubSearch(map);
		HashMap<String, Object> result = new HashMap<>();
		result.put("list", totalClubSearch);
		return result;
	}

}
