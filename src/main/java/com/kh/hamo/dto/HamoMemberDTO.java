package com.kh.hamo.dto;

public class HamoMemberDTO {

	/*member*/
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_location;
	/*interest*/
	private int interest_id;
	private String interest_interest;
	/*memberInterest*/
	private int memberInterest_id;
	
	
	
	
	
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_location() {
		return member_location;
	}
	public void setMember_location(String member_location) {
		this.member_location = member_location;
	}
	public int getInterest_id() {
		return interest_id;
	}
	public void setInterest_id(int interest_id) {
		this.interest_id = interest_id;
	}
	public String getInterest_interest() {
		return interest_interest;
	}
	public void setInterest_interest(String interest_interest) {
		this.interest_interest = interest_interest;
	}
	public int getMemberInterest_id() {
		return memberInterest_id;
	}
	public void setMemberInterest_id(int memberInterest_id) {
		this.memberInterest_id = memberInterest_id;
	}
	
	
	
}
