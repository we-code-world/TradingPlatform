package com.wangdi.tradingplatform.Service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.wangdi.tradingplatform.DAO.GoodsMapper;
import com.wangdi.tradingplatform.DAO.TransactionMapper;
import com.wangdi.tradingplatform.Entity.Cart;
import com.wangdi.tradingplatform.Entity.Goods;
import com.wangdi.tradingplatform.Entity.Transaction;
import com.wangdi.tradingplatform.Service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service("CartServiceImpl")
public class CartServiceImpl implements CartService {
   private final TransactionMapper transactionMapper;
   private final GoodsMapper goodsMapper;

    @Override
    public Cart getByUser(int user_id) {
        Cart cart = new Cart();
        cart.setUserId(user_id);
        List<Transaction> transactions = transactionMapper.selectList(new LambdaQueryWrapper<Transaction>()
                .eq(Transaction::getStatus, 0));
        double price = 0.;
        int goods_num = 0;
        for (Transaction t: transactions){
            Goods goods_i = goodsMapper.selectById(t.getGoodsId());
            price += goods_i.getPrice();
            goods_num += 1;
        }
        cart.setPriceSum(price);
        cart.setGoodsNum(goods_num);
        return cart;
    }

    @Override
    public List<Goods> getGoods(int user_id) {
        List<Transaction> transactions = transactionMapper.selectList(new LambdaQueryWrapper<Transaction>()
                .eq(Transaction::getStatus, 0));
        List<Goods> goods = new ArrayList<>();
        for (Transaction t: transactions) goods.add(goodsMapper.selectById(t.getGoodsId()));
        return goods;
    }

    @Override
    public void add(int user_id, int goods_id) {
        Transaction transaction = new Transaction();
        transaction.setBuyerId(user_id);
        transactionMapper.insert(transaction);
    }

    @Override
    public void add(int user_id, List<Goods> goods) {
        for(Goods g:goods){
            Transaction transaction = new Transaction();
            transaction.setBuyerId(user_id);
            transaction.setGoodsId(g.getId());
            transaction.setSellerId(g.getOwnerId());
            transactionMapper.insert(transaction);
        }
    }

    //根据一个用户的ID删除一个购物车
    @Transactional
    public void delete(int userid){
        List<Transaction> transactions = transactionMapper.selectList(new LambdaQueryWrapper<Transaction>()
                .eq(Transaction::getStatus, 0)
                .eq(Transaction::getLogicDelete, 0));
        for(Transaction t: transactions){
            t.setLogicDelete(1);
            transactionMapper.updateById(t);
        }
    }

    @Override
    @Transactional
    public void delete(int user_id, int goods_id) {
        Transaction transaction = transactionMapper.selectOne(new LambdaQueryWrapper<Transaction>()
                .eq(Transaction::getStatus, 0)
                .eq(Transaction::getLogicDelete, 0)
                .eq(Transaction::getBuyerId, user_id));
        transaction.setLogicDelete(1);
        transactionMapper.updateById(transaction);
    }
}
