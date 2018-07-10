package com.kh.hamo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.HamoMainInter;
import com.kh.hamo.dto.HamoMainDTO;

@Service
public class HamoMainService {
	@Autowired SqlSession sqlSession;
	HamoMainInter inter =null;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 검색 값 가져오는 서비스
	public ModelAndView m08move(String search) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search",search);
		mav.setViewName("m08");
		return mav;
	}
	// mo08move 에서 가져온 값을 보여주는 서비스
	public HashMap<String, Object> totalClubSearch(HashMap<String, String> map) {
		logger.info("종합검색 서비스 실행");
		inter = sqlSession.getMapper(HamoMainInter.class);
		ArrayList<HamoMainDTO> totalClubSearch = inter.totalClubSearch(map);
		HashMap<String, Object> result = new HashMap<>();
		result.put("list", totalClubSearch);
		return result;
	}
	//설립한 동호회 리스트
	public HashMap<String, Object> myClubList(String id) {
		logger.info("설립한 동호회 리스트 서비스 실행 : "+id);
		inter = sqlSession.getMapper(HamoMainInter.class);
		ArrayList<HamoMainDTO> myClubList = inter.myClubList(id);
		HashMap<String, Object> result = new HashMap<>();
		result.put("myClubList", myClubList);
		return result;
	}
	//가입한 동호회 리스트
	public HashMap<String, Object> myClubJoin(String id) {
		logger.info("가입한 동호회 리스트 서비스 실행 : "+id);
		inter = sqlSession.getMapper(HamoMainInter.class);
		ArrayList<HamoMainDTO> myClubJoin = inter.myClubJoin(id);
		System.out.println(myClubJoin.get(0).getClub_date());
		HashMap<String, Object> result = new HashMap<>();
		result.put("myClubJoin", myClubJoin);
		return result;
	}
	//가입한 동호회 탈퇴
	public ModelAndView myClubRemove(String myClubRemove) {
		inter = sqlSession.getMapper(HamoMainInter.class);
		int success = inter.myClubDel(myClubRemove);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("m09");
		return mav;
	}
	//동호회 찾기
	public HashMap<String, Object> clubSearch(HashMap<String, String> map) {
		logger.info("동호회 찾기 서비스 실행");
		System.out.println(map.get("interest"));
		inter = sqlSession.getMapper(HamoMainInter.class);
		ArrayList<HamoMainDTO> clubSearch = inter.clubSearch(map);
		HashMap<String, Object> result = new HashMap<>();
		result.put("list", clubSearch);
		return result;
	}
}
