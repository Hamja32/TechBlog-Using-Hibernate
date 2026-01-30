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
	
	
	public static List<Blog> getPostsByPage(int page, int pageSize) {

	    if (page < 1) {
	        page = 1;
	    }

	    int offset = (page - 1) * pageSize;

	    Session session = FactoryProvider.getSession();
	    Query<Blog> q = session.createQuery(
	        "from Blog order by id desc", Blog.class
	    );

	    q.setFirstResult(offset);
	    q.setMaxResults(pageSize);

	    return q.list();
	}

	
	public static long getTotalPostCount() {

	    Session session = FactoryProvider.getSession();

	    Query<Long> q = session.createQuery(
	        "select count(b) from Blog b",
	        Long.class
	    );

	    long count = q.uniqueResult();
	    session.close();

	    return count;
	}



}
