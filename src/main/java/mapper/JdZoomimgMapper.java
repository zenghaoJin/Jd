package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdZoomimg;
import po.JdZoomimgExample;

public interface JdZoomimgMapper {
    int countByExample(JdZoomimgExample example);

    int deleteByExample(JdZoomimgExample example);

    int deleteByPrimaryKey(Integer zoomimgid);

    int insert(JdZoomimg record);

    int insertSelective(JdZoomimg record);

    List<JdZoomimg> selectByExample(JdZoomimgExample example);

    JdZoomimg selectByPrimaryKey(Integer zoomimgid);

    int updateByExampleSelective(@Param("record") JdZoomimg record, @Param("example") JdZoomimgExample example);

    int updateByExample(@Param("record") JdZoomimg record, @Param("example") JdZoomimgExample example);

    int updateByPrimaryKeySelective(JdZoomimg record);

    int updateByPrimaryKey(JdZoomimg record);
}