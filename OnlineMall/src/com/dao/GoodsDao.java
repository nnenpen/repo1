package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Goods;
import com.util.DBUtil;

public class GoodsDao {

	public List<Goods> selectGoodsByType(String type) throws Exception {
		Connection conn = DBUtil.getConnection();
		List<Goods> goodsList = new ArrayList<Goods>();
		Goods goods = new Goods();
		String sql = "select * from goods where types=?";
		System.out.println(type);
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				goods = new Goods();
				goods.setGname(rs.getString("gname"));
				goods.setPhoto(rs.getString("gphoto"));
				goods.setPrice(rs.getFloat("price"));
				goods.setNumber(rs.getInt("number"));
				goods.setDescribed(rs.getString("described"));
				goodsList.add(goods);
			}
			// 释放资源
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
		}
		return goodsList;
	}

	public List<Goods> selectGoodsBySearch(String type) throws Exception {
		Connection conn = DBUtil.getConnection();
		List<Goods> goodsList = new ArrayList<Goods>();
		Goods goods = new Goods();
		String sql = "select * from goods where types like ? or gname like ? or described like ?";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + type + "%");
			ps.setString(2, "%" + type + "%");
			ps.setString(3, "%" + type + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				goods = new Goods();
				goods.setGname(rs.getString("gname"));
				goods.setPhoto(rs.getString("gphoto"));
				goods.setPrice(rs.getFloat("price"));
				goods.setNumber(rs.getInt("number"));
				goods.setDescribed(rs.getString("described"));
				goodsList.add(goods);
			}
			// 释放资源
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
		}
		return goodsList;
	}

	public Goods selectGoodsByName(String Name) throws Exception {
		Connection conn = DBUtil.getConnection();
		Goods goods = new Goods();
		String sql = "select * from goods where gname=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, Name);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				goods = new Goods();
				goods.setGname(rs.getString("gname"));
				goods.setPhoto(rs.getString("gphoto"));
				goods.setPrice(rs.getFloat("price"));
				goods.setNumber(rs.getInt("number"));
				goods.setDescribed(rs.getString("described"));
			}
			// 释放资源
			rs.close();
			ps.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
		}
		return goods;
	}

	public List<Goods> allGoods() {
		Connection conn = DBUtil.getConnection();
		List<Goods> goodsList = new ArrayList<Goods>();
		Goods goods = new Goods();
		String sql = "select * from goods";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				goods = new Goods();
				goods.setGname(rs.getString("gname"));
				goods.setPhoto(rs.getString("gphoto"));
				goods.setPrice(rs.getFloat("price"));
				goods.setNumber(rs.getInt("number"));
				goods.setDescribed(rs.getString("described"));
				goodsList.add(goods);
			}
			// 释放资源
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
		}
		return goodsList;
	}
	
	public void deleteGoods(String gname) {
		// 获取数据库连接
		Connection conn = DBUtil.getConnection();
		// 插入信息的sql语句
		String sql = "delete from goods where gname=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, gname);
			// 执行更新操作
			ps.executeUpdate();
			// 释放资源
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateInfo(Goods goods) {
		// 获取数据库连接
		Connection conn = DBUtil.getConnection();
		// 插入信息的sql语句
		String sql = "update goods set number=?,types=?,price=?,described=? where gname=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, goods.getNumber());
			ps.setString(2, goods.getType());
			ps.setFloat(3, goods.getPrice());
			ps.setString(4, goods.getDescribed());
			ps.setString(5, goods.getGname());
			// 执行更新操作
			ps.executeUpdate();
			// 释放资源
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
