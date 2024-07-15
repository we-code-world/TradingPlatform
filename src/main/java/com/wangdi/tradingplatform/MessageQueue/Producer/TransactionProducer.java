package com.wangdi.tradingplatform.MessageQueue.Producer;

import com.wangdi.tradingplatform.Entity.Transaction;
import com.wangdi.tradingplatform.MessageQueue.MessageEntity.MessageEntity;
import lombok.RequiredArgsConstructor;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransactionProducer extends ProducerWrapper<Transaction>{
    public TransactionProducer(@Autowired RocketMQTemplate rocketMQTemplate) {
        super(rocketMQTemplate);
    }

    @Override
    protected MessageEntity getMessageEntity(Transaction messageSendEvent) {
        return MessageEntity.builder()
                .eventName("延迟关闭订单")
                .keys(messageSendEvent.getId().toString())
                .topic("topic_transaction")
                .tag("tag_add")
                .sentTimeout(3000L)
                // RocketMQ 延迟消息级别 1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h
                .delayLevel(14)
                .build();
    }
}
