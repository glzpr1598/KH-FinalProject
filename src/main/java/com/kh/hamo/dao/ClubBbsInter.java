package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.ClubBbsDTO;

public interface ClubBbsInter {
	
	//회장 닉네임 찾기
	String findMaster(HashMap<String, String> params);
	
	//공지사항 리스트
	ArrayList<ClubBbsDTO> clubNoticeList(int club_id, String sort);
	
	//조회수 올리기
	void clubBbsHit(String clubBbs_id);
	
	//공지사항 상세보기
	ClubBbsDTO clubNoticeDetail(String clubBbs_id);

}
