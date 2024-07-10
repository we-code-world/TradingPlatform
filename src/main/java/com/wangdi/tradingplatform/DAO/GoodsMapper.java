package com.wangdi.tradingplatform.DAO;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangdi.tradingplatform.Entity.Goods;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsMapper extends BaseMapper<Goods> {
}
