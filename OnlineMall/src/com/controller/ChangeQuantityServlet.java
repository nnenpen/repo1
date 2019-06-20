package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Cart;
import com.service.CartService;

@WebServlet("/ChangeQuantity_do")
public class ChangeQuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("gname");
		int sign = Integer.parseInt(request.getParameter("sign"));
		int quantity = 0;
		if(sign==1) {
			quantity=1;
		}else {
			quantity=-1;
		}
		 Cart cart = (Cart) request.getSession().getAttribute("cart");		 
		 CartService service = new CartService();
		 service.changeItemQuantity(id,quantity,cart);		 

		 request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
