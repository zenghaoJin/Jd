package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdProdimg;
import po.JdProds;
import po.JdProdsExample;
import po.JdSizes;

public interface JdProdsMapper {
    int countByExample(JdProdsExample example);

    int deleteByExample(JdProdsExample example);

    int deleteByPrimaryKey(Integer proid);

    int insert(JdProds record);

    int insertSelective(JdProds record);

    List<JdProds> selectByExample(JdProdsExample example);

    JdProds selectByPrimaryKey(Integer proid);

    int updateByExampleSelective(@Param("record") JdProds record, @Param("example") JdProdsExample example);

    int updateByExample(@Param("record") JdProds record, @Param("example") JdProdsExample example);

    int updateByPrimaryKeySelective(JdProds record);

    int updateByPrimaryKey(JdProds record);

    List<JdProds> selectJdProds_thid(String thid);

    List<JdProds> selectJdProds();

    List<JdProds> selectJdProds_price();

    List<JdProds> selectJdProds_price2();

    List<JdProds> selectJdProds_thid_price();

    List<JdProds> selectJdProds_thid_price2();

    JdSizes selectOJdSizes(String sizeid);

    JdProdimg selectOJdProdimg(String pimgid);


}