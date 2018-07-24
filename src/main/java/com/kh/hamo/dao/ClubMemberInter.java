package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.ClubMemberDTO;

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
	
	/*******윤지현******/
	//동호회 소개글 가져오기
	String introduce(String club_id);
	
	//닉네임 중복 여부 확인
	ArrayList<String> club_overLap(String club_id);
	
	//동호회 가입 
	int clubJoin(HashMap<String, String> map);
	
	//동호회 블랙리스트 명단
	ArrayList<String> blackList(String club_id); 
	
	//동호회 가입 성공 시 회원 수 증가
	int memberCountUp(String club_id); 

	//동호회 탈퇴
	int clubMemberOut(String member_id, String club_id);
	//동호회 가입 성공 시 회원 수 감소
	int memberCountDown(String club_id);
	
	
	
	
}
