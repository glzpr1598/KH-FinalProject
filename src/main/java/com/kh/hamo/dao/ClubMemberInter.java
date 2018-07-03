package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ClubMemberInter {
	
	// 특정 동호회의 멤버 리스트 가져오기
	ArrayList<HashMap<String, Object>> clubMemberList(int club_id);

}
