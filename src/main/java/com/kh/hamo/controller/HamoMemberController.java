package com.kh.hamo.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hamo.service.HamoMainService;

@Controller
public class HamoMemberController {

	@Autowired
	HamoMainService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/logout")
	public String logout(Locale locale, Model model) {
		logger.info("로그아웃 요청");
		
		return "main";
	}
	
}
