package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdUser;
import po.JdUserExample;

public interface JdUserMapper {
    int countByExample(JdUserExample example);

    int deleteByExample(JdUserExample example);

    int deleteByPrimaryKey(Integer uId);

    int insert(JdUser record);

    int insertSelective(JdUser record);

    List<JdUser> selectByExample(JdUserExample example);

    JdUser selectByPrimaryKey(Integer uId);

    int updateByExampleSelective(@Param("record") JdUser record, @Param("example") JdUserExample example);

    int updateByExample(@Param("record") JdUser record, @Param("example") JdUserExample example);

    int updateByPrimaryKeySelective(JdUser record);

    int updateByPrimaryKey(JdUser record);

    int findUser(JdUser jdUser);

    int findUserName(String name);

    void emailCheck(String name);

    JdUser select_Name(String name);

    int checkEmail(String email);
}