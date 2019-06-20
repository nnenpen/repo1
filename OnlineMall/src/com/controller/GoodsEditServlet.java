package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.GoodsDao;
import com.model.Goods;

@WebServlet("/GoodsEdit_do")
public class GoodsEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String gname = request.getParameter("gname");
		GoodsDao dao = new GoodsDao();
		Goods goods = new Goods();
		HttpSession session = request.getSession();
		try {
			goods = dao.selectGoodsByName(gname);
			session.setAttribute("goods", goods);
			request.getRequestDispatcher("admin/goodsInfo.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String gname = request.getParameter("gname");
		int number = Integer.parseInt(request.getParameter("number"));
		String type = request.getParameter("type");
		float price = Float.parseFloat(request.getParameter("price"));
		String described = request.getParameter("described");

		GoodsDao dao = new GoodsDao();
		if (gname != null) {
			Goods goods = new Goods();
			
			goods.setGname(gname);;
			goods.setNumber(number);;
			goods.setType(type);
			goods.setPrice(price);;
			goods.setDescribed(described);;
			dao.updateInfo(goods);
			request.setAttribute("info", "修改成功");
		} else {
			request.setAttribute("info", "修改失败");
		}
		List<Goods> goodsList = dao.allGoods();
		request.setAttribute("goodsList", goodsList);
		request.getRequestDispatcher("admin/goodsManage.jsp").forward(request, response);
	}

}
