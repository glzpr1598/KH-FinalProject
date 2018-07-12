package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ClubMemberInter {
	
	// 특정 동호회의 멤버 리스트 가져오기
	ArrayList<HashMap<String, Object>> clubMemberList(int club_id);
	// 회장 아이디 가져오기
	String clubMasterId(String club_id);
	// 특정 동호회가입 아이디로 멤버 강퇴
	int clubMemberFire(int clubJoin_id);
	// 블랙리스트 추가
	int clubMemberBlacklist(int club_id, String member_id);
	// 회원수 업데이트
	void clubMemberCountUpdate(String club_id);
	// 동호회 가입 여부 확인
	int memberCheck(String userId, String club_id);
	// 회장 여부 확인
	int masterCheck(String userId, String club_id);
	// 동호회 폐쇄 여부 확인
	int clubCloseCheck(String club_id);

}
