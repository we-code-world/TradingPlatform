package com.wangdi.tradingplatform.Service;

import com.wangdi.tradingplatform.Entity.Administrator;
import com.wangdi.tradingplatform.Entity.User;

public interface LoginService{
    // 用户注册
    String register(User user);
    // token验证登录，token过期则通过redis缓存刷新token
    String checkLogin(String token);
    // 用户登录验证
    String login(String account, String passwd);
    // 用户登录验证
    String login(String account, String passwd, String role);
    // 根据token获取管理员
    Administrator getAdmin(String token);
    // 根据token获取用户
    User getUser(String token);
}
