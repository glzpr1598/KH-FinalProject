package com.kh.hamo.dao;

import java.util.ArrayList;

import com.kh.hamo.dto.ClubMeetingDTO;

public interface ClubMeetingPlanInter {

	ArrayList<ClubMeetingDTO> clubMeetingList(int club_id, String member_id);//모임 일정 리스트

	String clubLocation(String club_id);  // 동호회 지역 가져오기

	int clubMeetingWrite(Object club_id, Object member_id, Object meetingPlan_subject,
			Object meetingPlan_locationX, Object meetingPlan_locationY, Object meetingPlan_when,
			Object meetingPlan_money, Object meetingPlan_content);//모임 일정 등록

	void clubMeetingWriteFirst(int parseInt, String member_id, String meetingPlan_subject, String meetingPlan_locationX,
			String meetingPlan_locationY, String meetingPlan_when, String meetingPlan_money,
			String meetingPlan_content);
	
	
	int clubMeetingCount(String club_id);


	ClubMeetingDTO clubMeetingDetail(int parseInt);//모임 일정 상세보기 


	ArrayList<String> meetingAttendList(int meetingPlan_id, int club_id);//모임 일정 참석자


	int meetingAttend(String member_id, int meetingPlan_id);//모임 일정 참석


	int meetingAttendBtn(String member_id, int parseInt);//모임 참석확인 버튼


	int meetingAttendCancel(String member_id, int parseInt);//모임 참석취소


	int replyAdd(int parseInt, String member_id, String replyContent);//모임참석 댓글 등록


	ArrayList<String> replyList(int parseInt, int i);//모임 댓글 리스트


	int replyDel(int parseInt, String member_id);//모임 댓글 삭제

	ClubMeetingDTO clubMeetingUpdateForm(int parseInt, String member_id);	//모임 일정 수정 페이지 이동

	int clubMeetingUpdate(int parseInt, String member_id, int i, String meetingPlan_subject,
			String meetingPlan_locationX, String meetingPlan_locationY, String meetingPlan_when,
			String meetingPlan_money, String meetingPlan_content);//모임 일정 수정

<<<<<<< HEAD

	int replyCount(String meetingPlan_id);

=======
	int replyCount(String meetingPlan_id);
>>>>>>> 8629565d63a054dccfa327c35af3cc8502087735







}
