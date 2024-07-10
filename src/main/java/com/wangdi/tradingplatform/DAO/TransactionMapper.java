package com.wangdi.tradingplatform.DAO;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangdi.tradingplatform.Entity.Transaction;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TransactionMapper extends BaseMapper<Transaction> {
    //匹配符合要求的交易列表
    List<Transaction> matching(Transaction transaction);
}
