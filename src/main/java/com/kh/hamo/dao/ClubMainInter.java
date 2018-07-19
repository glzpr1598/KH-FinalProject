package com.kh.hamo.dao;

import java.util.HashMap;

public interface ClubMainInter {

	// 동호회 정보 가져오기
	HashMap<String, Object> clubInfo(int club_id);
	// 동호회 사진 이름 가져오기
	String clubPicture(String club_id);
	// 동호회 소개글 가져오기
	String clubIntroduce(String club_id);
	// 내 동호회 내 닉네임 가져오기
	String nickNameSearch(String userId, int clubId);

}
