package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.*;

public interface JdStoresMapper {
    int countByExample(JdStoresExample example);

    int deleteByExample(JdStoresExample example);

    int deleteByPrimaryKey(Integer stoid);

    int insert(JdStores record);

    int insertSelective(JdStores record);

    List<JdStores> selectByExample(JdStoresExample example);

    JdStores selectByPrimaryKey(Integer stoid);

    int updateByExampleSelective(@Param("record") JdStores record, @Param("example") JdStoresExample example);

    int updateByExample(@Param("record") JdStores record, @Param("example") JdStoresExample example);

    int updateByPrimaryKeySelective(JdStores record);

    int updateByPrimaryKey(JdStores record);

    int findStores(JdStores jdStores);

    JdStores selectStores(String pname);

    List<JdProds> selectJdprods(String stoid);

    List<JdProdimg> selectJdprodImg(String proid);

    List<JdZoomimg> selectZoomimg(String pimgid);

    List<JdSizes> selectSizes(String pimgid);

    JdProds selectOjdprods(String proid);

    List<JdProds> selectSjdprods();

}