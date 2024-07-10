package com.wangdi.tradingplatform.Service;

import com.wangdi.tradingplatform.Entity.Cart;

public interface CartService {
    //创建一个购物车
    int create(Cart cart);
    //根据用户ID查找购物车
    Cart findByUser(int userid);
    //根据购物车ID查找购物车
    Cart findByID(int id);
    //更改一个购物车的信息
    int change(Cart cart);
    //根据一个用户的ID删除一个购物车
    int delete(int userid);
}
