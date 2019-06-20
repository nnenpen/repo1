package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.GoodsDao;
import com.model.Goods;

@WebServlet("/GoodsDelete_do")
public class GoodsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String gname = request.getParameter("gname");
		GoodsDao dao = new GoodsDao();
		dao.deleteGoods(gname);
		List<Goods> goodsList = dao.allGoods();
		request.setAttribute("goodsList", goodsList);
		request.getRequestDispatcher("admin/goodsManage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
