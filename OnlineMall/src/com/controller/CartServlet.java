package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.GoodsDao;
import com.model.Cart;
import com.model.Goods;

@WebServlet("/Cart_do")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message="";
		String gname = request.getParameter("goodsName");
		GoodsDao dao = new GoodsDao();
		Goods goods;
		try {
			goods = dao.selectGoodsByName(gname);
			HttpSession session = request.getSession();
			
			Cart cart = (Cart) session.getAttribute("cart");

			if (cart == null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			
			if(goods.getNumber()>=1&&(cart.getMap().get(goods.getGname())==null)) {
				cart.add(goods);message="加入购物车成功";
			}else if(cart.getMap().get(goods.getGname())!=null&&cart.getMap().get(goods.getGname()).getQuantity()+1<=goods.getNumber()){
				cart.add(goods);
				message="加入购物车成功";			
			}else{
				message="该商品库存小于购物车中改商品的数量，加入购物车失败";
			}
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println(message);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
