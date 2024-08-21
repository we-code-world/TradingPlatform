package com.wangdi.tradingplatform.Entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("T_cart")
public class Cart {
    private Integer id;
    private Integer userId;
    private Integer goodsNum;
    private Double priceSum;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
