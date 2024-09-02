package com.Db;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Servlet implementation class DBconnect
 */
public class DBconnect extends HttpServlet {
	private static final long serialVersionUID = 1L;

// 	
	private static Connection con = null;

	public static Connection getConnection() {

		try {
			if (con == null) {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "iloveSql_21");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

}
