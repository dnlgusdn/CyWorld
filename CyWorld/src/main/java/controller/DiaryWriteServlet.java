package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DiaryEntryDAO;
import model.DiaryEntryDTO;

@WebServlet("/main/DiaryWrite")
public class DiaryWriteServlet extends HttpServlet {
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
        
        request.getRequestDispatcher("DiaryWrite.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        
        if (memberNo == null) {
            response.sendRedirect("../../loginForm.jsp");
            return;
        }
        
        String diaryIdParam = request.getParameter("diaryId");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String diaryDate = request.getParameter("diaryDate");
        String mood = request.getParameter("mood");
        String privacy = request.getParameter("privacy");
        
        int diaryId = 1; // 기본값, 실제로는 폴더 선택에 따라 결정
        if (diaryIdParam != null && !diaryIdParam.isEmpty()) {
            try {
                diaryId = Integer.parseInt(diaryIdParam);
            } catch (NumberFormatException e) {
                diaryId = 1;
            }
        }
        
        DiaryEntryDTO dto = new DiaryEntryDTO();
        dto.setDiary_id(diaryId);
        dto.setContent(content);
        dto.setMusic_title(title);
        
        // 날짜 변환
        try {
            java.sql.Date entryDate = java.sql.Date.valueOf(diaryDate);
            dto.setEntry_date(entryDate);
        } catch (Exception e) {
            dto.setEntry_date(new java.sql.Date(System.currentTimeMillis()));
        }
        
        boolean isPrivate = "private".equals(privacy);
        dto.setIs_private(isPrivate);
        
        DiaryEntryDAO dao = new DiaryEntryDAO();
        int result = dao.insert(dto);
        
        if (result > 0) {
            response.sendRedirect("Diary.jsp");
        } else {
            response.getWriter().println("<script>alert('다이어리 작성에 실패했습니다.'); history.back();</script>");
        }
    }
}

