

<%@page import="myblog.dao.PostDao"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myblog.entities.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// --- BACKEND LOGIC (SAME) ---
int post_id = Integer.parseInt(request.getParameter("post_id"));
Blog b = PostDao.getPostById(post_id);
SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy");
String date = sm.format(b.getpDate());
%>

<!DOCTYPE html>
<html>
<head>
<title><%=b.getpTitle()%> || TechBlog</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;500&family=Roboto:wght@300;400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/style.css">

<style>
body {
	background-color: #0d1117; /* GitHub Dark Mode Background */
	color: #c9d1d9;
	font-family: 'Roboto', sans-serif;
}

.container-box {
	margin-top: 40px;
}

.post-header {
	margin-bottom: 30px;
}

.post-title {
	font-size: 2.8rem;
	font-weight: 700;
	color: #58a6ff; /* Neon Blue */
	margin-bottom: 10px;
}

.meta-bar {
	font-family: 'Roboto Mono', monospace;
	color: #8b949e;
	font-size: 0.9rem;
	border-left: 3px solid #238636; /* Green accent */
	padding-left: 15px;
}

.meta-bar a {
	color: #c9d1d9;
	text-decoration: underline;
}

.main-img {
	width: 100%;
	height: 400px;
	object-fit: cover;
	border-radius: 8px;
	border: 1px solid #30363d;
	margin-bottom: 30px;
	box-shadow: 0 0 20px rgba(88, 166, 255, 0.1);
}

.content-area {
	font-size: 1.2rem;
	line-height: 1.8;
	color: #e6edf3;
	background: #161b22;
	padding: 30px;
	border-radius: 8px;
	border: 1px solid #30363d;
}

.action-bar {
	margin-top: 30px;
	display: flex;
	gap: 15px;
}

.btn-dark-custom {
	background: #21262d;
	border: 1px solid #30363d;
	color: #c9d1d9;
	padding: 10px 20px;
	border-radius: 6px;
}

.btn-dark-custom:hover {
	background: #30363d;
	color: white;
	border-color: #8b949e;
}
</style>
</head>
<body>

	<%
	User currentUser = (User) session.getAttribute("currentUser");
	if (currentUser == null) {
	%>
	<script>
		alert("Please login to like this post");
		window.location = "login.jsp";
	</script>
	<%
	return;
	}
	%>
	<%@ include file="includes/navbar.jsp"%>

	<div class="container container-box">
		<div class="row">
			<div class="col-md-10 offset-md-1">

				<div class="post-header">
					<h1 class="post-title"><%=b.getpTitle()%></h1>
					<div class="meta-bar">
						<i class="fa fa-code"></i> Posted by <a href="#"><%=b.getUser().getName()%></a>
						on <span><%=date%></span>
					</div>
				</div>

				<img src="<%=b.getpPicUrl()%>" class="main-img"
					onerror="this.onerror=null; this.src='https://via.placeholder.com/800x400/161b22/58a6ff?text=TechBlog'">

				<div class="content-area">
					<%=b.getpContent().replace("\n", "<br>")%>
				</div>


				</div>

			</div>
		</div>

	<script>


function goToLogin() {
    alert("Login required to like posts");
    window.location.href = "login.jsp";
}
</script>

</body>
</html>