package com.model;

import java.io.Serializable;

public class CartItem implements Serializable{
	private static final long serialVersionUID = 1L;
	private Goods goods;
	private int quantity;      //数量
	private double subtotal;   //小计
	
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
		 this.subtotal = this.goods.getPrice() * this.quantity;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	@Override
	public String toString() {
		return "CartItem [goods=" + goods + ", quantity=" + quantity + ", subtotal=" + subtotal + "]";
	}
}
