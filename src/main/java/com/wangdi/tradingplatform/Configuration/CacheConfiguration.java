package com.wangdi.tradingplatform.Configuration;

import com.wangdi.tradingplatform.Redis.RedisKeySerializer;
import com.wangdi.tradingplatform.Redis.StringRedisTemplateProxy;
import lombok.NoArgsConstructor;
import org.redisson.api.RedissonClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.StringRedisTemplate;

@Configuration
@NoArgsConstructor
public class CacheConfiguration {
    public static final String PREFIX = "framework.cache.redis";
    private static final String prefixCharset = "UTF-8";

    @Bean
    public RedisKeySerializer redisKeySerializer() {
        return new RedisKeySerializer(PREFIX, prefixCharset);
    }

    @Bean
    // 静态代理模式: Redis 客户端代理类增强
    public StringRedisTemplateProxy stringRedisTemplateProxy(RedisKeySerializer redisKeySerializer,
                                                             StringRedisTemplate stringRedisTemplate,
                                                             RedissonClient redissonClient) {
        stringRedisTemplate.setKeySerializer(redisKeySerializer);
        return new StringRedisTemplateProxy(stringRedisTemplate, redissonClient);
    }
}
