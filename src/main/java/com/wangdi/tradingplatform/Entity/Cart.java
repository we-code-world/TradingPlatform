package com.wangdi.tradingplatform.Entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("T_cart")
public class Cart {
    private Integer id;
    private Integer userId;
    private String goodsId;
    private Integer goodsNum;
    private Double priceSum;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;

    public int[] showGoods(){
        if(goodsNum==0){
            return new int[1];
        }
        int[] goods=new int[goodsNum];
        String[] strings = goodsId.split(",",0);
        int i=0;
        for (String string:strings) {
            try {
                goods[i] = Integer.parseInt(string);

            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            finally {
                i++;
            }
        }
        return goods;
    }
}
