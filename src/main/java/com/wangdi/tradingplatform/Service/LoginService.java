package com.wangdi.tradingplatform.Service;

import com.wangdi.tradingplatform.Entity.Administrator;

public interface LoginService{

    Administrator getLoginAdmin(String token);

    boolean checkLogin(String account, String password, String role);
}
