<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.Dao.PostDao, com.Db.DBconnect, java.util.List, com.User.Post, com.User.UserDetails"%>

<%
UserDetails us1 = (UserDetails) session.getAttribute("user_logged");
if (us1 == null) {
	session.setAttribute("login-error", "Please Login..");
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes Page</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>

	<div class="container">
		<h2 class="text-center">All Notes</h2>
		<div class="row">
			<div class="col-md-12">
				<%
				PostDao pd = new PostDao(DBconnect.getConnection());
				List<Post> posts = pd.getData(us1.getId());

				if (posts != null && !posts.isEmpty()) {
					for (Post post : posts) {
				%>
				<div class="card w-75 mb-3">
					<div class="card-body">
						<h5 class="card-title"><%=post.getTitle()%></h5>
						<p class="card-text"><%=post.getContent()%></p>
						<a href="DeleteNoteServlet?id=<%=post.getId()%>"
							class="btn btn-danger">Delete</a>
					</div>
				</div>
				<%
				}
				} else {
				%>
				<p>No notes available. Please add some notes.</p>
				<%
				}
				%>

			</div>
		</div>
	</div>
</body>
</html>
