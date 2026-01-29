package myblog.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import myblog.entities.Blog;
import myblog.entities.User;
import myblog.helper.FactoryProvider;

public class PostDao {
	public static Blog getPostById(int post_id) {
		Blog blog = null;
		Session session = null;
		try {
			session = FactoryProvider.getSession();
			blog = session.find(Blog.class, post_id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return blog;

	}

	public static List<Blog> getPostsByUser(User user) {

		try (Session session = FactoryProvider.getSession()) {

			Query<Blog> q = session.createQuery("from Blog b where b.user = :user order by b.pDate desc", Blog.class);

			q.setParameter("user", user);
			return q.list();
		}
	}

}
