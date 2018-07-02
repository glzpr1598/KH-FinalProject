package com.kh.hamo.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		return "main";
	}
	@RequestMapping(value = "/m08move")
	public ModelAndView m08move(@RequestParam ("search") String search) {
		logger.info(search);
		return service.m08move(search);
	}
	@RequestMapping(value = "/totalClubSearch")
	public @ResponseBody HashMap<String, Object> totalClubSearch(@RequestParam HashMap<String, String> map) {
		logger.info("종합검색 요청");
		return service.totalClubSearch(map);
	}
	
	
}
