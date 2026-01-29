<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - TechBlog</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<style>
body {
    background-color: #f4f7f6;
    color: #333;
}
</style>
<body>
   <%@ include file="includes/navbar.jsp" %>

    <div class="container">
        <div class="form-container">
            <h2 style="text-align: center;">Login</h2>

        
        
         <% 
                String msg = (String) session.getAttribute("msg");
                if(msg != null) {
            %>
                <div style="color: red; text-align: center; margin-bottom: 10px;"><%= msg %></div>
            <% 
                session.removeAttribute("msg"); 
                } 
            %>
        
   
            <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn-primary">Login</button>
            </form>
        </div>
    </div>
</body>
