package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.HamoMainDTO;

public interface HamoMainInter {

	ArrayList<HamoMainDTO> totalClubSearch(HashMap<String, String> map);  //종합검색 

	ArrayList<HamoMainDTO> myClubList(String id);//설립한 동호회 리스트

	ArrayList<HamoMainDTO> myClubJoin(String id);//가입한 동호회 리스트

}
