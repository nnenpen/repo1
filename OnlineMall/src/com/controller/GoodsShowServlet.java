package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.GoodsDao;
import com.model.Goods;

@WebServlet("/GoodsShow_do")
public class GoodsShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String goodsName = request.getParameter("goodsName");
		GoodsDao goodsdao = new GoodsDao();
		Goods goods = new Goods();
		try {
			goods = goodsdao.selectGoodsByName(goodsName);
			request.setAttribute("goods", goods);
		} catch (Exception e) {
			e.printStackTrace();
		}
        request.getRequestDispatcher("/jsp/goods.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
