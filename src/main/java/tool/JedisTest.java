package tool;

import org.codehaus.jackson.map.ObjectMapper;
import po.JdMclass;
import po.JdThreeclass;
import po.JdTwoclass;
import service.JedisClient.JedisClient;
import service.JedisClient.impl.JedisClienSingle;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;
import java.util.Map;

/**
 * Created by 曾浩津 on 2017/8/23.
 */
public class JedisTest {
    //单机版
    @Test
    public void testJedisSingle()throws Exception{
        Jedis jedis = new Jedis("47.94.23.91",6379);
        jedis.auth("123456");
        jedis.set("test","hello jedis");
        String string = jedis.get("test");
        System.out.println(string);
        jedis.close();
    }
    //使用连接池
    @Test
    public void testJedisPool() throws Exception{
        //创建一个连接池对象
        //系统中应该是单例的
        JedisPool jedisPool = new JedisPool("47.94.23.91",6379);
        //从连接池中获得一个连接
        Jedis jedis = jedisPool.getResource();
        jedis.auth("123456");
        jedis.del("key");
//        Map<String, Object> map = JsonUtil.json2Map(test);
//        List<JdMclass> s1 = (List<JdMclass>) map.get("JdMclass");
//        List<JdTwoclass> s2 = (List<JdTwoclass>) map.get("JdTwoclass");
//        List<JdThreeclass> s3 = (List<JdThreeclass>) map.get("JdThreeclass");
        //jedis必须关闭
        jedis.close();
        //系统关闭时关闭连接池
        jedisPool.close();
    }
    @Test
    public void testJedisClientSpring() throws Exception{
        //创建一个spring容器
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext
                        ("classpath:spring/applicationContext-service.xml");
        //从容器中获取JedisClient对象
        JedisClient jedisClient = applicationContext.getBean(JedisClienSingle.class);
        jedisClient.set("cliet1","100");
        String string = jedisClient.get("cliet1");
        System.out.println(string);
    }
}
