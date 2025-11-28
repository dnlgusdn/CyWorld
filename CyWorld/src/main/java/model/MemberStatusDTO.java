package model;

public class MemberStatusDTO {
    public int member_no;
    public boolean is_perm_banned;
    public boolean is_temp_banned;
    public String temp_ban_end;   // DATE를 String으로 처리 (JSP/Servlet에서 편함)

    public boolean board_write_ban;
    public boolean message_ban;
}
