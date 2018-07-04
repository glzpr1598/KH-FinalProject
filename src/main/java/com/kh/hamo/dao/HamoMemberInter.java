package com.kh.hamo.dao;

import com.kh.hamo.dto.HamoMemberDTO;

public interface HamoMemberInter {

	int idOverlay(String id);

	int memberJoin(HamoMemberDTO memberdto);

	int memberSelect(String select);

	int memberInterest(String id, int select);

	boolean login(String userId, String userPw);

	String pwChk(String userId);

	
}
