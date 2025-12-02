package model;

import java.sql.Timestamp;

public class DiaryDTO {
	private int diary_id;
	private String member_no;
	private String diary_name;
	private Timestamp created_at;
	public int getDiary_id() {
		return diary_id;
	}
	public void setDiary_id(int diary_id) {
		this.diary_id = diary_id;
	}
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public String getDiary_name() {
		return diary_name;
	}
	public void setDiary_name(String diary_name) {
		this.diary_name = diary_name;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp create_at) {
		this.created_at = create_at;
	}
}
