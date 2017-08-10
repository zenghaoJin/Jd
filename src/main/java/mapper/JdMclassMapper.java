package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdMclass;
import po.JdMclassExample;

public interface JdMclassMapper {
    int countByExample(JdMclassExample example);

    int deleteByExample(JdMclassExample example);

    int deleteByPrimaryKey(Integer mid);

    int insert(JdMclass record);

    int insertSelective(JdMclass record);

    List<JdMclass> selectByExample(JdMclassExample example);

    JdMclass selectByPrimaryKey(Integer mid);

    int updateByExampleSelective(@Param("record") JdMclass record, @Param("example") JdMclassExample example);

    int updateByExample(@Param("record") JdMclass record, @Param("example") JdMclassExample example);

    int updateByPrimaryKeySelective(JdMclass record);

    int updateByPrimaryKey(JdMclass record);

    int selectZjdMclass()throws Exception;

    List<JdMclass> selectJdMclass()throws Exception;

    int selectJdMclass_name(String name)throws Exception;
}