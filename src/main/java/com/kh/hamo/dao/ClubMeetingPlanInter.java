package com.kh.hamo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hamo.dto.ClubMeetingDTO;

public interface ClubMeetingPlanInter {

	ArrayList<ClubMeetingDTO> clubMeetingList(int club_id);//모임 일정 리스트

}
