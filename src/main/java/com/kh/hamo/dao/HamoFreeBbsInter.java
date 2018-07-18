package com.kh.hamo.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.HamoBbsDTO;

public interface HamoFreeBbsInter {

	ArrayList<HamoBbsDTO> freeBbsList(); //자유게시판 게시글 조회
                                        
	HamoBbsDTO freeBbsdetail(String idx);   //특정 글 상세보기
	
	void freeBbsHit(String idx); //특정 글 상세 보기 시 조회수 올리기
	
	int freeBbsUpdate(int idx, String content); //자유게시판 글 수정하기

	int freeBbsWrite(HamoBbsDTO dto); //자유게시판 글쓰기

	int freeBbsDelete(String idx); //자유게시판 글 삭제

	int freeBbsReply(HamoBbsDTO dto); //자유게시판 댓글 등록
	
	String reply_date(int mainBbsReply_id); //댓글 등록 후 날짜 가져오기

	ArrayList<HamoBbsDTO> freeBbsReplyList(int mainBbs_id); // 댓글 리스트 조회해오기

	int freBbsReplyDel(int mainBbs_id); //댓글 삭제하기

	void reply_countUpdate(int mainBbs_id, String flag); //댓글 등록 OR 댓글 삭제 시 댓글 개수 변경

	int reply_count(int mainBbs_id); //댓글 개수 가져오기

//	String freeBbsReply_IdCheck(int reply_id); //자유게시판 삭제 권한 부여

	int freeBbsUpload(int mainBbs_id, String key, String oldFileNmae); //자유게시판 이미지 업로드 성공 여부 반환

	ArrayList<String> freeBbsImage(String idx); //삭제하려고 하는 글에 몇개의 이미지가 있는지 확인

	int freeBbsFileDel(int idx); //게시글 수정 시 기존 이미지 초기화시킴

	ArrayList<HamoBbsDTO> selectFile(int idx); //수정 하기 전에 게시글에 업로드 된 이미지

	



}
