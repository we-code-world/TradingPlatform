package com.wangdi.tradingplatform.DAO;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangdi.tradingplatform.Entity.Message;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MessageMapper extends BaseMapper<Message> {
//    //保存一条消息
//    int save(Message message);
//    //删除一条消息
//    int delete(int id);
//    // 查询用户收到的消息列表
//    List<Message> findAll();
//    //根据短信息id查一条短信息
//    Message findMessageByID(int id);
//    //根据用户查找消息列表
//    List<Message> findByUser(int uid);
//    //根据发送方和接受方查找消息列表
//    List<Message> findBothSide(Message message);
}
