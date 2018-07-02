package com.kh.hamo.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HamoMainController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@RequestMapping(value = "/i")
	public String home(Locale locale, Model model) {
		logger.info("메인페이지 요청");
		return "main";
	}
	@RequestMapping(value = "/totalClubSearch")
	public String totalClubSearch(Locale locale, Model model) {
		logger.info("종합검색 요청");
		return "main";
	}
}
