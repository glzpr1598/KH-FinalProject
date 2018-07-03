package com.kh.hamo.dao;

import com.kh.hamo.dto.HamoMemberDTO;

public interface HamoMemberInter {

	int idOverlay(String id);

	int memberJoin(HamoMemberDTO memberdto);

	int memberSelect(String select);

	int memberInterest(String id, int select);

	
}
