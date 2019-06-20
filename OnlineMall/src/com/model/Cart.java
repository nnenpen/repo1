package com.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
	private Map<String, CartItem> map = new LinkedHashMap<String, CartItem>();
	private double total; // ��ס���ﳵ������Ʒ����Ǯ

	public void add(Goods goods) {
		// �����ﳵ����û�У�Ҫ��ӵ����Ӧ�Ĺ�����
		CartItem item = map.get(goods.getGname());
		if (item == null) {
			item = new CartItem();
			item.setGoods(goods);;
			item.setQuantity(1);
			map.put(goods.getGname(), item);
		} else {
			item.setQuantity(item.getQuantity() + 1);
		}
	}

	public Map<String, CartItem> getMap() {
		return map;
	}

	public void setMap(Map<String, CartItem> map) {
		this.map = map;
	}

	public double getTotal() {
		double totalprice = 0;
		 for(Map.Entry<String, CartItem> entry : map.entrySet()){
		  CartItem item = entry.getValue();
		  totalprice += item.getSubtotal();
		 }
		 this.total = totalprice;
		 return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
}
