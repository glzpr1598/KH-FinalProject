package com.kh.hamo.dao;

import java.util.ArrayList;

import com.kh.hamo.dto.HamoMemberDTO;

public interface HamoMemberInter {

	int idOverlay(String id);
	
	int emailOverlay(String email);

	int memberJoin(HamoMemberDTO memberdto);

	int memberSelect(String select);

	int memberInterest(String id, int select);

	boolean login(String userId, String userPw);

	String pwChk(String userId);

	String idSearch(String userName, String email);

	String pwSearch(String userId, String email);

	boolean pwUpdate(String id, String pw);

	HamoMemberDTO updateForm(String userId);

	ArrayList<Integer> updateFormInterest(String userId);

	String interest(int interest);

	int userUpdate(HamoMemberDTO memberdto);

	void interestDel(int interest);

	ArrayList<Integer> updateInterest(String id);

	int emailUpdate(String id, String email);



	

	
}
