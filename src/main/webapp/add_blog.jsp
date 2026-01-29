<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Post</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <%@ include file="includes/navbar.jsp" %>

    <div class="container">
        <div class="form-container" style="max-width: 800px;">
            <h2>Write a New Blog</h2>
            <form action="AddBlogServlet" method="post">
                
                <div class="form-group">
                    <label>Blog Title</label>
                    <input type="text" name="title" class="form-control" placeholder="Enter title" required>
                </div>

                <div class="form-group">
                    <label>Image URL (Paste link from web)</label>
                    <input type="url" name="imageUrl" class="form-control" placeholder="https://example.com/image.jpg" required>
                </div>

                <div class="form-group">
                    <label>Content</label>
                    <textarea name="content" class="form-control" rows="10" placeholder="Write your blog content here..." required></textarea>
                </div>

                <button type="submit" class="btn-primary">Publish Blog</button>
            </form>
        </div>
    </div>

</body>
</html>