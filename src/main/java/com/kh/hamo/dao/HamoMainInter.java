package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.HamoMainDTO;

public interface HamoMainInter {

	ArrayList<HamoMainDTO> totalClubSearch(HashMap<String, String> map);  //종합검색 

	ArrayList<HamoMainDTO> myClubList(String id);//설립한 동호회 리스트

	ArrayList<HamoMainDTO> myClubJoin(String id);//가입한 동호회 리스트

	int myClubDel(String myClubRemove);//가입한 동호회 탈퇴

<<<<<<< HEAD

=======
>>>>>>> 1ec034ef1525039cad711760c9d86624e1f0cf75
	ArrayList<HamoMainDTO> home();

	String SearchPicture(int club_id);

	String SearchInterest(int interest_id);
<<<<<<< HEAD

	ArrayList<HamoMainDTO> clubSearch(HashMap<String, String> map);//동호회 찾기

=======
	
	ArrayList<HamoMainDTO> clubSearch(HashMap<String, String> map);//동호회 찾기
>>>>>>> 1ec034ef1525039cad711760c9d86624e1f0cf75

}
