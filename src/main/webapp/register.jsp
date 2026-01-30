<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - TechBlog</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container">
        <div class="form-container">
            <h2 style="text-align: center;">Register Here</h2>
            
            <form action="<%= request.getContextPath() %>/RegisterServlet" method="post">
                
                <div class="form-group">
                    <label>User Name</label>
                    <input type="text" name="user_name" class="form-control" placeholder="Enter name" required>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="user_email" class="form-control" placeholder="Enter email" required>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="user_password" class="form-control" placeholder="Enter password" required>
                </div>

                <div class="form-group">
                    <label>Gender</label> <br>
                    <input type="radio" name="gender" value="male"> Male
                    <input type="radio" name="gender" value="female"> Female
                </div>

                <div class="form-group">
                    <label>About</label>
                    <textarea name="about" class="form-control" rows="3" placeholder="Tell us something about yourself..."></textarea>
                </div>

                <div class="form-check">
                    <input type="checkbox" name="check" required> <span>Agree to terms and conditions</span>
                </div>
                <br>

                <button type="submit" class="btn-primary">Register</button>
            </form>
        </div>
    </div>
</body>
</html>