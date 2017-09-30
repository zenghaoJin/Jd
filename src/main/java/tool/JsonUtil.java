package tool;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;

import java.util.List;
import java.util.Map;

/**
 * Created by 曾浩津 on 2017/9/13.
 */
public class JsonUtil {
    private static ObjectMapper objectMapper = new ObjectMapper();

    //实体类转Json
    public static <T> String bean2Json(T bean) {
        try {
            return objectMapper.writeValueAsString(bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    //map转json
    public static String map2Json(String map) {
        try {
            return objectMapper.writeValueAsString(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    //list转json
    public static String list2Json(List list) {
        try {
            return objectMapper.writeValueAsString(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    //json转实体类
    public static <T> T json2Bean(String json, Class<T> beanClass) {
        try {
            return objectMapper.readValue(json, beanClass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //json转list
    public static <T> List<T> json2List(String json, Class<T> beanClass) {
        try {
            return (List<T>)objectMapper.readValue(json, getCollectionType(List.class, beanClass));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //json转map
    public static Map json2Map(String json) {
        try {
            return (Map)objectMapper.readValue(json, Map.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) {
        return objectMapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
    }
}
