package model;

public class TrackDTO {
    private String title;
    private String artist;
    private String imageUrl;
    private String previewUrl;

    public TrackDTO(String title, String artist, String imageUrl, String previewUrl) {
        this.title = title;
        this.artist = artist;
        this.imageUrl = imageUrl;
        this.previewUrl = previewUrl;
    }

    public String getTitle() { return title; }
    public String getArtist() { return artist; }
    public String getImageUrl() { return imageUrl; }
    public String getPreviewUrl() { return previewUrl; }
}
