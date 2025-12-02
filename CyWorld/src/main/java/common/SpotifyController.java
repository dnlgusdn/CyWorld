package common;

import common.SpotifyService;
import model.TrackDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class SpotifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SpotifyService service = new SpotifyService();

        try {
            List<TrackDTO> chart = service.getKpopChart();
            request.setAttribute("chart", chart);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Spotify API 호출 오류");
        }

        RequestDispatcher dispatcher =
        		request.getRequestDispatcher("/WEB-INF/views/spotifyList.jsp");
        dispatcher.forward(request, response);
    }
}

