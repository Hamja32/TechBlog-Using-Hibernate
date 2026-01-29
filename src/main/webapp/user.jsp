<%@ page import="myblog.dao.*" %>
<%@ page import="myblog.entities.*" %>
<%@ page import="java.util.*" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<link rel="stylesheet"
 href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<link
 href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
 rel="stylesheet">

<style>
body {
    background-color: #0d1117;
    color: #c9d1d9;
    font-family: 'Inter', sans-serif;
}

.profile-card {
    background: #161b22;
    border: 1px solid #30363d;
    border-radius: 14px;
    padding: 30px;
    text-align: center;
    box-shadow: 0 10px 30px rgba(0,0,0,0.4);
}

.profile-avatar {
    width: 96px;
    height: 96px;
    border-radius: 50%;
    background: linear-gradient(135deg, #58a6ff, #a371f7);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 36px;
    font-weight: 600;
    color: #fff;
    margin: auto;
    margin-bottom: 16px;
}

.profile-name {
    font-size: 24px;
    font-weight: 600;
    color: #f0f6fc;
}

.profile-about {
    color: #8b949e;
    margin-top: 10px;
    font-size: 15px;
}

.post-count {
    margin-top: 16px;
    font-weight: 500;
    color: #58a6ff;
}

.section-title {
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 10px;
    color: #f0f6fc;
}

.post-card {
    background: #161b22;
    border: 1px solid #30363d;
    border-radius: 14px;
    transition: all 0.25s ease;
    height: 100%;
}

.post-card:hover {
    transform: translateY(-6px);
    border-color: #58a6ff;
    box-shadow: 0 12px 40px rgba(88,166,255,0.15);
}

.post-title {
    font-size: 18px;
    font-weight: 600;
    color: #f0f6fc;
}

.post-excerpt {
    color: #8b949e;
    font-size: 14px;
    margin-top: 10px;
}
.pic{
	    width: 100%;
    height: 60%;
    object-fit: cover;
    border-radius: 8px;

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

.read-more:hover {
    text-decoration: underline;
}
</style>
 <link rel="stylesheet" href="css/style.css">
</head>

<body>

   <%@ include file="includes/navbar.jsp" %>
<%
int uid = Integer.parseInt(request.getParameter("uid"));


if (user == null) {
    response.sendRedirect("login.jsp");
    return; // very important
}
List<Blog> posts = PostDao.getPostsByUser(user);
%>

<div class="container mt-5">

    <!-- USER PROFILE -->
    <div class="row justify-content-center mb-5">
        <div class="col-md-6">
            <div class="profile-card">
                <div class="profile-avatar">
                    <%= user.getName().substring(0,1).toUpperCase() %>
                </div>

                <div class="profile-name">
                    <%= user.getName() %>
                </div>

                <div class="profile-about">
                    <%= user.getAbout() %>
                </div>

                <div class="post-count">
                    Total Posts: <%= posts.size() %>
                </div>
            </div>
        </div>
    </div>

    <!-- POSTS SECTION -->
    <div class="row">
        <div class="col-12 mb-3">
            <h4>All Posts</h4>
            <hr>
        </div>

        <% if (posts.size() == 0) { %>
            <div class="col-12">
                <p class="text-muted">No posts yet.</p>
            </div>
        <% } %>

        <% for (Blog b : posts) { %>
            <div class="col-md-6 mb-4">
                <div class="card post-card" style="cursor:pointer">
                    	<img class="pic" src="<%= b.getpPicUrl()%>">
                    <div class="card-body" style="margin-top: 10px">
                        <h5 class="post-title">
                            <%= b.getpTitle() %>
                        </h5>

                        <p class="text-muted">
                            <%= b.getpContent().substring(
                                0, Math.min(150, b.getpContent().length())
                            ) %>...
                        </p>

                        <a class="btn-neon"
                           href="blog_detail.jsp?post_id=<%= b.getPid() %>">
                            Read More →
                        </a>
                    </div>
                </div>
            </div>
        <% } %>

    </div>
</div>

</body>

</body>
</html>