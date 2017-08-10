package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdCart;
import po.JdCartExample;

public interface JdCartMapper {
    int countByExample(JdCartExample example);

    int deleteByExample(JdCartExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(JdCart record);

    int insertSelective(JdCart record);

    List<JdCart> selectByExample(JdCartExample example);

    JdCart selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") JdCart record, @Param("example") JdCartExample example);

    int updateByExample(@Param("record") JdCart record, @Param("example") JdCartExample example);

    int updateByPrimaryKeySelective(JdCart record);

    int updateByPrimaryKey(JdCart record);

    JdCart selectCart(String uid);
}