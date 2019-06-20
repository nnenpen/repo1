package com.service;

import com.dao.GoodsDao;
import com.model.Cart;
import com.model.CartItem;
import com.model.Goods;

public class CartService {
private GoodsDao dao = new GoodsDao();
    
    public Goods findGood(String gname) throws Exception{
        return dao.selectGoodsByName(gname);
    }

    //ɾ�����ﳵ�еĹ�����
    public void deleteCartItem(String gname, Cart cart) {
        cart.getMap().remove(gname);
    }
    
    //��չ��ﳵ
    public void clearCart(Cart cart) {
        cart.getMap().clear();
    }
    
    //�ı乺���������
    public void changeItemQuantity(String gname, Integer quantity, Cart cart) {
        CartItem item = cart.getMap().get(gname);
        item.setQuantity(item.getQuantity()+quantity);
        System.out.println("����Ϊ"+item.getQuantity());
        if(item.getQuantity()==0){
        	cart.getMap().remove(gname);
        }
    }
}
