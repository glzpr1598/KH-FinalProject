package com.kh.hamo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.hamo.service.ClubBbsService;
import com.kh.hamo.service.ClubFileService;

@Controller
public class ClubBbsController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ClubBbsService clubBbsService;
	@Autowired
	ClubFileService clubFileService;
	
	
	
}
