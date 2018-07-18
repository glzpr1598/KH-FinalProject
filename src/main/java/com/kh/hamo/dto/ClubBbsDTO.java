package com.kh.hamo.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ClubBbsDTO {
	
	private int clubBbs_id;
	private int club_id;
	private String member_id;
	private String clubBbs_sort;
	private int clubBbs_idx;
	private String clubBbs_subject;
	private String clubBbs_content;
	private int clubBbs_replyCount;
	private int clubBbs_hit;
	private Date clubBbs_date;
	private int clubBbsFile_id;
	private String clubBbsFile_oldName;
	private String clubBbsFile_newName;
	private int clubBbsReply_id;
	private String clubBbsReply_content;
	private Timestamp clubBbsReply_date;
	private String club_masterNickname;
	private String clubJoin_nickname;
	
	public int getClubBbs_id() {
		return clubBbs_id;
	}
	public void setClubBbs_id(int clubBbs_id) {
		this.clubBbs_id = clubBbs_id;
	}
	public int getClub_id() {
		return club_id;
	}
	public void setClub_id(int club_id) {
		this.club_id = club_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getClubBbs_sort() {
		return clubBbs_sort;
	}
	public void setClubBbs_sort(String clubBbs_sort) {
		this.clubBbs_sort = clubBbs_sort;
	}
	public int getClubBbs_idx() {
		return clubBbs_idx;
	}
	public void setClubBbs_idx(int clubBbs_idx) {
		this.clubBbs_idx = clubBbs_idx;
	}
	public String getClubBbs_subject() {
		return clubBbs_subject;
	}
	public void setClubBbs_subject(String clubBbs_subject) {
		this.clubBbs_subject = clubBbs_subject;
	}
	public String getClubBbs_content() {
		return clubBbs_content;
	}
	public void setClubBbs_content(String clubBbs_content) {
		this.clubBbs_content = clubBbs_content;
	}
	public int getClubBbs_replyCount() {
		return clubBbs_replyCount;
	}
	public void setClubBbs_replyCount(int clubBbs_replyCount) {
		this.clubBbs_replyCount = clubBbs_replyCount;
	}
	public int getClubBbs_hit() {
		return clubBbs_hit;
	}
	public void setClubBbs_hit(int clubBbs_hit) {
		this.clubBbs_hit = clubBbs_hit;
	}
	public int getClubBbsFile_id() {
		return clubBbsFile_id;
	}
	public void setClubBbsFile_id(int clubBbsFile_id) {
		this.clubBbsFile_id = clubBbsFile_id;
	}
	public String getClubBbsFile_oldName() {
		return clubBbsFile_oldName;
	}
	public void setClubBbsFile_oldName(String clubBbsFile_oldName) {
		this.clubBbsFile_oldName = clubBbsFile_oldName;
	}
	public String getClubBbsFile_newName() {
		return clubBbsFile_newName;
	}
	public void setClubBbsFile_newName(String clubBbsFile_newName) {
		this.clubBbsFile_newName = clubBbsFile_newName;
	}
	public int getClubBbsReply_id() {
		return clubBbsReply_id;
	}
	public void setClubBbsReply_id(int clubBbsReply_id) {
		this.clubBbsReply_id = clubBbsReply_id;
	}
	public String getClubBbsReply_content() {
		return clubBbsReply_content;
	}
	public void setClubBbsReply_content(String clubBbsReply_content) {
		this.clubBbsReply_content = clubBbsReply_content;
	}
	public Timestamp getClubBbsReply_date() {
		return clubBbsReply_date;
	}
	public void setClubBbsReply_date(Timestamp clubBbsReply_date) {
		this.clubBbsReply_date = clubBbsReply_date;
	}
	public String getClub_masterNickname() {
		return club_masterNickname;
	}
	public void setClub_masterNickname(String club_masterNickname) {
		this.club_masterNickname = club_masterNickname;
	}
	public Date getClubBbs_date() {
		return clubBbs_date;
	}
	public void setClubBbs_date(Date clubBbs_date) {
		this.clubBbs_date = clubBbs_date;
	}
	public String getClubJoin_nickname() {
		return clubJoin_nickname;
	}
	public void setClubJoin_nickname(String clubJoin_nickname) {
		this.clubJoin_nickname = clubJoin_nickname;
	}
}

