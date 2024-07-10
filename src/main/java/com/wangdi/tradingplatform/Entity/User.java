package com.wangdi.tradingplatform.Entity;


import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * Created by  Di Wang on 2024/7/6.
 */
@Data
@TableName("T_user")
public class User {
    private Integer id;        //用户ID
    private String account;    //用户账号
    private String password;   //用户密码
    private Double charge;     //用户余额
    private Integer sex;           //用户性别,1为男，0为女
    private String email;      //用户邮箱
    private String telephone;  //用户手机号码
    private String address;    //用户详细地址
    private String qqAccount;         //用户QQ账号
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private int changeSign;    //用户信息更改标志,0为未更改，1为更改,2为新注册
    private int adminSign;     //管理员审核标志,0为未审核，1为未通过，2为通过
}
