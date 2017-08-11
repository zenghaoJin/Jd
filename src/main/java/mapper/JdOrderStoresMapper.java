package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdOrder;
import po.JdOrderStoresExample;
import po.JdOrderStoresKey;

public interface JdOrderStoresMapper {
    int countByExample(JdOrderStoresExample example);

    int deleteByExample(JdOrderStoresExample example);

    int deleteByPrimaryKey(JdOrderStoresKey key);

    int insert(JdOrderStoresKey record);

    int insertSelective(JdOrderStoresKey record);

    List<JdOrderStoresKey> selectByExample(JdOrderStoresExample example);

    int updateByExampleSelective(@Param("record") JdOrderStoresKey record, @Param("example") JdOrderStoresExample example);

    int updateByExample(@Param("record") JdOrderStoresKey record, @Param("example") JdOrderStoresExample example);

    List<JdOrder> selectJdOrder(String stoid);

    List<JdOrder> selectJdOrder_User(int uid);

    int selectStoid(int oid);
}