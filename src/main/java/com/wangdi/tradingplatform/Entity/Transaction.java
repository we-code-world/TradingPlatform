package com.wangdi.tradingplatform.Entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * Created by ASUS on 2020/9/6.
 */
@Data
@TableName("T_transaction")
public class Transaction {
    private int id;       //交易号
    private int buyerId;              //买方ID
    private int sellerId;             //卖方ID
    private int goodsId;              //商品ID
    private int status;               //交易状态
    private LocalDateTime createTime;                 //交易时间
    private LocalDateTime updateTime;                 //更新时间
    private LocalDateTime endTime;                 //交易时间
}
