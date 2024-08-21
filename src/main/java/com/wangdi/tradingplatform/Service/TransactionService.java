package com.wangdi.tradingplatform.Service;

import com.wangdi.tradingplatform.Entity.Goods;
import com.wangdi.tradingplatform.Entity.Transaction;
import com.wangdi.tradingplatform.Entity.User;

import java.util.List;

public interface TransactionService {
    //保存一个新的交易
    int save(Transaction transaction);
    //根据ID删除一个交易
    int delete(int id);
    // 添加交易信息
    void add(User user, List<Goods> goods);
}
