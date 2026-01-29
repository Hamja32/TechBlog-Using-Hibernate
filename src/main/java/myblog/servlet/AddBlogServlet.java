package myblog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.Transaction;

import myblog.entities.Blog;
import myblog.entities.User;
import myblog.helper.FactoryProvider;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddBlogServlet() {
        // TODO Auto-generated constructor stub
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // 1. Fetching data from request (Form se data lena)
            String pTitle = request.getParameter("title");
            String pImageUrl = request.getParameter("imageUrl"); // URL wala input
            String pContent = request.getParameter("content");

            // 2. Getting current logged-in user from Session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            // Security Check: Agar user login nahi hai to wapas bhejo
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // 3. Create Blog Object
            // Constructor order: Title, Content, ImageURL, UserObj
            Blog blog = new Blog(pTitle, pContent, pImageUrl, user);

            // 4. Hibernate Save Logic
            Session s = FactoryProvider.getSession();
            Transaction tx = s.beginTransaction();

            s.persist(blog); // Database me save ho raha hai
            String path = request.getContextPath();
            tx.commit();
            s.close();
            response.sendRedirect(path + "/index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
        }
    }
}
