package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.model.CartItem;
import com.model.Order;
import com.model.OrderDetail;
import com.model.User;
import com.util.DBUtil;

public class OrderDao {
	public void addOrder(Order order) {
		Connection conn = DBUtil.getConnection();
		String sql = "insert into orders(number,order_id,uname,money) values(?,?,?,?)";
		System.out.println(order.getMoney()+order.getOrder_id());
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, order.getNumber());
			ps.setString(2,order.getOrder_id() );
			ps.setString(3, order.getUname());
			ps.setDouble(4, order.getMoney());
			// ִ�и��²���
			ps.execute();
			// �ͷ���Դ
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void addOrderDetail(Order order, Map<String, CartItem> map) {
		Connection conn = DBUtil.getConnection();
		String sql = "insert into orderdetail(gname,number,order_id,price,uname) values(?,?,?,?,?)";
	
			try {
				for(String key:map.keySet()) {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,map.get(key).getGoods().getGname());
				ps.setInt(2,map.get(key).getQuantity());
				ps.setString(3, order.getOrder_id());
				ps.setDouble(4, map.get(key).getSubtotal());
				ps.setString(5, order.getUname());
				// ִ�и��²���
				ps.execute();
				// �ͷ���Դ
				ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		String sql_update="update goods set number=number-? where gname=?";
		try {
			for(String key:map.keySet()) {
				PreparedStatement ps=conn.prepareStatement(sql_update);
				ps.setInt(1,map.get(key).getQuantity());
				ps.setString(2,map.get(key).getGoods().getGname());
				ps.execute();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	public List<Order> findOrderByUname(User user){
		List<Order> listOrder=new ArrayList<Order>();
		String uname=user.getUname();
		Connection conn=DBUtil.getConnection();
		String sql="select * from orders where uname=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Order order=new Order();
				order.setId(rs.getInt("id"));
				order.setMoney(rs.getDouble("money"));
				order.setNumber(rs.getInt("number"));
				order.setOrder_id(rs.getString("order_id"));
				order.setUname(rs.getString("uname"));
				listOrder.add(order);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return listOrder;
		
	}
	public List<OrderDetail> findOrderDetailById(String Order_id){
		Connection conn=DBUtil.getConnection();
		List<OrderDetail> listOrderDetail=new ArrayList<OrderDetail>();
		String sql="select *from orderdetail where order_id=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Order_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				OrderDetail orderdetail=new OrderDetail();
				orderdetail.setGname(rs.getString("gname"));
				orderdetail.setId(rs.getInt("id"));
				orderdetail.setNumber(rs.getInt("number"));
				orderdetail.setOrder_id(rs.getString("order_id"));
				orderdetail.setUname(rs.getString("uname"));
				orderdetail.setPrice((rs.getDouble("price"))/(rs.getInt("number")));
				listOrderDetail.add(orderdetail);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return listOrderDetail;
		
	}
}
