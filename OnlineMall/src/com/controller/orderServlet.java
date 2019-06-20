package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.OrderDao;
import com.model.Order;
import com.model.User;

/**
 * Servlet implementation class orderServlet
 */
@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		List<Order> listOrder=new ArrayList<Order>();
		User user=(User)session.getAttribute("user");
		if(user==null) {
			request.getRequestDispatcher("jsp/index.jsp").forward(request, response);
		}
		else {
			OrderDao orderDao=new OrderDao();
			listOrder=orderDao.findOrderByUname(user);
			if(!listOrder.isEmpty()) {
				for(Order order :listOrder ) {
					order.setListOrderDetail(orderDao.findOrderDetailById(order.getOrder_id()));
				}
			}
		}
//		System.out.println(listOrder.get(3).getListOrderDetail().get(0).getGname());
		session.setAttribute("listOrder", listOrder);
		request.getRequestDispatcher("jsp/order.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
