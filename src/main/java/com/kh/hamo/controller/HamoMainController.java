package com.kh.hamo.controller;

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
	
	@RequestMapping(value = "/")
	public String main() {
		logger.info("메인페이지 요청");
		
		return "index";
	}
	@RequestMapping(value = "/home")
	public String home(@RequestParam("smarteditor") String text) {
		logger.info("home 요청");
		logger.info("text: "+text);
		
		return "index";
	}
	@RequestMapping(value = "/totalClubSearch")
	public ModelAndView totalClubSearch(@RequestParam ("search") String search) {
		logger.info("종합검색 요청");
		logger.info("RequestParam : "+search);
		return service.totalClubSearch(search);
	}
}
