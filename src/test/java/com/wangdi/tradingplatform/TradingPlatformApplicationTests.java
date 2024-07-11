package com.wangdi.tradingplatform;

import com.wangdi.tradingplatform.DAO.TransactionMapper;
import com.wangdi.tradingplatform.DAO.UserMapper;
import com.wangdi.tradingplatform.Entity.Transaction;
import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Tools.TokenUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class TradingPlatformApplicationTests {

    @Autowired
    private TransactionMapper transactionMapper;
    @Autowired
    private UserMapper userMapper;

    @Test
    public void testMapper(){
        Transaction transaction = new Transaction();
        transaction.setBuyerId(3);
        transaction.setSellerId(5);
        transaction.setGoodsId(100009);
        transactionMapper.insert(transaction);
    }

    @Test
    public void testUserMapper(){
        User user = new User();
        user.setAccount("wangdi");
        user.setPassword("wangdi");
        user.setAdminSign(0);
        userMapper.insert(user);
    }
    @Test
    public void testTokenUtils(){
        String token = TokenUtils.sign("user_id", 1);
        System.out.println(token);
        String res = TokenUtils.design(token, "user_id");
        System.out.println(res);
    }

}
