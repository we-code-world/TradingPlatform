package com.wangdi.tradingplatform.Consumer;

import com.wangdi.tradingplatform.Entity.Transaction;
import lombok.RequiredArgsConstructor;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@RequiredArgsConstructor
@RocketMQMessageListener(
        consumerGroup = "", topic = "", selectorExpression = "")
public class TransactionConsumer implements RocketMQListener<Transaction> {
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void onMessage(Transaction transaction) {

    }
}
