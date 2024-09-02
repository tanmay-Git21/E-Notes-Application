<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.Db.DBconnect,com.User.UserDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home_page</title>

<style type="text/css">
.back_img {
	background: url("Images/notes.jpg") no-repeat center center;
	background-size: cover;
	width: 100%;
	height: 90vh;
}
</style>


<%@include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>

    <%
    Connection con = null;
    try {
        con = DBconnect.getConnection();
        if (con != null) {
            System.out.println("Connection established: " + con);
        } else {
            System.out.println("Failed to establish connection.");
        }
    } catch (Exception e) {
        System.out.println("Exception: " + e.getMessage());
    }
    
    
   
    
    %>

	<div class="container-fluid back_img">
		<div class="text-center">
			<h1>Write and Save your notes .</h1>
			<a href="login.jsp" class="btn  btn-dark">
			<i class="fa fa-sign-in" aria-hidden="true"></i>
			Login</a> 
			<a href="register.jsp" class="btn  btn-dark">
			<i class="fa-solid fa-user-plus"></i>
			Register</a>
		</div>
	</div>

	<%@ include file="all_components/footer.jsp"%>





	<%@ include file="all_components/allScripts.jsp"%>
</body>
</html>