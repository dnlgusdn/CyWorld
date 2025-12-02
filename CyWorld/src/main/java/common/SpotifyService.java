package common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import model.TrackDTO;

public class SpotifyService {

    private final String CLIENT_ID = "1b0443cafcca433d93ca166afb46a66e";
    private final String CLIENT_SECRET = "e884e3c58d27498b8d9f4c298ec955a1";

    // 1) Access Token 발급
    public String getAccessToken() throws Exception {

        URL url = new URL("https://accounts.spotify.com/api/token");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        String body = "grant_type=client_credentials"
                + "&client_id=" + CLIENT_ID
                + "&client_secret=" + CLIENT_SECRET;

        conn.getOutputStream().write(body.getBytes("UTF-8"));

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String line;

        while ((line = br.readLine()) != null) sb.append(line);

        JSONObject obj = new JSONObject(sb.toString());
        return obj.getString("access_token");
    }

    // 2) "k-pop" 검색해서 인기곡 가져오기
    public List<TrackDTO> getKpopChart() throws Exception {

        String token = getAccessToken();

        // search API (market=KR 추가)
        String keyword = "k-pop";
        String searchUrl = "https://api.spotify.com/v1/search?q=" 
                            + keyword + "&type=track&market=KR&limit=50";

        URL url = new URL(searchUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + token);

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String line;

        while ((line = br.readLine()) != null) sb.append(line);

        JSONObject result = new JSONObject(sb.toString());

        JSONArray items = result
                .getJSONObject("tracks")
                .getJSONArray("items");

        List<TrackDTO> list = new ArrayList<>();

        for (int i = 0; i < items.length(); i++) {

            JSONObject track = items.getJSONObject(i);

            String title = track.getString("name");
            String artist = track.getJSONArray("artists").getJSONObject(0).getString("name");

            String imageUrl = track.getJSONObject("album")
                    .getJSONArray("images")
                    .getJSONObject(0)
                    .getString("url");

            String preview = track.isNull("preview_url") ? "" : track.getString("preview_url");

            list.add(new TrackDTO(title, artist, imageUrl, preview));
        }

        return list;
    }
}
