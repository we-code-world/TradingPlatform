package com.wangdi.tradingplatform;

import com.wangdi.tradingplatform.Annotation.LogAnnotation;
import com.wangdi.tradingplatform.DAO.AdministratorMapper;
import com.wangdi.tradingplatform.DAO.TransactionMapper;
import com.wangdi.tradingplatform.DAO.UserMapper;
import com.wangdi.tradingplatform.Entity.Transaction;
import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Service.AdministratorService;
import com.wangdi.tradingplatform.Service.Impl.AdministratorServiceImpl;
import com.wangdi.tradingplatform.Tools.TokenUtils;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class TradingPlatformApplicationTests {

    private static final Logger log = LoggerFactory.getLogger(TradingPlatformApplicationTests.class);
    @Autowired
    private TransactionMapper transactionMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AdministratorService administratorService;

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
    @LogAnnotation
    public void testTokenUtils(){
        administratorService.delete(155);
        User user = new User();
        user.setAccount("wangdi");
        user.setPassword("wangdi");
        String token = TokenUtils.sign("user_id", user);
        System.out.println(token);
        User res = TokenUtils.design(token, "user_id", User.class);
        System.out.println(res);
    }

}
