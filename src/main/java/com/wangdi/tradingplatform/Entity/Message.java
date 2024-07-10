package com.wangdi.tradingplatform.Entity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;
/**
 * Created by ASUS on 2020/9/6.
 */
@Data
@TableName("T_message")
public class Message {
    private int id;        // 消息id
    private int senderId;          // 发送者id
    private int receiverId;         // 接受者的id
    private String content;       //消息文本
    private LocalDateTime chat_time;             // 发送时间
}
