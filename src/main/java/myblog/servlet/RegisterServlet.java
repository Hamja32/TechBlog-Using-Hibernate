package myblog.servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import myblog.entities.User;
import myblog.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RegisterServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			// 1. Fetch data from JSP
            String name = req.getParameter("user_name");
            String email = req.getParameter("user_email");
            String password = req.getParameter("user_password");
            String gender = req.getParameter("gender");
            String about = req.getParameter("about");

            User user = new User(name,email,password,gender,about);

            //save to db using hibernate
            Session session = FactoryProvider.getSession();
            Transaction tx = session.beginTransaction();
            session.persist(user);
            tx.commit();
            session.close();
            String path = req.getContextPath();
            res.sendRedirect(path + "/login.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
