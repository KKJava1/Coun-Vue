package com.jiawa.wiki.util;

import com.jiawa.wiki.resp.StatisticResp;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Component
public class RedisUtil {

    private static final Logger LOG = LoggerFactory.getLogger(RedisUtil.class);

    @Resource
    private RedisTemplate redisTemplate;

    /**
     * true：不存在，放一个KEY
     * false：已存在
     * @param key
     * @param second
     * @return
     */
    public boolean validateRepeat(String key, long second) {
        if (redisTemplate.hasKey(key)) {
            LOG.info("key已存在：{}", key);
            return false;
        } else {
            LOG.info("key不存在，放入：{}，过期 {} 秒", key, second);
            redisTemplate.opsForValue().set(key, key, second, TimeUnit.SECONDS);
            return true;
        }
    }

    /**
     * 保存用户的浏览记录到Redis中
     * @param userId
     * @param docId
     * @param expireTime 过期时间，单位为秒
     */
    public void saveUserLastReadDoc(Long userId, Long docId, long expireTime) {
        String key = "user:" + userId + ":lastReadDoc";
        redisTemplate.opsForValue().set(key, docId, expireTime, TimeUnit.SECONDS);
        LOG.info("保存用户 {} 的浏览记录到Redis，docId：{}，过期时间：{}秒", userId, docId, expireTime);
    }

    /**
     * 清空redis
     */
    public static void cleanRedis() {
        StringRedisTemplate stringRedisTemplate = ApplicationContextRegister.getBean(StringRedisTemplate.class);
        stringRedisTemplate.execute((RedisCallback<Object>) connection -> {
            connection.flushDb();
            return null;
        });
    }

    /**
     * 从Redis中获取用户的最后一次浏览记录
     * @param userId
     * @return 用户的最后一次浏览的docId，如果不存在，则返回null
     */
    public String getUserLastReadDoc(Long userId) {
        String key = "user:" + userId + ":lastReadDoc";
        return (String) redisTemplate.opsForValue().get(key);
    }

    public List<StatisticResp> getStatisticFromRedis(String key) {
        return (List<StatisticResp>) redisTemplate.opsForValue().get(key);
    }


    public void setStatisticToRedis(String key, List<StatisticResp> statisticResp, long expireTime) {
        redisTemplate.opsForValue().set(key, statisticResp, expireTime, TimeUnit.SECONDS);
    }


}
