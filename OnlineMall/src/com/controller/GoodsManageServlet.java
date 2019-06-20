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


@WebServlet("/GoodsManage_do")
public class GoodsManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GoodsDao dao =new GoodsDao();
		List<Goods> goodsList = dao.allGoods();
		request.setAttribute("goodsList", goodsList);
		request.getRequestDispatcher("admin/goodsManage.jsp").forward(request, response);
	}
}
