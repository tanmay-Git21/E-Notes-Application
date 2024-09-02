package com.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Dao.PostDao;
import com.Db.DBconnect;
import com.User.Post;

/**
 * Servlet implementation class AddNotesServlet
 */
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PostDao dao = new PostDao(DBconnect.getConnection());
		boolean f = dao.AddNotes(title, content, uid);
		if(f) {
			System.out.println("Data inserted succesfullly");
		}else {
			System.out.println("Not inserted");
		}
	}

}
