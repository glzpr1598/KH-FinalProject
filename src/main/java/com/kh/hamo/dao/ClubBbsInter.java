package com.kh.hamo.dao;

import java.util.ArrayList;

import com.kh.hamo.dto.ClubBbsDTO;

public interface ClubBbsInter {
	
	//공지사항 리스트
	ArrayList<ClubBbsDTO> clubNoticeList(int club_id, String sort);

}
