package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MyPlayListDAO;
import model.MyPlayListDTO;
import model.MusicGroupDAO;
import model.MusicGroupDTO;

@WebServlet("/main/Jukebox")
public class JukeboxServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        
        if (memberNo == null) {
            response.sendRedirect("../../loginForm.jsp");
            return;
        }
        
        // 플레이리스트 조회
        MyPlayListDAO playListDAO = new MyPlayListDAO();
        java.util.ArrayList<MyPlayListDTO> playList = playListDAO.findByMember(memberNo);
        
        // 음악 그룹 조회
        MusicGroupDAO musicGroupDAO = new MusicGroupDAO();
        java.util.ArrayList<MusicGroupDTO> musicGroups = musicGroupDAO.findAll();
        
        request.setAttribute("playList", playList);
        request.setAttribute("musicGroups", musicGroups);
        request.getRequestDispatcher("Jukebox.jsp").forward(request, response);
    }
}

