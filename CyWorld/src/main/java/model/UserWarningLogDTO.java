package model;

public class UserWarningLogDTO {
    public int log_no;
    public int member_no;
    public String warning_type;   // ENUM → String 그대로 사용
    public String status;         // ENUM → String 그대로 사용
    public String reason;
    public String created_at;     // TIMESTAMP → String
    public String updated_at;     // TIMESTAMP → String
}
