package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdAdmin;
import po.JdAdminExample;

public interface JdAdminMapper {
    int countByExample(JdAdminExample example);

    int deleteByExample(JdAdminExample example);

    int deleteByPrimaryKey(Integer aId);

    int insert(JdAdmin record);

    int insertSelective(JdAdmin record);

    List<JdAdmin> selectByExample(JdAdminExample example);

    JdAdmin selectByPrimaryKey(Integer aId);

    int updateByExampleSelective(@Param("record") JdAdmin record, @Param("example") JdAdminExample example);

    int updateByExample(@Param("record") JdAdmin record, @Param("example") JdAdminExample example);

    int updateByPrimaryKeySelective(JdAdmin record);

    int updateByPrimaryKey(JdAdmin record);

    int findAdmin(JdAdmin JdAdmin);
}