<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="com.User.UserDetails" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_components/allCss.jsp"%>

</head>
<body>
	<div class="container-fluid">
		<%@ include file="all_components/navbar.jsp"%>
		<h1 class="text-center">Add your notes.</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
					
					
					
						<div class="mb-3">
							<input type="hidden" value="<%= us.getId()  %>" name="uid">

							<label for="exampleInputEmail1" class="form-label">Enter
								title</label> <input type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required>

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1" class="form-label">Enter
								content</label>
							<textarea rows="9" cols="" class="form-control " name="content" required></textarea>
						</div>

						<button type="submit" class="btn btn-primary">Add</button>
					</form>

				</div>

			</div>

		</div>

	</div>


</body>
</html>