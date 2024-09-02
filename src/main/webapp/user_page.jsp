<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_components/allCss.jsp"%>
<style type="text/css">
.user_page_image{
	background: url("Images/takingnotes.jpg") no-repeat center center;
	background-size: cover;
	width: 130%;
	height: 90vh;
}
</style>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container user_page_image">
		<div class="card" >
			<div class="card-body" >
				<h1 >Write and Save your Notes.</h1>
				<a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
					
	
			</div>
		</div>
	</div>



	<%@ include file="all_components/allScripts.jsp"%>
</body>
</html>