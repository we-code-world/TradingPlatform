package com.wangdi.tradingplatform.MessageQueue.Consumer;

import com.wangdi.tradingplatform.Entity.Transaction;
import com.wangdi.tradingplatform.MessageQueue.MessageEntity.MessageWrapper;
import com.wangdi.tradingplatform.Service.TransactionService;
import lombok.RequiredArgsConstructor;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@RequiredArgsConstructor
@RocketMQMessageListener(
        consumerGroup = "cg_transaction", topic = "topic_transaction", selectorExpression = "tag_add")
public class TransactionConsumer implements RocketMQListener<MessageWrapper<Transaction>> {
    private final TransactionService transactionService;
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void onMessage(MessageWrapper<Transaction> transactionMsg) {
        Transaction msg = transactionMsg.getMessage();
        transactionService.save(msg);
    }
}
