package com.wangdi.tradingplatform;

import com.wangdi.tradingplatform.DAO.TransactionMapper;
import com.wangdi.tradingplatform.Entity.Transaction;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class TradingPlatformApplicationTests {

    @Autowired
    private TransactionMapper transactionMapper;

    @Test
    public void testMapper(){
        Transaction transaction = new Transaction();
        transaction.setBuyerId(3);
        transaction.setSellerId(5);
        transaction.setGoodsId(100009);
        transactionMapper.insert(transaction);
    }

}
