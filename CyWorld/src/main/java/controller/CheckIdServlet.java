package controller;

import java.io.IOException;
import java.io.PrintWriter;

import common.JDBConnect;
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
            // 🚨 오류 해결: MemberDAO에 정의된 isDuplicateId로 변경
            boolean isDuplicate = dao.isDuplicateId(userId); 
            
            if (isDuplicate) {
                out.print("duplicate"); // 중복됨
            } else {
                out.print("available"); // 사용 가능
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("error"); // 서버 오류
        } finally {
            // DAO 자원 정리 (JDBConnect를 상속받았으므로 closeResources 호출)
            if (dao != null) {
                // MemberDAO에 closeResources()가 있다면 호출합니다. 
                // 없다면 MemberDAO에 자원 해제 메서드를 구현해야 합니다.
                // 편의상 JDBConnect에서 상속받은 close()를 대신 호출한다고 가정합니다.
                JDBConnect.close(null, null, null);
            }
        }
        
        out.flush();
        out.close();
    }
}