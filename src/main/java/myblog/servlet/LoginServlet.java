package myblog.servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.query.Query;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import myblog.entities.User;
import myblog.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Session session = FactoryProvider.getSession();

		// hql query to find user

		String query = "from User where email = :e AND password = :p";
		Query<User> q = session.createQuery(query,User.class);
		q.setParameter("e", email);
        q.setParameter("p", password);
        User user = q.uniqueResult();

		session.close();
		String path = request.getContextPath() ;
		if(user != null) {
			// Login Success
            HttpSession s = request.getSession();
            s.setAttribute("currentUser", user); // Pure session me user ka data save rahega
            response.sendRedirect(path+ "/index.jsp");
		}else {
			// Login Failed
            HttpSession s = request.getSession();
            s.setAttribute("msg", "Invalid Email or Password");
            response.sendRedirect(path + "/login.jsp");
		}
	}

}
