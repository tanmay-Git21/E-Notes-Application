package com.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.Dao.UserDao;
import com.Db.DBconnect;
import com.User.UserDetails;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	public void  doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException {
		
		
		
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		
		
		UserDetails u = new UserDetails();
		
		u.setName(name);
		u.setEmail(email);
		u.setPassword(password);
		
		UserDao uDao = new UserDao(DBconnect.getConnection());
		boolean isSaved = uDao.addUser(u);
		
		
		HttpSession session=request.getSession();
		
		if(isSaved == true) {
				session.setAttribute("reg-stat", "Registration successful");
				response.sendRedirect("register.jsp");
			
		}else {
			session.setAttribute("reg-stat", "Registration failed");
		}
	}
	
	
}
