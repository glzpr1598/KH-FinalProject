package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ClubAdminInter {

	// 동호회 폐쇄 등록
	void clubClose(String club_id);
	// 폐쇄 날짜 가져오기
	ArrayList<HashMap<String, Object>> clubCloseDate();
	// 동호회 삭제
	void clubDelete(Object club_id);
	// 동호회 폐쇄 삭제
	void clubCloseDelete(Object clubClose_id);
	// 동호회 폐쇄 검사
	String clubCloseCheck(String club_id);
	// 동호회 폐쇄 취소
	void clubCloseCancel(String club_id);
	// 동호회 사진 이름 가져오기
	ArrayList<String> clubPictureName(String club_id);
	// 동호회 사진 삭제
	void clubPictureDelete(String club_id);
	// 동호회 사진 등록
	void clubPictureUpload(String oldName, String newName, String club_id);
	// 동호회 소개글 수정
	void clubIntroduceUpdate(String club_id, String introduce);

}
