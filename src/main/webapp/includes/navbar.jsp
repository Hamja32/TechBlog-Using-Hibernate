<div id="top-progress"></div>

<style>
#top-progress {
    position: fixed;
    top: 0;
    left: 0;
    height: 5px;
    width: 0%;
    background-color: yellow;
    z-index: 99999;
    opacity: 0;
    transition: width 0.3s ease, opacity 0.2s ease;
    box-shadow: 0 0 8px rgba(255, 0, 0, 0.6);
}
</style>

<%@ page import="myblog.entities.User" %>
<%
    User user = (User) session.getAttribute("currentUser");
%>

<div class="navbar">
    <div class="logo">
        <a href="index.jsp" style="color:white; margin-left:0;">TechBlog</a>
    </div>

    <div class="nav-links">
        <a href="index.jsp">Home</a>

        <%
            if (user == null) {
                // Agar koi login nahi hai to ye dikhega
        %>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        <%
            } else {
                // Agar user login hai to ye dikhega
        %>
            <a href="add_blog.jsp"><i class="fa fa-plus-circle"></i> Add Blog</a>
            <a href="user.jsp?uid=<%=user.getId() %>" style="color: yellow;"><i class="fa fa-user"></i> <%= user.getName() %></a>
            <a href="LogoutServlet">Logout</a>
        <%
            }
        %>
    </div>
</div>

<script>

const bar = document.getElementById("top-progress");

function startProgress() {
    bar.style.opacity = "1";
    bar.style.width = "30%";

    setTimeout(() => bar.style.width = "60%", 200);
    setTimeout(() => bar.style.width = "85%", 400);
}

function endProgress() {
    bar.style.width = "100%";
    setTimeout(() => {
        bar.style.opacity = "0";
        bar.style.width = "0%";
    }, 300);
}

// Link clicks
document.querySelectorAll("a").forEach(link => {
    link.addEventListener("click", () => {
        startProgress();
    });
});

// Button clicks
document.querySelectorAll("button").forEach(btn => {
    btn.addEventListener("click", () => {
        startProgress();
    });
});

// Page load complete
window.addEventListener("load", () => {
    endProgress();
});
</script>



