package com.wangdi.tradingplatform.Entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * Created by ASUS on 2020/9/6.
 */
@Data
@TableName("T_goods")
public class Goods {
    private int id;           // 展示想买的商品id
    private String name;      // 商品名
    private double Price;             //价格
    private double realPrice;         //原始价格
    private int ownerId;              // 用户id
    private String pictureUrl;            // 商品信息
    private String describe;            // 商品信息
    private int type;           //物品类别
    private int catalogId;           //物品类别，1闲置数码，2校园代步，3电器日用，4图书教材，5美妆衣物，6运动棋牌，7票劵小物
    private LocalDateTime create_time;               //上架时间
    private LocalDateTime update_time;               //修改时间
    private boolean logic_delete;    //逻辑删除
}
