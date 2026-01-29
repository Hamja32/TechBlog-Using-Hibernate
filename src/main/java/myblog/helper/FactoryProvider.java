package myblog.helper;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import myblog.entities.Blog;
import myblog.entities.User;
public class FactoryProvider {
	private static SessionFactory factory;

	static {
        if (factory == null) {
            factory = new Configuration()
            		.configure("hibernate.cfg.xml")
            		.addAnnotatedClass(User.class).addAnnotatedClass(Blog.class)
            		.buildSessionFactory();

        }

    }

	public static Session getSession() {
		if (factory != null) {
			return factory.openSession();
		}
		return null;
	}
}