package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.HamoMainDTO;

public interface HamoMainInter {

	ArrayList<HamoMainDTO> totalClubSearch(ArrayList<String> list);  //종합검색 

	ArrayList<HamoMainDTO> myClubList(String id);//설립한 동호회 리스트

	ArrayList<HamoMainDTO> myClubJoin(String id);//가입한 동호회 리스트

	int myClubDel(String myClubRemove);//가입한 동호회 탈퇴


	ArrayList<HamoMainDTO> home();

	String SearchPicture(int club_id);

	String SearchInterest(int interest_id);

	ArrayList<HamoMainDTO> clubSearch(HashMap<String, String> map);//동호회 찾기

	ArrayList<HamoMainDTO> interestTop3();

	String searchLocation(String userId);

	ArrayList<Integer> searchBest(String userId);

	ArrayList<HamoMainDTO> bestClub(String location, int best1, int best2, int best3);
	
	/****윤지현(동호회명 중복 여부 체크)*****/
	
	ArrayList<String> clubName_overLap(String club_name); //동호회명 중복 체크

	int interest_check(String interest); //관심사 id 리턴

	int makeClub(HamoMainDTO dto); //동호회 만들기 요청

	int insertMaster(HamoMainDTO dto); //회장 닉네임 동호회 회원 관리 테이블에 추가

	int memberCnt(String club_id);



}
