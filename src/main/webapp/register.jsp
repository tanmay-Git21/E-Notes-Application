<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>

	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid my-4 ">
		<div class="row">
			<div class="col-md-5 offset-md-3">
				<div class="card p-4">
					<div class="card-header text-center">
						<i class="fa-solid fa-user-pen"></i>
						<h3>Registration</h3>
					</div>
					<div class="card-body">
						<%
						// Retrieve status from session
						String status = (String) session.getAttribute("reg-stat");

						// Check if status is not null and display appropriate message
						if (status != null) {
							if (status.equals("Registration successful")) {
						%>
						<div class="alert alert-success alert-dismissible fade show"
							role="alert">
							<strong><%=status%></strong><a href="login.jsp">Login here</a>
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
						<%
						} else if (status.equals("Registration failed")) {
						%>
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							<strong><%=status%></strong> You should check in on some of those
							fields below.
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
						<%
						}
						// Remove the status attribute to avoid displaying the message on refresh 
						session.removeAttribute("reg-stat");
						}
						%>
					</div>
					<form action="UserServlet" method="post">
						<div class="mb-3">
							<label for="exampleInputUserName1" class="form-label">Full
								Name</label> <input type="text" class="form-control"
								id="exampleInputUserName1" name="user_name" required>
						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email
								address</label> <input type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								name="user_email" required>
							<div id="emailHelp" class="form-text">We'll never share
								your email with anyone else.</div>
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Password</label>
							<input type="password" class="form-control"
								id="exampleInputPassword1" name="user_password" required>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_components/allScripts.jsp"%>
</body>
</html>
