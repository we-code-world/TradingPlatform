package com.wangdi.tradingplatform.Service;

import com.wangdi.tradingplatform.Entity.Cart;
import com.wangdi.tradingplatform.Entity.Goods;

import java.util.List;

public interface CartService {
    //根据用户ID查找购物车
    Cart getByUser(int user_id);
    //根据购物车ID查找购物车
    List<Goods> getGoods(int user_id);
    // 指定用户添加一个物品
    void add(int user_id, int goods_id);
    // 指定用户添加一些物品
    void add(int user_id, List<Goods> goods);
    // 根据一个用户的ID删除所有物品
    void delete(int user_id);
    // 根据一个用户的ID删除一个物品
    void delete(int user_id, int goods_id);
}
