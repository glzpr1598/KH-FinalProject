package com.kh.hamo.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class HamoMainService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ModelAndView totalClubSearch(String search) {
		logger.info("종합검색 서비스 실행");
		ModelAndView mav = new ModelAndView();
		logger.info(search);
		return null;
	}

}
