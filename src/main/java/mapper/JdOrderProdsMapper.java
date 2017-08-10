package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdOrderProdsExample;
import po.JdOrderProdsKey;

public interface JdOrderProdsMapper {
    int countByExample(JdOrderProdsExample example);

    int deleteByExample(JdOrderProdsExample example);

    int deleteByPrimaryKey(JdOrderProdsKey key);

    int insert(JdOrderProdsKey record);

    int insertSelective(JdOrderProdsKey record);

    List<JdOrderProdsKey> selectByExample(JdOrderProdsExample example);

    int updateByExampleSelective(@Param("record") JdOrderProdsKey record, @Param("example") JdOrderProdsExample example);

    int updateByExample(@Param("record") JdOrderProdsKey record, @Param("example") JdOrderProdsExample example);
}