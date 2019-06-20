package com.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.dao.OrderDao;
import com.model.Cart;
import com.model.CartItem;
import com.model.Order;
import com.model.User;

@WebServlet("/CountCart")
public class CountCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderid = "";
		Calendar CD = Calendar.getInstance();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
		} else {
			int quantity = 0;
			Cart cart = (Cart) session.getAttribute("cart");
			User user = (User) session.getAttribute("user");
			int YY = CD.get(Calendar.YEAR);
			int MM = CD.get(Calendar.MONTH) + 1;
			int DD = CD.get(Calendar.DATE);
			int HH = CD.get(Calendar.HOUR);
			int NN = CD.get(Calendar.MINUTE);
			int SS = CD.get(Calendar.SECOND);
			int MI = CD.get(Calendar.MILLISECOND);
			orderid = "" + YY + MM + DD + HH + NN + SS + MI + user.getUname();
			System.out.println(orderid);
			Order order = new Order();
			order.setOrder_id(orderid);
			order.setMoney(cart.getTotal());
			order.setUname(user.getUname());
			Map<String, CartItem> map = ((Cart) session.getAttribute("cart")).getMap();
			for (String key : map.keySet()) {// keySet获取map集合key的集合  然后在遍历key即可
				quantity += map.get(key).getQuantity();
			}
			order.setNumber(quantity);

			try {
				addorder(order);
				addorderdetail(order, map);
				session.removeAttribute("cart");
			} catch (Exception e) {
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "购买成功");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}

	private void addorderdetail(Order order, Map<String, CartItem> map) {
		OrderDao orderDao = new OrderDao();
		orderDao.addOrderDetail(order, map);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void addorder(Order order) throws Exception {
		OrderDao orderDao = new OrderDao();
		orderDao.addOrder(order);
	}
}
