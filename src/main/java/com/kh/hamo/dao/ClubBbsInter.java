package com.kh.hamo.dao;

import java.util.ArrayList;

import com.kh.hamo.dto.ClubBbsDTO;

public interface ClubBbsInter {
	
	//공지사항 리스트
	ArrayList<ClubBbsDTO> clubNoticeList(int club_id, String sort, String member_id);
	
	//글번호 가져오기
	ArrayList<ClubBbsDTO> findIdx(String club_id);
	
	//공지사항 글쓰기
	int clubNoticeWrite(ClubBbsDTO dto);
	
	//조회수 올리기
	void clubBbsHit(String clubBbs_id);
	
	//공지사항 상세보기
	ClubBbsDTO clubNoticeDetail(String clubBbs_id);

}
