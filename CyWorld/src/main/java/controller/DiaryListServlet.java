package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DiaryDAO;
import model.DiaryDTO;
import model.DiaryEntryDAO;
import model.DiaryEntryDTO;

@WebServlet("/main/Diary")
public class DiaryListServlet extends HttpServlet {
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
        
        DiaryDAO diaryDAO = new DiaryDAO();
        List<DiaryDTO> diaryList = diaryDAO.findAll();
        
        // 현재 사용자의 다이어리만 필터링
        List<DiaryDTO> userDiaryList = new java.util.ArrayList<>();
        for (DiaryDTO diary : diaryList) {
            if (String.valueOf(memberNo).equals(diary.getMember_no())) {
                userDiaryList.add(diary);
            }
        }
        
        request.setAttribute("diaryList", userDiaryList);
        request.getRequestDispatcher("Diary.jsp").forward(request, response);
    }
}

