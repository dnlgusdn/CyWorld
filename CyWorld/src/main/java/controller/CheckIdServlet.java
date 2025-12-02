package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MemberDAO;

@WebServlet("/checkId")
public class CheckIdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        // 응답은 일반 텍스트로 보냅니다. ("duplicate" 또는 "available")
        response.setContentType("text/plain; charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        String userId = request.getParameter("userId");
        
        if (userId == null || userId.trim().isEmpty()) {
            out.print("error");
            return;
        }

        // ⭐ DAO를 사용하여 DB 중복 확인
        MemberDAO dao = new MemberDAO();
        try {
            boolean isDuplicate = dao.checkIdDuplication(userId);
            
            if (isDuplicate) {
                out.print("duplicate"); // 중복됨
            } else {
                out.print("available"); // 사용 가능
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("error"); // 서버 오류
        } 
        
        out.flush();
        out.close();
    }
}