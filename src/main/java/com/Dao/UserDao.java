package com.Dao;

import jakarta.servlet.ServletException;
import java.sql.*;

import com.User.UserDetails;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Servlet implementation class UserDao
 */
public class UserDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	private Connection con;
	public UserDao(Connection con) {

		this.con=con;
		
	}
	
	public boolean addUser(UserDetails u1) {
		
		boolean f=false;
		
		
		
		
		try {
			String query = "Insert into user(fullname,email,password) values (?,?,?);";
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, u1.getName());
			p.setString(2, u1.getEmail());
			p.setString(3, u1.getPassword());
			
			int i = p.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
     public UserDetails loginUser(UserDetails us) {
    	 
    	 
    	 UserDetails user_logged= null;
    	 
    	 
    	 try {
    		 
    		 String query ="Select * from user where email=? and password =?";
    		 PreparedStatement p = con.prepareStatement(query);
    		 p.setString(1, us.getEmail());
    		 p.setString(2,us.getPassword());
    		 
    		 ResultSet r = p.executeQuery();
    		 
    		 if(r.next()) {
    			 user_logged = new UserDetails();
    			 user_logged.setName(r.getString("fullname"));
    			 user_logged.setEmail(r.getString("email"));
    			 user_logged.setPassword(r.getString("password"));
    			 user_logged.setId(r.getInt("id"));
    		 }
    		
    		 
    		 
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return user_logged;
    
     }
    

}
