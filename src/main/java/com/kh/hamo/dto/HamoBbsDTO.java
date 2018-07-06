package com.kh.hamo.dto;

import java.sql.Date;

public class HamoBbsDTO {
	private int mainBbs_id;
	private String member_id;
	private String  mainBbs_sort;
	private int mainBbs_idx;
	private String mainBbs_subject;
	private String mainBbs_content;
	private Date mainBbs_date;
	private int mainBbs_replyCount;
	private int mainBbs_hit;
	private int mainBbsFile_id;
	private String mainBbsFile_oldName;
	private String mainBbsFile_newName;
	private int mainBbsReply_id;
	private String mainBbs_ReplyContent;
	private Date mainBbsReply_date;
	public int getMainBbs_id() {
		return mainBbs_id;
	}
	public void setMainBbs_id(int mainBbs_id) {
		this.mainBbs_id = mainBbs_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMainBbs_sort() {
		return mainBbs_sort;
	}
	public void setMainBbs_sort(String mainBbs_sort) {
		this.mainBbs_sort = mainBbs_sort;
	}
	public int getMainBbs_idx() {
		return mainBbs_idx;
	}
	public void setMainBbs_idx(int mainBbs_idx) {
		this.mainBbs_idx = mainBbs_idx;
	}
	public String getMainBbs_subject() {
		return mainBbs_subject;
	}
	public void setMainBbs_subject(String mainBbs_subject) {
		this.mainBbs_subject = mainBbs_subject;
	}
	public String getMainBbs_content() {
		return mainBbs_content;
	}
	public void setMainBbs_content(String mainBbs_content) {
		this.mainBbs_content = mainBbs_content;
	}
	public Date getMainBbs_date() {
		return mainBbs_date;
	}
	public void setMainBbs_date(Date mainBbs_date) {
		this.mainBbs_date = mainBbs_date;
	}
	public int getMainBbs_replyCount() {
		return mainBbs_replyCount;
	}
	public void setMainBbs_replyCount(int mainBbs_replyCount) {
		this.mainBbs_replyCount = mainBbs_replyCount;
	}
	public int getMainBbs_hit() {
		return mainBbs_hit;
	}
	public void setMainBbs_hit(int mainBbs_hit) {
		this.mainBbs_hit = mainBbs_hit;
	}
	public int getMainBbsFile_id() {
		return mainBbsFile_id;
	}
	public void setMainBbsFile_id(int mainBbsFile_id) {
		this.mainBbsFile_id = mainBbsFile_id;
	}
	public String getMainBbsFile_oldName() {
		return mainBbsFile_oldName;
	}
	public void setMainBbsFile_oldName(String mainBbsFile_oldName) {
		this.mainBbsFile_oldName = mainBbsFile_oldName;
	}
	public String getMainBbsFile_newName() {
		return mainBbsFile_newName;
	}
	public void setMainBbsFile_newName(String mainBbsFile_newName) {
		this.mainBbsFile_newName = mainBbsFile_newName;
	}
	public int getMainBbsReply_id() {
		return mainBbsReply_id;
	}
	public void setMainBbsReply_id(int mainBbsReply_id) {
		this.mainBbsReply_id = mainBbsReply_id;
	}
	public String getMainBbs_ReplyContent() {
		return mainBbs_ReplyContent;
	}
	public void setMainBbs_ReplyContent(String mainBbs_ReplyContent) {
		this.mainBbs_ReplyContent = mainBbs_ReplyContent;
	}
	public Date getMainBbsReply_date() {
		return mainBbsReply_date;
	}
	public void setMainBbsReply_date(Date mainBbsReply_date) {
		this.mainBbsReply_date = mainBbsReply_date;
	}
	
}
