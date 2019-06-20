package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.User;

@WebServlet("/register_do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {		
		
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        UserDao userDao = new UserDao();
        if (username != null) {
            User user = new User();
            user.setUname(username);
            user.setPasswd(password);;
            user.setEmail(email);
            user.setAddress(address);
            userDao.addUser(user);
            request.setAttribute("info", "注册成功");           
        }else {
            request.setAttribute("info", "注册失败");
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
