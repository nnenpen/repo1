package com.model;

import java.io.Serializable;

public class Goods implements Serializable{
	private static final long serialVersionUID = 1L;
	// ��Ʒ��
	private String gname;
	// ����
	private int number;
	// ��Ƭ��
	private String photo;
	// ����
	private String type;
	// �۸�
	private float price;
	// ����
	private String described;

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDescribed() {
		return described;
	}

	public void setDescribed(String described) {
		this.described = described;
	}

	@Override
	public String toString() {
		return "Goods [gname=" + gname + ", number=" + number + ", photo=" + photo + ", type=" + type + ", price="
				+ price + ", described=" + described + "]";
	}
}
