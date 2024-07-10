package com.wangdi.tradingplatform.Service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangdi.tradingplatform.DAO.GoodsMapper;
import com.wangdi.tradingplatform.Entity.Goods;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service("GoodsServiceImpl")
public class GoodsServiceImpl implements GoodsService {
    private final GoodsMapper goodsMapper;
    //上传一个新的求购信息
    public int save(Goods wtb){
        return goodsMapper.insert(wtb);
    }
    //通过ID删除一个求购信息
    public int delete(int id){
        return goodsMapper.deleteById(id);
    }
    //通过ID更新一个求购信息
    public int updateByID(Goods goods){
        return goodsMapper.updateById(goods);
    }
    //通过ID查找一个求购信息
    public Goods findByID(int id){
        return goodsMapper.selectById(id);
    }
    //通过求购用户和管理员确认查找求购信息
    public List<Goods> findBuysByUser(int uid){
        return goodsMapper.selectList(new LambdaQueryWrapper<Goods>().eq(Goods::getOwnerId, uid).eq(Goods::getType, 0));
    }
    //通过求购用户和管理员确认查找求购信息
    public List<Goods> findSellsByUser(int uid){
        return goodsMapper.selectList(new LambdaQueryWrapper<Goods>().eq(Goods::getOwnerId, uid).eq(Goods::getType, 1));
    }
    //通过求购用户和管理员确认查找求购信息
    public List<Goods> findByGoods(Goods goods){
        return goodsMapper.selectList(new LambdaQueryWrapper<Goods>().eq(Goods::getOwnerId, goods.getOwnerId()).eq(Goods::getType, goods.getType()));
    }
    //查找所有的求购信息
    public List<Goods> findAll(){
        return goodsMapper.selectList(null);
    }
    //分页实现查找所有的求购信息
    public PageInfo<Goods> pageAll(int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<Goods> list = goodsMapper.selectList(null);
        return new PageInfo<Goods>(list);
    }
}
