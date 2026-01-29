package myblog.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Session lo (agar hai to)
        HttpSession session = request.getSession(false);

        // 2️⃣ Session invalidate karo
        if (session != null) {
            session.invalidate();
        }
        String path = request.getContextPath();
        // 3️⃣ Login page par redirect
        response.sendRedirect(path + "/login.jsp");
    }
}
