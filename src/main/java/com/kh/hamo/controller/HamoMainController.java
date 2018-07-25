package com.kh.hamo.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	/**김응주 - 메인페이지에 동호회를 소개 (사진,소개글)*/
	@RequestMapping(value = "/")
	public ModelAndView main(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		logger.info("메인페이지에 동호회 소개");
		return service.home(userId);
	}
	
	// 검색 값 가져오는 컨트롤러
	@RequestMapping(value = "/m08move")
	public ModelAndView m08move(@RequestParam ("search") String search) {
		logger.info("검색 값 : "+search);
		return service.m08move(search);
	}
	
	// /m08move에서 가져온 값으로 리스트를 분류하는 기능
	@RequestMapping(value = "/totalClubSearch")
	public @ResponseBody HashMap<String, Object> totalClubSearch(@RequestParam HashMap<String, String> map) {
		logger.info("종합검색 요청");
		return service.totalClubSearch(map);
	}
	
	//내 동호회 페이지로 이동
	@RequestMapping(value = "/m09move")
	public String m09move(Model model) {
		logger.info("동호회페이지 이동");
		return "m09";
	}
	//설립한 동호회 리스트 
	@RequestMapping(value = "/myClubList")
	public @ResponseBody HashMap<String, Object> myClubList(@RequestParam String id) {
		logger.info("설립한 동회 리스트");
		return service.myClubList(id);
	}
	//가입한 동호회 리스트
	@RequestMapping(value = "/myClubJoin")
	public @ResponseBody HashMap<String, Object> myClubJoin(@RequestParam String id) {
		logger.info("설립한 동회 리스트");
		return service.myClubJoin(id);
	}
	//가입한 동호회 탈퇴
	@RequestMapping(value = "/myClubRemove")
	public ModelAndView myClubRemove(@RequestParam ("myClubRemove") String myClubRemove,@RequestParam String club_id) {
		logger.info("가입한 동호회 탈퇴 리스트");
		logger.info(myClubRemove);
		logger.info(club_id);
		return service.myClubRemove(myClubRemove,club_id);
	}
	//동호회 찾기 페이지 이동
	@RequestMapping(value = "/m10move")
	public String m10move(Model model) {
		logger.info("동호회 찾기 페이지 요청 ");
		return "m10";
	}
	//동호회 찾기
	@RequestMapping(value = "/clubSearch")
	public @ResponseBody HashMap<String, Object> clubSearch(@RequestParam HashMap<String, String> map) {
		logger.info("동호회 찾기 요청");
		System.out.println("interest : " + map.get("interest"));
		System.out.println("location : " + map.get("location"));
		return service.clubSearch(map);
	}
	// 테스트 페이지
	@RequestMapping(value = "/test")
	public String test() {
		logger.info("테스트 페이지 요청");
		return "test";
	}
	
	/***********************윤지현(동호회)*****************/
	
	// 동호회 만들기 페이지
	@RequestMapping(value = "/makeClubForm")
	public String makeClubForm() {
		logger.info("동호회 만들기 요청");
		return "m11";
	}
	
	// 동호회명 중복 여부 체크
	@RequestMapping(value = "/clubName_overLap")
	public @ResponseBody HashMap<String, Object> clubName_overLap(
			@RequestParam("club_name") String club_name) {
		logger.info("동호회명 중복 여부 체크");
		logger.info("요청한 동호회 명 : "+club_name);
		return service.clubName_overLap(club_name);
	}
	// 동호회 만들기 요청
	@RequestMapping(value = "/makeClub")
	public  ModelAndView makeClub(
			@RequestParam HashMap<String , String> map,HttpSession session) {
		logger.info("동호회명 만들기 요청");
		logger.info("선택한 주제 : "+map.get("interest2"));
		logger.info("선택한 지역 : "+map.get("location2"));
		logger.info("요청한 동호회명 : "+map.get("club_name"));
		logger.info("동호회 소개 : "+map.get("club_introduce"));
		logger.info("회장 닉네임 : "+map.get("club_masterNickname"));
		map.put("member_id",(String)session.getAttribute("userId"));
		return service.makeClub(map);
	}
	
	// 404에러 페이지
	@RequestMapping(value = "/error404")
	public String error404() {
		logger.info("404 에러페이지 요청");
		return "error-404";
	}

}