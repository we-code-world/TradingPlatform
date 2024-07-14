package com.wangdi.tradingplatform.Service.Impl;

import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.wangdi.tradingplatform.DAO.UserMapper;
import com.wangdi.tradingplatform.Entity.Administrator;
import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Redis.DistributedCache;
import com.wangdi.tradingplatform.Service.LoginService;
import com.wangdi.tradingplatform.Tools.PasswordUtils;
import lombok.RequiredArgsConstructor;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {
    private final UserMapper userMapper;
    private final RedissonClient redissonClient;
    private final RBloomFilter<String> userCacheBloomFilter;
    private final DistributedCache distributedCache;

    @Override
    public Administrator getLoginAdmin(String token) {
        return null;
    }

    public String getPasswd(User user) {
        //        String md5_passwd = PasswordUtils.generateSaltPassword(password);
        distributedCache.put(user.getAccount(), JSON.toJSONString(user), 30, TimeUnit.MINUTES);
        return user.getPassword();
    }

    @Override
    public boolean checkLogin(String account, String password, String role) {
        //        String md5_passwd = PasswordUtils.generateSaltPassword(password);
        String passwd = userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getAccount, account)).getPassword();
        return PasswordUtils.verifySaltPassword(password, passwd);
    }
}
