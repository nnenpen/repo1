
package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.dao.OrderDao;
import com.model.Order;
import com.model.User;

@WebServlet("/AdminOrder")
public class AdminOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("search");
		System.out.println(uname);
		User user = new User();
		user.setUname(uname);
		List<Order> adminlistOrder = new ArrayList<Order>();
		OrderDao orderDao = new OrderDao();
		adminlistOrder = orderDao.findOrderByUname(user);
		if (!adminlistOrder.isEmpty()) {
			for (Order order : adminlistOrder) {
				order.setListOrderDetail(orderDao.findOrderDetailById(order.getOrder_id()));
			}
			request.removeAttribute("adminlistOrder");
			request.setAttribute("adminlistOrder", adminlistOrder);
			request.getRequestDispatcher("admin/findOrder.jsp").forward(request, response);
		} else {
			JOptionPane.showMessageDialog(null, "该用户未购买商品");
			request.getRequestDispatcher("admin/findOrder.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
