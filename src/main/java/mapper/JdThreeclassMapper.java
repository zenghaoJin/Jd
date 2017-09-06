package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdThreeclass;
import po.JdThreeclassExample;

public interface JdThreeclassMapper {
    int countByExample(JdThreeclassExample example);

    int deleteByExample(JdThreeclassExample example);

    int deleteByPrimaryKey(Integer thid);

    int insert(JdThreeclass record);

    int insertSelective(JdThreeclass record);

    List<JdThreeclass> selectByExample(JdThreeclassExample example);

    JdThreeclass selectByPrimaryKey(Integer thid);

    int updateByExampleSelective(@Param("record") JdThreeclass record, @Param("example") JdThreeclassExample example);

    int updateByExample(@Param("record") JdThreeclass record, @Param("example") JdThreeclassExample example);

    int updateByPrimaryKeySelective(JdThreeclass record);

    int updateByPrimaryKey(JdThreeclass record);

    int selectJdThreeclass_name(JdThreeclass jdThreeclass)throws Exception;

    List<JdThreeclass> selectJdThreeclass(String  tid)throws Exception;

    List<JdThreeclass> selectZjdThreeclass()throws Exception;

    int selectJdThclass_name(String name,int tid)throws Exception;
}