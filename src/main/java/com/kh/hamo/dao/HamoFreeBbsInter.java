package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.HamoBbsDTO;

public interface HamoFreeBbsInter {

	ArrayList<HamoBbsDTO> freeBbsList(); //자유게시판 게시글 조회
                                        
	HamoBbsDTO freeBbsdetail(String idx);   //특정 글 상세보기
	
	void freeBbsHit(String idx); //특정 글 상세 보기 시 조회수 올리기
	
	int freeBbsUpdate(String idx, String content); //자유게시판 글 수정하기

	int freeBbsWrite(String subject, String content); //자유게시판 글쓰기

	int freeBbsDelete(String idx); //자유게시판 글 삭제


}
