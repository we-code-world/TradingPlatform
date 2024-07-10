package com.wangdi.tradingplatform.Entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * Created by ASUS on 2020/9/14.
 */
@Data
@TableName("T_admin")
public class Administrator {
    private int id;        //管理员ID
    private String account;    //管理员账号
    private String password;   //管理员密码
}
