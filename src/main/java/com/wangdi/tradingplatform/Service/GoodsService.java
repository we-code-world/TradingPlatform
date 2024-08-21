package com.wangdi.tradingplatform.Service;

import com.github.pagehelper.PageInfo;
import com.wangdi.tradingplatform.Entity.Goods;

import java.util.List;

public interface GoodsService {
    // 添加一个物品
    int save(Goods goods);
    //通过ID删除一个物品信息
    int delete(int id);
    //通过ID更新一个物品信息
    int updateByID(Goods goods);
    //通过ID查找一个物品信息
    Goods findByID(int id);
    //通过求购用户确认查找求购信息
    List<Goods> findBuysByUser(int uid);
    //通过卖家查找求购信息
    List<Goods> findSellsByUser(int uid);
    //通过求购用户和管理员确认查找求购信息
    List<Goods> findByGoods(Goods goods);
    //查找所有的求购信息
    List<Goods> findAll();
    //分页实现查找所有的求购信息
    PageInfo<Goods> pageAll(int pageNum,int pageSize);
}
