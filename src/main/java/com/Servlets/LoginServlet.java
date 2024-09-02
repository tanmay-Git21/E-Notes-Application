package com.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Dao.UserDao;
import com.Db.DBconnect;
import com.User.UserDetails;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		
		
		UserDetails us = new UserDetails();
		
		us.setEmail(email);
		us.setPassword(password);
		UserDao u = new UserDao(DBconnect.getConnection());
		
		UserDetails user_logged  = u.loginUser(us);
		
		if(user_logged != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("user_logged", user_logged);
			
			
			response.sendRedirect("user_page.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("log-stat", "invalid user-name or password");
			response.sendRedirect("login.jsp");
		}
	}

}
