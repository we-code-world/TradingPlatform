package com.wangdi.tradingplatform.Service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wangdi.tradingplatform.DAO.CartMapper;
import com.wangdi.tradingplatform.Entity.Cart;
import com.wangdi.tradingplatform.Service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service("CartServiceImpl")
public class CartServiceImpl implements CartService {
   private final CartMapper cartMapper;
    //创建一个购物车
    public int create(Cart cart){
        return cartMapper.insert(cart);
    }
    //根据用户ID查找购物车
    public Cart findByUser(int userid){
        return cartMapper.selectOne(new LambdaQueryWrapper<Cart>().eq(Cart::getUserId,userid));
    }
    //根据购物车ID查找购物车
    public Cart findByID(int id){
        return cartMapper.selectById(id);
    }
    //更改一个购物车的信息
    public int change(Cart cart){
        return cartMapper.update(cart, null);
    }
    //根据一个用户的ID删除一个购物车
    public int delete(int userid){
        return cartMapper.delete(new LambdaQueryWrapper<Cart>().eq(Cart::getUserId,userid));
    }
}
