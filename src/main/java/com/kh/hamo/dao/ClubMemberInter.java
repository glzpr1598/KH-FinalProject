package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ClubMemberInter {
	
	// 특정 동호회의 멤버 리스트 가져오기
	ArrayList<HashMap<String, Object>> clubMemberList(int club_id);
	// 특정 동호회가입 아이디로 멤버 강퇴
	int clubMemberFire(int clubJoin_id);
	// 블랙리스트 추가
	int clubMemberBlacklist(int club_id, String member_id);

}
