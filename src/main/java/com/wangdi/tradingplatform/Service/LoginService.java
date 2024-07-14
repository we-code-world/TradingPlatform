package com.wangdi.tradingplatform.Service;

import com.wangdi.tradingplatform.Entity.Administrator;
import com.wangdi.tradingplatform.Entity.User;

public interface LoginService{

    Administrator getLoginAdmin(String token);

    String checkLogin(String token);

    boolean checkPasswd(String account, String passwd);

    String getPasswd(String account);

    String register(User user);
}
