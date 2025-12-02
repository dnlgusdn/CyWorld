package model;

public class BoardCommentDTO {
	private int commentId;
    private int postId;
    private int writerNo;
    private String content;
    private String createdAt;

    public int getCommentId() {
        return commentId;
    }
    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getPostId() {
        return postId;
    }
    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getWriterNo() {
        return writerNo;
    }
    public void setWriterNo(int writerNo) {
        this.writerNo = writerNo;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
