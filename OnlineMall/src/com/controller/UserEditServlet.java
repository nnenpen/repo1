package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.User;

@WebServlet("/UserEdit_do")
public class UserEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		UserDao dao = new UserDao();
		dao.deleteUser(username);
		List<User> userList = dao.allUser();
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("admin/userManage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String address = request.getParameter("address");

		UserDao dao = new UserDao();
		if (username != null) {
			User user = new User();
			user.setUname(username);
			user.setPasswd(password);
			user.setEmail(email);
			user.setAddress(address);
			dao.updateInfo(user);
			request.setAttribute("info", "修改成功");
		} else {
			request.setAttribute("info", "修改失败");
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
