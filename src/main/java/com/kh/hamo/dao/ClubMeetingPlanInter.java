package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.ClubMeetingDTO;

public interface ClubMeetingPlanInter {

	ArrayList<ClubMeetingDTO> clubMeetingList(int club_id);//모임 일정 리스트


	int clubMeetingWrite(Object club_id, Object member_id, Object meetingPlan_subject,
			Object meetingPlan_locationX, Object meetingPlan_locationY, Object meetingPlan_when,
			Object meetingPlan_money, Object meetingPlan_content);//모임 일정 등록

}
