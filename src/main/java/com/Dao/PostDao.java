package com.Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;
import com.User.UserDetails;

public class PostDao {

	private Connection conn;

	public PostDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean AddNotes(String ti, String co, int us) {

		boolean f = false;

		try {
			String query = "insert into posts(title , content , uid ) values (?,?,?)";

			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, us);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Post> getData(int id){
		ArrayList <Post> postLists = new ArrayList<Post>();
		Post post = new Post();
		
		try {
			String query = "select * from enotes.posts where uid=?";
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				post.setId(rs.getInt(1));
				post.setTitle(rs.getString(2));
				post.setContent(rs.getString(3));
				postLists.add(post);
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return postLists;
	}

}
