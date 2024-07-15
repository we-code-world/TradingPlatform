package com.wangdi.tradingplatform.Service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.wangdi.tradingplatform.DAO.TransactionMapper;
import com.wangdi.tradingplatform.Entity.Transaction;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
    //根据ID更新一个交易
    public int updateByid(Transaction deal){
        return transactionMapper.updateById(deal);
    }
    //根据ID查找一个交易
    public Transaction findByID(int id){
        return transactionMapper.selectById(id);
    }
    //分页实现匹配符合要求的交易列表
    public PageInfo<Transaction> pagematching(Transaction transaction,int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<Transaction> list = transactionMapper.selectList(new LambdaQueryWrapper<Transaction>().eq(Transaction::getBuyerId, transaction.getBuyerId()));
//        List<Transaction> list = transactionMapper.matching(transaction);
        return new PageInfo<Transaction>(list);
    }
    //匹配符合要求的交易列表
    public List<Transaction> matching(Transaction transaction){
        return transactionMapper.matching(transaction);
    }
    //分页实现根据卖方id查找交易列表
    public PageInfo<Transaction> pagefindBySeller(int Sid,int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<Transaction> list = transactionMapper.selectList(new LambdaQueryWrapper<Transaction>().eq(Transaction::getSellerId, Sid));
        return new PageInfo<Transaction>(list);
    }
    //根据卖方id查找交易列表
    public List<Transaction> findBySeller(int Sid){
        return transactionMapper.selectList(new LambdaQueryWrapper<Transaction>().eq(Transaction::getSellerId, Sid));
    }
    //分页实现根据买方id查找交易列表
    public PageInfo<Transaction> pagefindByBuyer(int Bid,int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<Transaction> list = transactionMapper.selectList(new LambdaQueryWrapper<Transaction>().eq(Transaction::getBuyerId, Bid));
        return new PageInfo<Transaction>(list);
    }
    //根据买方id查找交易列表
    public List<Transaction> findByBuyer(int Bid){
        return transactionMapper.selectList(new LambdaQueryWrapper<Transaction>().eq(Transaction::getBuyerId, Bid));
    }
    //分页实现根据物品id查找交易列表
    public PageInfo<Transaction> pagefindByGoods(int Gid,int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<Transaction> list = transactionMapper.selectList(new LambdaQueryWrapper<Transaction>().eq(Transaction::getGoodsId, Gid));
        return new PageInfo<Transaction>(list);
    }
    //根据物品id查找交易列表
    public List<Transaction> findByGoods(int Gid){
        return transactionMapper.selectList(new LambdaQueryWrapper<Transaction>().eq(Transaction::getGoodsId, Gid));
    }
    //分页实现根据交易状态查找交易列表
    public PageInfo<Transaction> pagefindByStatus(int status,int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<Transaction> list = transactionMapper.selectList(new LambdaQueryWrapper<Transaction>().eq(Transaction::getStatus, status));
        return new PageInfo<Transaction>(list);
    }
    //根据交易状态查找交易列表
    public List<Transaction> findByStatus(int status){
        return transactionMapper.selectList(new LambdaQueryWrapper<Transaction>().eq(Transaction::getStatus, status));
    }
    //分页实现查找所有的交易
    public PageInfo<Transaction> pagefindAll(int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<Transaction> list = transactionMapper.selectList(null);
        return new PageInfo<Transaction>(list);
    }
    //查找所有的交易
    public List<Transaction> findAll(){
        return transactionMapper.selectList(null);
    }
}
