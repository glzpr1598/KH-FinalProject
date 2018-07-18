package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.ClubBbsDTO;

public interface ClubBbsInter {
	
	//회장 닉네임 찾기
	String findMaster(HashMap<String, String> params);
	
	//공지사항 리스트
	ArrayList<ClubBbsDTO> clubNoticeList(int club_id, String sort);
	
	//동호회 회원 닉네임 조회
	String findnickName(String club_id, String member_id);
	
	//조회수 올리기
	void clubBbsHit(String clubBbs_id);
	
	//공지사항 상세보기
	ClubBbsDTO clubNoticeDetail(String clubBbs_id);
	
	//게시글 수 가져오기
	int findCount(int club_id);
	
	//글번호 가져오기
	ArrayList<ClubBbsDTO> findIdx(String club_id);
	
	//글쓰기
	int clubWrite(ClubBbsDTO dto);
	
	//DB에 파일 저장
	int writeFile(String newFile, String oldFile, int clubBbs_id);
	
	//수정 폼
	ClubBbsDTO clubUpdateForm(String clubBbs_id);
	
	//게시글 수정
	int clubUpdate(ClubBbsDTO dto);
	
	//파일 삭제
	int fileDelete(String key);
	
	//파일 찾기
	ArrayList<String> findFile(int clubBbs_id);
	
	//게시글 삭제
	void clubDelete(int clubBbs_id);
	
	//전체글보기 리스트
	ArrayList<ClubBbsDTO> clubAllList(String club_id);
	
	//상세보기
	ClubBbsDTO clubBoardDetail(String clubBbs_id);
	
	//자유게시판 리스트
	ArrayList<ClubBbsDTO> clubFreeBbsList(String club_id, String clubBbs_sort);
	
	//댓글 찾기
	ClubBbsDTO findReply(String clubBbs_id);
	
	//댓글 리스트
	ArrayList<ClubBbsDTO> clubReplyList(String clubBbs_id);
	
	//댓글작성
	int clubReply(ClubBbsDTO dto);
	
	//댓글 수 증가
	void replyUp(String clubBbs_id);
	
	//댓글 삭제
	void replyDelete(String clubBbs_id);

	//댓글 수 감소
	void replyDown(String clubBbs_id);

}
