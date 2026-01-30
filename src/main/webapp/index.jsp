<%@page import="myblog.dao.PostDao"%>
<%@page import="myblog.helper.Helper"%>
<%@page import="myblog.entities.Blog"%>
<%@page import="java.util.List"%>
<%@page import="myblog.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Home - TechBlog</title>
<link rel="stylesheet" href="css/style.css">
<style>
body {
	background-color: #0d1117; /* GitHub Dark Mode Background */
	color: #c9d1d9;
	font-family: 'Roboto', sans-serif;
}
/* --- Dark Mode Card Styles --- */

/* 1. Card Container */
.card-dark {
	background-color: #161b22; /* Dark Grey Background */
	border: 1px solid #30363d; /* Subtle Border */
	border-radius: 12px;
	overflow: hidden;
	transition: all 0.3s ease;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
	height: 100%;
	display: flex;
	flex-direction: column;
}

/* Hover Effect: Glow Border */
.card-dark:hover {
	transform: translateY(-5px);
	border-color: #58a6ff; /* Blue Glow */
	box-shadow: 0 8px 24px rgba(88, 166, 255, 0.15);
}

/* 2. Image Styling */
.card-img-wrap {
	height: 200px;
	overflow: hidden;
	position: relative;
	border-bottom: 1px solid #30363d;
}

.card-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.5s ease;
	opacity: 0.9; /* Thoda dim kiya taaki aankhon me na chubhe */
}

/* Image Zoom on Hover */
.card-dark:hover .card-img {
	transform: scale(1.1);
	opacity: 1;
}

/* 3. Typography */
.card-body-dark {
	padding: 20px;
	display: flex;
	flex-direction: column;
	flex-grow: 1;
}

.card-title-dark {
	font-size: 1.25rem;
	font-weight: 700;
	color: #c9d1d9; /* Soft White */
	margin-bottom: 12px;
	line-height: 1.4;
}

.card-meta-dark {
	font-size: 0.85rem;
	color: #8b949e; /* Grey Text */
	margin-bottom: 15px;
	display: flex;
	align-items: center;
	gap: 10px;
	font-family: 'Courier New', monospace; /* Coding vibe */
}

.card-text-dark {
	font-size: 0.95rem;
	color: #8b949e;
	line-height: 1.6;
	margin-bottom: 20px;
	flex-grow: 1;
}

/* 4. Neon Button */
.btn-neon {
	text-decoration: none;
	color: #58a6ff; /* Neon Blue */
	font-weight: 600;
	font-size: 0.9rem;
	padding: 8px 16px;
	border: 1px solid #30363d;
	border-radius: 6px;
	background: #0d1117;
	transition: all 0.3s ease;
	display: inline-block;
}

.btn-neon:hover {
	background: #58a6ff;
	color: #0d1117; /* Text black on hover */
	box-shadow: 0 0 10px rgba(88, 166, 255, 0.5); /* Glowing Effect */
	text-decoration: none;
	border-color: #58a6ff;
}

.page-link {
    background: #161b22;
    border: 1px solid #30363d;
    color: #58a6ff;
}

.page-item.active .page-link {
    background: #58a6ff;
    color: #0d1117;
    border-color: #58a6ff;
}

.page-link:hover {
    background: #21262d;
    color: #fff;
}
.pagination{

    display: flex;
    justify-content: center;
    list-style: none;
    margin-bottom: 20px;
    }
    
    .pagination li a{
    	padding:8px;
    	margin:4px;
    	text-decoration:none;
    }

</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>


	<%@ include file="includes/navbar.jsp"%>
	<%
	User currentUser = (User) session.getAttribute("currentUser");

	if (currentUser == null) {

		response.sendRedirect("login.jsp");
		return; // very important
	}
	int apage = 1;
	int pageSize = 6;

	String pageParam = request.getParameter("page");
	if (pageParam != null) {
	    try {
	        apage = Integer.parseInt(pageParam);
	        if (apage < 1) {
	            apage = 1;
	        }
	    } catch (Exception e) {
	        apage = 1;
	    }
	}

	List<Blog> posts = PostDao.getPostsByPage(apage, pageSize);

	long totalPosts = PostDao.getTotalPostCount();
	int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
	%>

	<div class="container">

		<div style="margin-bottom: 20px;">
			<h2>Latest Blogs</h2>
		</div>

		<div class="blog-grid">

			<%
			List<Blog> list = posts;

			// 3. Loop chalana
			for (Blog b : list) {
			%>
			<div class="col-md-4 mb-4">
				<div class="card-dark">

					<div class="card-img-wrap">
						<img src="<%=b.getpPicUrl()%>" class="card-img" alt="Blog Image"
							onerror="this.style.display='none'">
						<div class="img-overlay"></div>
					</div>

					<div class="card-body-dark">

						<h3 class="card-title-dark"><%=b.getpTitle()%></h3>

						<div class="card-meta-dark">
							<span><i class="fa fa-user-circle" style="color: #58a6ff;"></i>
								<%=b.getUser().getName()%></span> <span style="font-size: 12px;">•</span>
							<span><%=b.getpDate().toString().substring(0, 10)%></span>
						</div>

						<p class="card-text-dark"><%=Helper.get10Words(b.getpContent())%></p>

						<div class="text-right">
							<a href="blog_detail.jsp?post_id=<%=b.getPid()%>"
								class="btn-neon"> Read More </a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			

			// Agar koi blog nahi hai to message show karein
			if (list.size() == 0) {
			out.println("<h3>No blogs available right now...</h3>");
			}
			%>

		</div>
	</div>

<ul class="pagination justify-center">

    <% if (apage > 1) { %>
        <li class="page-item">
            <a class="page-link" href="?page=<%= apage-1 %>">Previous</a>
        </li>
    <% } %>

    <% for (int i = 1; i <= totalPages; i++) { %>
        <li class="page-item <%= (i == apage) ? "active" : "" %>">
            <a class="page-link" href="?page=<%= i %>"><%= i %></a>
        </li>
    <% } %>

    <% if (apage < totalPages) { %>
        <li class="page-item">
            <a class="page-link" href="?page=<%= apage+1 %>">Next</a>
        </li>
    <% } %>

</ul>


</body>
</html>