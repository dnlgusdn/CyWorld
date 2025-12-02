package model;

public class HomeProfileDTO {
	// DB 'home_profile' 테이블 필드
	private int profile_id;
	private int member_no;
	private String profile_image;
	private String background_image;
	private String today_is; // 오늘의 한마디 (DB 컬럼명)
	private String history;
	private String miniroom_image;
    
    // JSP에서 필요하지만 DB에 없을 수 있는 필드 (DAO에서 기본값 설정)
    private int todayCount; 
    private int totalCount; 
    
	// Getter 및 Setter for DB Fields
	public int getProfile_id() { return profile_id; }
	public void setProfile_id(int profile_id) { this.profile_id = profile_id; }
	public int getMember_no() { return member_no; }
	public void setMember_no(int member_no) { this.member_no = member_no; }
	public String getProfile_image() { return profile_image; }
	public void setProfile_image(String profile_image) { this.profile_image = profile_image; }
	public String getBackground_image() { return background_image; }
	public void setBackground_image(String background_image) { this.background_image = background_image; }
    
	public String getToday_is() { return today_is; } 
	public void setToday_is(String today_is) { this.today_is = today_is; }
    
    // ⭐ JSP 호환성 메서드: JSP에서 getTodayMessage() 호출 시 today_is 값을 반환합니다.
    public String getTodayMessage() { return today_is; } 

	public String getHistory() { return history; }
	public void setHistory(String history) { this.history = history; }
	public String getMiniroom_image() { return miniroom_image; }
	public void setMiniroom_image(String miniroom_image) { this.miniroom_image = miniroom_image; }

    // JSP 추가 필드 (오늘/전체 방문자 수)
    public int getTodayCount() { return todayCount; }
    public void setTodayCount(int todayCount) { this.todayCount = todayCount; }
    public int getTotalCount() { return totalCount; }
    public void setTotalCount(int totalCount) { this.totalCount = totalCount; }
}