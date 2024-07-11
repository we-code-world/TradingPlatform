package com.wangdi.tradingplatform.Redis;

import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

public class JsonRedisTemplate extends RedisTemplate<String, Object> {
    public JsonRedisTemplate(RedisConnectionFactory redisConnectionFactory){
        super.setConnectionFactory(redisConnectionFactory);
        GenericJackson2JsonRedisSerializer serializer = new GenericJackson2JsonRedisSerializer();
        super.setKeySerializer(StringRedisSerializer.UTF_8);
        super.setValueSerializer(serializer);
        super.setHashKeySerializer(StringRedisSerializer.UTF_8);
        super.setHashValueSerializer(serializer);
    }
}
