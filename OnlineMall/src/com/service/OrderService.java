package com.service;

import com.dao.OrderDao;
import com.model.Order;

public class OrderService {
	private OrderDao orderDao;
	public void addOrder(Order order) throws Exception{
        orderDao.addOrder(order);
    }
}
