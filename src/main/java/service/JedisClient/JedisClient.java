package service.JedisClient;

/**
 * Created by 曾浩津 on 2017/8/22.
 */
public interface JedisClient {
    String set(String key,String value);
    String get(String key);
    Long hset(String key,String item,String value);
    String hget(String key,String item);
    Long incr(String key);
    Long decr(String key);
    Long expire(String key,int second);
    Long ttl(String key);
    Long hdel(String key,String item);
}
