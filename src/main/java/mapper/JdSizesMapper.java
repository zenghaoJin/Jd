package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdSizes;
import po.JdSizesExample;

public interface JdSizesMapper {
    int countByExample(JdSizesExample example);

    int deleteByExample(JdSizesExample example);

    int deleteByPrimaryKey(Integer sizeId);

    int insert(JdSizes record);

    int insertSelective(JdSizes record);

    List<JdSizes> selectByExample(JdSizesExample example);

    JdSizes selectByPrimaryKey(Integer sizeId);

    int updateByExampleSelective(@Param("record") JdSizes record, @Param("example") JdSizesExample example);

    int updateByExample(@Param("record") JdSizes record, @Param("example") JdSizesExample example);

    int updateByPrimaryKeySelective(JdSizes record);

    int updateByPrimaryKey(JdSizes record);
}