package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.User;
import com.util.DBUtil;

public class UserDao {
	public boolean userExist(String username) {
		Connection conn = DBUtil.getConnection();

		String sql = "select * from users where uname = ?";

		try {
			System.out.println("���ps");
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				return true;
			}
			resultSet.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
		}
		return false;
	}

	public void addUser(User user) {
		Connection conn = DBUtil.getConnection();
		String sql = "insert into users(uname,passwd,email,address) values(?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUname());
			ps.setString(2, user.getPasswd());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getAddress());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateInfo(User user) {
		Connection conn = DBUtil.getConnection();
		String sql = "update users set passwd=?,email=?,address=? where uname=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getPasswd());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getAddress());
			ps.setString(4, user.getUname());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public User login(String username, String password) {
		User user = null;
		Connection conn = DBUtil.getConnection();
		String sql = "select * from users where uname = ? and passwd = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUname(rs.getString("uname"));
				user.setPasswd(rs.getString("passwd"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
		}
		return user;
	}

	public User queryByName(String username) {
		User user = null;
		Connection conn = DBUtil.getConnection();
		String sql = "select * from users where uname = ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUname(rs.getString("uname"));
				user.setPasswd(rs.getString("passwd"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
		}
		return user;
	}
	
	public List<User> allUser() {
		Connection conn = DBUtil.getConnection();
		List<User> userList = new ArrayList<User>();
		User user = new User();
		String sql = "select * from users";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUname(rs.getString("uname"));
				user.setPasswd(rs.getString("passwd"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
				userList.add(user);
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
		}
		return userList;
	}
	
	public void deleteUser(String username) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from users where uname=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
