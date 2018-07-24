package com.kh.hamo.dto;

public class ClubMemberDTO {

	//동호회 가입 시 
	private int clubJoin_id;
	private int club_id;
	private String member_id;
	private String nickName ;
	public int getClubJoin_id() {
		return clubJoin_id;
	}
	public void setClubJoin_id(int clubJoin_id) {
		this.clubJoin_id = clubJoin_id;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
	
}
