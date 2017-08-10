package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.JdProds;
import po.JdProdsCartExample;
import po.JdProdsCartKey;

public interface JdProdsCartMapper {
    int countByExample(JdProdsCartExample example);

    int deleteByExample(JdProdsCartExample example);

    int deleteByPrimaryKey(JdProdsCartKey key);

    int insert(JdProdsCartKey record);

    int insertSelective(JdProdsCartKey record);

    List<JdProdsCartKey> selectByExample(JdProdsCartExample example);

    int updateByExampleSelective(@Param("record") JdProdsCartKey record, @Param("example") JdProdsCartExample example);

    int updateByExample(@Param("record") JdProdsCartKey record, @Param("example") JdProdsCartExample example);

    int selectcart(JdProdsCartKey jdProdsCartKey);

    int selectProdsnum(String cid);

    List<JdProds> selectJdProds(String cid);
}