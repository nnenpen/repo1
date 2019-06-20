package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.GoodsDao;
import com.model.Goods;

@WebServlet("/Goods_do")
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String search = new String(request.getParameter("search"));
		List<Goods> ListGoods = new ArrayList<>();
		GoodsDao goodsdao = new GoodsDao();

		try {
			ListGoods = goodsdao.selectGoodsBySearch(search);
			request.setAttribute("ListGoods", ListGoods);
		} catch (Exception e) {
			e.printStackTrace();
		}
        request.getRequestDispatcher("/jsp/goodsList.jsp").forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GoodsDao goodsdao = new GoodsDao();
		String Type = new String(request.getParameter("type"));
		List<Goods> ListGoods = new ArrayList<>();
		
		try {
			ListGoods = goodsdao.selectGoodsByType(Type);
			request.setAttribute("ListGoods", ListGoods);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/jsp/goodsList.jsp").forward(request, response);
	}
}
