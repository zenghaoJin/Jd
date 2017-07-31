package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdProds;
import po.JdProdsExample;

public interface JdProdsMapper {
    int countByExample(JdProdsExample example);

    int deleteByExample(JdProdsExample example);

    int deleteByPrimaryKey(Integer proId);

    int insert(JdProds record);

    int insertSelective(JdProds record);

    List<JdProds> selectByExample(JdProdsExample example);

    JdProds selectByPrimaryKey(Integer proId);

    int updateByExampleSelective(@Param("record") JdProds record, @Param("example") JdProdsExample example);

    int updateByExample(@Param("record") JdProds record, @Param("example") JdProdsExample example);

    int updateByPrimaryKeySelective(JdProds record);

    int updateByPrimaryKey(JdProds record);
}