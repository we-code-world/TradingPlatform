package com.wangdi.tradingplatform.Service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.wangdi.tradingplatform.DAO.TransactionMapper;
import com.wangdi.tradingplatform.Entity.Goods;
import com.wangdi.tradingplatform.Entity.Transaction;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.MessageQueue.Producer.TransactionProducer;
import com.wangdi.tradingplatform.Service.TransactionService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service("TransactionServiceImpl")
public class TransactionServiceImpl implements TransactionService {
    private final TransactionMapper transactionMapper;
    private final TransactionProducer transactionProducer;
    //保存一个新的交易
    @Transactional
    public int save(Transaction transaction){
        return transactionMapper.insert(transaction);
    }
    //根据ID删除一个交易
    public int delete(int id){
        return transactionMapper.deleteById(id);
    }

    @Override
    @Transactional
    public void add(User user, List<Goods> goods) {
        for(Goods g:goods){
            Transaction transaction = new Transaction();
            transaction.setGoodsId(g.getId());
            transaction.setBuyerId(user.getId());
            transaction.setSellerId(g.getOwnerId());
            transactionProducer.sendMessage(transaction);
            transactionMapper.insert(transaction);
        }
    }


}
