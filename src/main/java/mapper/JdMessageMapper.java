package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdMessage;
import po.JdMessageExample;

public interface JdMessageMapper {
    int countByExample(JdMessageExample example);

    int deleteByExample(JdMessageExample example);

    int deleteByPrimaryKey(Integer mid);

    int insert(JdMessage record);

    int insertSelective(JdMessage record);

    List<JdMessage> selectByExample(JdMessageExample example);

    JdMessage selectByPrimaryKey(Integer mid);

    int updateByExampleSelective(@Param("record") JdMessage record, @Param("example") JdMessageExample example);

    int updateByExample(@Param("record") JdMessage record, @Param("example") JdMessageExample example);

    int updateByPrimaryKeySelective(JdMessage record);

    int updateByPrimaryKey(JdMessage record);

    List<JdMessage> selectMessage(int stoid);

    List<JdMessage> selectMessage2(int uid);


}