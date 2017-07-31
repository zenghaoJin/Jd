package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdStores;
import po.JdStoresExample;

public interface JdStoresMapper {
    int countByExample(JdStoresExample example);

    int deleteByExample(JdStoresExample example);

    int deleteByPrimaryKey(Integer stoId);

    int insert(JdStores record);

    int insertSelective(JdStores record);

    List<JdStores> selectByExample(JdStoresExample example);

    JdStores selectByPrimaryKey(Integer stoId);

    int updateByExampleSelective(@Param("record") JdStores record, @Param("example") JdStoresExample example);

    int updateByExample(@Param("record") JdStores record, @Param("example") JdStoresExample example);

    int updateByPrimaryKeySelective(JdStores record);

    int updateByPrimaryKey(JdStores record);

    int findStores(JdStores jdStores);

    JdStores selectStores(String pname);
}