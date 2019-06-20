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

    //删除购物车中的购物项
    public void deleteCartItem(String gname, Cart cart) {
        cart.getMap().remove(gname);
    }
    
    //清空购物车
    public void clearCart(Cart cart) {
        cart.getMap().clear();
    }
    
    //改变购物项的数量
    public void changeItemQuantity(String gname, Integer quantity, Cart cart) {
        CartItem item = cart.getMap().get(gname);
        item.setQuantity(item.getQuantity()+quantity);
        System.out.println("数量为"+item.getQuantity());
        if(item.getQuantity()==0){
        	cart.getMap().remove(gname);
        }
    }
}
