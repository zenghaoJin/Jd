package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdOrder;
import po.JdOrderExample;

public interface JdOrderMapper {
    int countByExample(JdOrderExample example);

    int deleteByExample(JdOrderExample example);

    int deleteByPrimaryKey(Integer oid);

    int insert(JdOrder record);

    int insertSelective(JdOrder record);

    List<JdOrder> selectByExample(JdOrderExample example);

    JdOrder selectByPrimaryKey(Integer oid);

    int updateByExampleSelective(@Param("record") JdOrder record, @Param("example") JdOrderExample example);

    int updateByExample(@Param("record") JdOrder record, @Param("example") JdOrderExample example);

    int updateByPrimaryKeySelective(JdOrder record);

    int updateByPrimaryKey(JdOrder record);
}