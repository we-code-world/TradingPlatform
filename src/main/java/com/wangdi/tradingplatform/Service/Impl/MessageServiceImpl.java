package com.wangdi.tradingplatform.Service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wangdi.tradingplatform.DAO.MessageMapper;
import com.wangdi.tradingplatform.Entity.Message;
import com.wangdi.tradingplatform.Service.MessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service("MessageServiceImpl")
public class MessageServiceImpl implements MessageService {
    private final MessageMapper messageMapper;
    //保存一条消息
    public int save(Message message){
        return messageMapper.insert(message);
    }
    //删除一条消息
    public int delete(int id){
        return messageMapper.delete(new QueryWrapper<Message>().eq("id", id));
    }
    // 查询用户收到的消息列表
    public List<Message> findAll(){
        return messageMapper.selectList(null);
    }
    //根据短信息id查一条短信息
    public Message findMessageByID(int id){
        return messageMapper.selectById(id);
    }
    //根据用户查找消息列表
    public List<Message> findByUser(int uid){ return messageMapper.selectList(new QueryWrapper<Message>().eq("sender_id", uid)); }
    //根据发送方和接受方查找消息列表
    public List<Message> findBothSide(Message message){
        return messageMapper.selectList(new QueryWrapper<Message>().eq("sender_id", message.getSenderId()).eq("receiver_id", message.getReceiverId()));
    }
}
