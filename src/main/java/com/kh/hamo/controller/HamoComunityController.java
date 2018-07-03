package com.kh.hamo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hamo.service.HamoFileService;
import com.kh.hamo.service.HamoFreeBbsService;
import com.kh.hamo.service.HamoFriendShipBbsService;

@Controller
public class HamoComunityController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	HamoFreeBbsService hamoFreeBbsService;
	@Autowired
	HamoFriendShipBbsService hamoFriendShipBbsService;
	@Autowired
	HamoFileService hamoFileService;
	
	@RequestMapping(value = "/freeBbsList")
	public String freeBbsList() {
		logger.info("자유게시판 리스트 요청");
		return "m12";
	}	
	@RequestMapping(value = "/freeBbsWriteForm")
	public String freeBbsWriteForm() {
		logger.info("글쓰기 폼  요청");
		return "m13";
	}
	// 글쓰기 버튼 누를 시 서버에 글쓰기 내용 전달하는 컨트롤러
	@RequestMapping(value = "/freeBbsWrite")
	public String freeBbsWrite(@RequestParam("smarteditor") String write) {
		logger.info("글쓰기 요청");
		logger.info("작성한 글: "+write);	
		return "main";
	}
	
}
