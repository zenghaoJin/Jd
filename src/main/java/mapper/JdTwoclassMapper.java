package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdMclass;
import po.JdTwoclass;
import po.JdTwoclassExample;

public interface JdTwoclassMapper {
    int countByExample(JdTwoclassExample example);

    int deleteByExample(JdTwoclassExample example);

    int deleteByPrimaryKey(Integer tid);

    int insert(JdTwoclass record);

    int insertSelective(JdTwoclass record);

    List<JdTwoclass> selectByExample(JdTwoclassExample example);

    JdTwoclass selectByPrimaryKey(Integer tid);

    int updateByExampleSelective(@Param("record") JdTwoclass record, @Param("example") JdTwoclassExample example);

    int updateByExample(@Param("record") JdTwoclass record, @Param("example") JdTwoclassExample example);

    int updateByPrimaryKeySelective(JdTwoclass record);

    int updateByPrimaryKey(JdTwoclass record);

//    List<JdMclass> selectJdMclass()throws Exception;

    int selectJdTwoclass_name(JdTwoclass jdTwoclass)throws Exception;

    List<JdTwoclass> selectJdTwoclass(String  mid)throws Exception;

    List<JdTwoclass> selectZjdTwoclass() throws Exception;
}