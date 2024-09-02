<%@ page import="com.User.UserDetails"%>

<nav
	class="navbar navbar-expand-lg navbar-danger bg-info bg-gradient text-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i
			class="fa-solid fa-note-sticky"></i> E-Notes</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<%
					    UserDetails us = (UserDetails) session.getAttribute("user_logged");
					    String homeUrl = "login.jsp"; 
					    String showNotesUrl = "login.jsp";// Default URL if not logged in
					    if (us != null) {
					        homeUrl = "user_page.jsp"; // URL if logged in
					        showNotesUrl = "showNotes.jsp";
					    }
					%>
					<a class="nav-link active" aria-current="page" href="<%= homeUrl %>">Home</a>
				</li class="nav-item">
					<a class="nav-link " aria-curent="page" href="<%= showNotesUrl %>">Show Notes</a>
				<li>
			</ul>
			<%
			UserDetails logged_user = (UserDetails) session.getAttribute("user_logged");

			if (logged_user != null) {
			%>
			<!-- User is logged in -->
			<a href="#" class="btn btn-dark mx-2" type="button"
				data-bs-toggle="modal" data-bs-target="#exampleModal"> <i
				class="fa fa-user" aria-hidden="true"></i> <%=logged_user.getName()%>
			</a> 
			<a href="LogoutServlet" class="btn btn-dark mx-2" type="button">
				<i class="fa fa-sign-out-alt" aria-hidden="true"></i> Logout
			</a>
			<!-- Profile Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Edit
								Your Profile</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="UpdateUserServlet" method="post">
								<div class="mb-3">
									<label for="userId" class="form-label">User ID</label> 
									<input type="text" class="form-control" id="userId" name="user_id"
										value="<%=logged_user.getId()%>" readonly>
								</div>
								<div class="mb-3">
									<label for="userName" class="form-label">User Name</label> 
									<input type="text" class="form-control" id="userName"
										name="user_name" value="<%=logged_user.getName()%>">
								</div>
								<div class="mb-3">
									<label for="userEmail" class="form-label">Email ID</label> 
									<input type="email" class="form-control" id="userEmail"
										name="user_email" value="<%=logged_user.getEmail()%>">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Save
										changes</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%
			} else {
			%>
			<!-- User is not logged in -->
			<a href="login.jsp" class="btn btn-dark mx-2" type="button"> <i
				class="fa fa-sign-in" aria-hidden="true"></i> Login
			</a> 
			<a href="register.jsp" class="btn btn-dark" type="button"> <i
				class="fa-solid fa-user-plus"></i> Register
			</a>
			<%
			}
			%>
		</div>
	</div>
</nav>
