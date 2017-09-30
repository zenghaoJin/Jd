package service.JedisClient.impl;

import org.springframework.stereotype.Service;
import service.JedisClient.JedisClient;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * redis单机版实现类
 * Created by 曾浩津 on 2017/8/22.
 */
@Service
public class JedisClienSingle implements JedisClient {
    @Autowired
    private JedisPool jedisPool;

    @Override
    public String set(String key, String value) {
        System.out.println(jedisPool);
        Jedis jedis = jedisPool.getResource();
        String result = jedis.set(key,value);
        jedis.close();
        return result;
    }

    @Override
    public String get(String key) {
        Jedis jedis = jedisPool.getResource();
        String result = jedis.get(key);
        jedis.close();
        return result;
    }

    @Override
    public Long hset(String key, String item, String value) {
        Jedis jedis = jedisPool.getResource();
        Long result = jedis.hset(key,item,value);
        jedis.close();
        return result;
    }

    @Override
    public String hget(String key, String item) {
        Jedis jedis = jedisPool.getResource();
        String result = jedis.hget(key,item);
        jedis.close();
        return result;
    }

    @Override
    public Long incr(String key) {
        Jedis jedis = jedisPool.getResource();
        Long result = jedis.incr(key);
        jedis.close();
        return result;
    }

    @Override
    public Long decr(String key) {
        Jedis jedis = jedisPool.getResource();
        Long result = jedis.del(key);
        jedis.close();
        return result;
    }

    @Override
    public Long expire(String key, int second) {
        Jedis jedis = jedisPool.getResource();
        Long result = jedis.expire(key,second);
        jedis.close();
        return result;
    }

    @Override
    public Long ttl(String key) {
        Jedis jedis = jedisPool.getResource();
        Long result = jedis.ttl(key);
        jedis.close();
        return result;
    }

    @Override
    public Long hdel(String key, String item) {
        Jedis jedis = jedisPool.getResource();
        Long result = jedis.hdel(key,item);
        jedis.close();
        return result;
    }
}
