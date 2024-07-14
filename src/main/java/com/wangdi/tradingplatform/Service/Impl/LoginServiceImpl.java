package com.wangdi.tradingplatform.Service.Impl;

import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wangdi.tradingplatform.DAO.UserMapper;
import com.wangdi.tradingplatform.Entity.Administrator;
import com.wangdi.tradingplatform.Entity.User;
import com.wangdi.tradingplatform.Redis.DistributedCache;
import com.wangdi.tradingplatform.Service.LoginService;
import com.wangdi.tradingplatform.Tools.PasswordUtils;
import com.wangdi.tradingplatform.Tools.TokenUtils;
import lombok.RequiredArgsConstructor;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Override
    public String checkLogin(String token) {
        if(TokenUtils.verify(token)){
            distributedCache.flushKey(token);
            return token;
        }else{
            User user = distributedCache.get(token, User.class);
            if (user != null) return distributedCache.updateKey(token, TokenUtils.sign(user.getId()));
        }
        return null;
    }

    @Override
    public boolean checkPasswd(String account, String passwd) {
        String password = distributedCache.get(account, String.class);
        if (password == null) password = getPasswd(account);
        return password != null && PasswordUtils.verifySaltPassword(passwd, password);
    }

    @Override
    public String getPasswd(String account) {
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getAccount, account));
        return user.getPassword();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String register(User user){
        return "";
    }
}
