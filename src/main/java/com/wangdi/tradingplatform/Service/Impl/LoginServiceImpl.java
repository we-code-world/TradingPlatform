package com.wangdi.tradingplatform.Service.Impl;

import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wangdi.tradingplatform.DAO.AdministratorMapper;
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
    private final AdministratorMapper administratorMapper;
    private final RedissonClient redissonClient;
    private final RBloomFilter<String> userCacheBloomFilter;
    private final DistributedCache distributedCache;

    @Override
    public String checkLogin(String token) {
        if(token == null) return null;
        if(TokenUtils.verify(token)){
            distributedCache.flushKey(token);
            return token;
        }
        User user = distributedCache.get(token, User.class);
        if (user != null) return distributedCache.updateKey(token, TokenUtils.sign(user.getId()));
        Administrator administrator = distributedCache.get(token, Administrator.class);
        if (administrator != null) return distributedCache.updateKey(token, TokenUtils.sign(administrator.getId()));
        return null;
    }

    public String login_user(String account, String passwd) {
        User user = distributedCache.get(account, User.class);
        if (user == null){
            if(!userCacheBloomFilter.contains(account)) return null;
            user = userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getAccount, account));
            if (user == null) return null;
            distributedCache.put(account, user);
        }
        String token = null;
        if(PasswordUtils.verifySaltPassword(passwd, user.getPassword())){
            token = TokenUtils.sign(user.getId());
            distributedCache.put(token, user);
        }
        return token;
    }

    public String login_admin(String account, String passwd) {
        Administrator admin = distributedCache.get(account, Administrator.class);
        if (admin == null){
            if(!userCacheBloomFilter.contains(account)) return null;
            admin = administratorMapper.findByAccount(account);
            if (admin == null) return null;
            distributedCache.put(account, admin);
        }
        String token = null;
        if(PasswordUtils.verifySaltPassword(passwd, admin.getPassword())){
            token = TokenUtils.sign(admin.getId());
            distributedCache.put(token, admin);
        }
        return token;
    }

    @Override
    public String login(String account, String passwd, String role) {
        if("user".equals(role)) return login_user(account, passwd);
        else return login_admin(account, passwd);
    }

    @Override
    public Administrator getAdmin(String token) {
        return distributedCache.get(token, Administrator.class);
    }

    @Override
    public User getUser(String token) {
        return distributedCache.get(token, User.class);
    }

    @Override
    public String login(String account, String passwd) {
        return login_user(account, passwd);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String register(User user){
        if(!userCacheBloomFilter.contains(user.getAccount())){
            userMapper.insert(user);
            userCacheBloomFilter.add(user.getAccount());
        }
        return null;
    }
}
