package com.wangdi.tradingplatform.MessageQueue.Producer;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.wangdi.tradingplatform.MessageQueue.MessageEntity.MessageEntity;
import com.wangdi.tradingplatform.MessageQueue.MessageEntity.MessageWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.MessageConst;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import java.util.Optional;
import java.util.UUID;

@Slf4j
@RequiredArgsConstructor
public abstract class ProducerWrapper<T> {
    private final RocketMQTemplate rocketMQTemplate;

    protected abstract MessageEntity getMessageEntity(T messageSendEvent);

    public SendResult sendMessage(T messageSendEvent) {
        MessageEntity msgEntity = getMessageEntity(messageSendEvent);
        String keys = StrUtil.isEmpty(msgEntity.getKeys()) ? UUID.randomUUID().toString() : msgEntity.getKeys();
        Message<?> message = MessageBuilder
                .withPayload(new MessageWrapper<T>(msgEntity.getKeys(), messageSendEvent))
                .setHeader(MessageConst.PROPERTY_KEYS, keys)
                .setHeader(MessageConst.PROPERTY_TAGS, msgEntity.getTag())
                .build();
        SendResult sendResult;
        try {
            StringBuilder destinationBuilder = StrUtil.builder().append(msgEntity.getTopic());
            if (StrUtil.isNotBlank(msgEntity.getTag())) {
                destinationBuilder.append(":").append(msgEntity.getTag());
            }
            sendResult = rocketMQTemplate.syncSend(
                    destinationBuilder.toString(),
                    message,
                    msgEntity.getSentTimeout(),
                    Optional.ofNullable(msgEntity.getDelayLevel()).orElse(0)
            );
            log.info("[{}] 消息发送结果：{}，消息ID：{}，消息Keys：{}", msgEntity.getEventName(), sendResult.getSendStatus(), sendResult.getMsgId(), msgEntity.getKeys());
        } catch (Throwable ex) {
            log.error("[{}] 消息发送失败，消息体：{}", msgEntity.getEventName(), JSON.toJSONString(messageSendEvent), ex);
            throw ex;
        }
        return sendResult;
    }
}
