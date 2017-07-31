package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdProdimg;
import po.JdProdimgExample;

public interface JdProdimgMapper {
    int countByExample(JdProdimgExample example);

    int deleteByExample(JdProdimgExample example);

    int deleteByPrimaryKey(Integer pimgId);

    int insert(JdProdimg record);

    int insertSelective(JdProdimg record);

    List<JdProdimg> selectByExample(JdProdimgExample example);

    JdProdimg selectByPrimaryKey(Integer pimgId);

    int updateByExampleSelective(@Param("record") JdProdimg record, @Param("example") JdProdimgExample example);

    int updateByExample(@Param("record") JdProdimg record, @Param("example") JdProdimgExample example);

    int updateByPrimaryKeySelective(JdProdimg record);

    int updateByPrimaryKey(JdProdimg record);
}