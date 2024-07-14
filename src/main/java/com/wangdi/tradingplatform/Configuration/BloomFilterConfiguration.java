package com.wangdi.tradingplatform.Configuration;

import lombok.NoArgsConstructor;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
@NoArgsConstructor
public class BloomFilterConfiguration {
    private static final String BloomFilterName = "userCache";
    private static final long expectedInsertions = 64L;
    private static final double falseProbability = 0.03D;

    @Bean
    public RBloomFilter<String> userCacheBloomFilter(RedissonClient redissonClient) {
        RBloomFilter<String> cachePenetrationBloomFilter = redissonClient.getBloomFilter(BloomFilterName);
        cachePenetrationBloomFilter.tryInit(expectedInsertions, falseProbability);
        return cachePenetrationBloomFilter;
    }
}
