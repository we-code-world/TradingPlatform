package com.wangdi.tradingplatform.Service;

import com.wangdi.tradingplatform.Entity.Administrator;

public interface LoginService{

    Administrator getLoginAdmin(String token);
}
