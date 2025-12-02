package model;

import java.sql.Timestamp;
import java.sql.Date;

public class DiaryEntryDTO {
    
    private int entry_id;
    private int diary_id;
    private Date entry_date;
    private String content;
    private String music_title;
    private String music_url;
    private boolean is_private;
    private Timestamp created_at;   // 수정됨

    public int getEntry_id() {
        return entry_id;
    }
    public void setEntry_id(int entry_id) {
        this.entry_id = entry_id;
    }

    public int getDiary_id() {
        return diary_id;
    }
    public void setDiary_id(int diary_id) {
        this.diary_id = diary_id;
    }

    public Date getEntry_date() {
        return entry_date;
    }
    public void setEntry_date(Date entry_date) {
        this.entry_date = entry_date;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public String getMusic_title() {
        return music_title;
    }
    public void setMusic_title(String music_title) {
        this.music_title = music_title;
    }

    public String getMusic_url() {
        return music_url;
    }
    public void setMusic_url(String music_url) {
        this.music_url = music_url;
    }

    public boolean isIs_private() {
        return is_private;
    }
    public void setIs_private(boolean is_private) {
        this.is_private = is_private;
    }

    public Timestamp getCreated_at() {   // getter 수정됨
        return created_at;
    }
    public void setCreated_at(Timestamp created_at) {  // setter 수정됨
        this.created_at = created_at;
    }
}
