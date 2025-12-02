package model;

public class BoardLikeDTO {
    private int likeId;
    private int postId;
    private int memberNo;
    private String likedAt;

    public int getLikeId() {
        return likeId;
    }
    public void setLikeId(int likeId) {
        this.likeId = likeId;
    }

    public int getPostId() {
        return postId;
    }
    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getMemberNo() {
        return memberNo;
    }
    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public String getLikedAt() {
        return likedAt;
    }
    public void setLikedAt(String likedAt) {
        this.likedAt = likedAt;
    }
}
