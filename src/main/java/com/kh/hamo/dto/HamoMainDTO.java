package com.kh.hamo.dto;

public class HamoMainDTO {
	private int club_id;
	private String club_name;
	private String club_introduce;
	private String club_date;
	private int club_memberConunt;
	private String club_location;
	private int clubPicture_id;
	private String clubPicture_oldName;
	public int getClub_id() {
		return club_id;
	}
	public void setClub_id(int club_id) {
		this.club_id = club_id;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public String getClub_introduce() {
		return club_introduce;
	}
	public void setClub_introduce(String club_introduce) {
		this.club_introduce = club_introduce;
	}
	public String getClub_date() {
		return club_date;
	}
	public void setClub_date(String club_date) {
		this.club_date = club_date;
	}
	public int getClub_memberConunt() {
		return club_memberConunt;
	}
	public void setClub_memberConunt(int club_memberConunt) {
		this.club_memberConunt = club_memberConunt;
	}
	public String getClub_location() {
		return club_location;
	}
	public void setClub_location(String club_location) {
		this.club_location = club_location;
	}
	public int getClubPicture_id() {
		return clubPicture_id;
	}
	public void setClubPicture_id(int clubPicture_id) {
		this.clubPicture_id = clubPicture_id;
	}
	public String getClubPicture_oldName() {
		return clubPicture_oldName;
	}
	public void setClubPicture_oldName(String clubPicture_oldName) {
		this.clubPicture_oldName = clubPicture_oldName;
	}
	public String getClubPicture_newName() {
		return clubPicture_newName;
	}
	public void setClubPicture_newName(String clubPicture_newName) {
		this.clubPicture_newName = clubPicture_newName;
	}
	private String clubPicture_newName;
}
