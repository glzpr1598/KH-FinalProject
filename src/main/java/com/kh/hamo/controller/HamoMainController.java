package com.kh.hamo.controller;

import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.service.HamoMainService;

@Controller
public class HamoMainController {

	@Autowired
	HamoMainService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@RequestMapping(value = "/i")
	public String home(Locale locale, Model model) {
		logger.info("메인페이지 요청");
		return "main";
	}
	@RequestMapping(value = "/totalClubSearch")
	public ModelAndView totalClubSearch(@RequestParam ("search") String search) {
		logger.info("종합검색 요청");
		logger.info("RequestParam : "+search);
		return service.totalClubSearch(search);
	}
}
