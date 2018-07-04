package com.kh.hamo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.hamo.service.ClubAdminService;

@Controller
public class ClubAdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ClubAdminService service;
	
	
	
}
