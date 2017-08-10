package service.serviceimpl;

/**
 * Created by 曾浩津 on 2017/7/12.
 */

import com.sun.org.apache.bcel.internal.generic.NEW;
import mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.*;
import service.AdminService;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    private JdAdminMapper jdAdminMapper;
    @Autowired
    private JdMclassMapper jdMclassMapper;
    @Autowired
    private JdTwoclassMapper jdTwoclassMapper;
    @Autowired
    private JdThreeclassMapper jdThreeclassMapper;
    @Autowired
    private JdStoresMapper jdStoresMapper;
    @Autowired
    private JdProdsMapper jdProdsMapper;
    @Override
    public int selectJdAdmin(JdAdmin jdAdmin) throws Exception {
        return jdAdminMapper.selectJdAdmin(jdAdmin);
    }

    @Override
    public int selectZjdMclass() throws Exception {
        return jdMclassMapper.selectZjdMclass();
    }

    @Override
    public List<JdMclass> selectJdMclass() throws Exception {
        return jdMclassMapper.selectJdMclass();
    }

    @Override
    public void addJdMclass(JdMclass jdMclass) throws Exception {
        jdMclassMapper.insert(jdMclass);
    }

    @Override
    public int selectJdMclass_name(String name) throws Exception {
        return jdMclassMapper.selectJdMclass_name(name);
    }

    @Override
    public void addJdTwoclass(JdTwoclass jdTwoclass) throws Exception {
        jdTwoclassMapper.insert(jdTwoclass);
    }

    @Override
    public int selectJdTwoclass_name(JdTwoclass jdTwoclass) throws Exception {
        return jdTwoclassMapper.selectJdTwoclass_name(jdTwoclass);
    }

    @Override
    public List<JdTwoclass> selectJdTwoclass(String mid) throws Exception {
        return jdTwoclassMapper.selectJdTwoclass(mid);
    }

    @Override
    public int selectJdThreeclass_name(JdThreeclass jdThreeclass) throws Exception {
        return jdThreeclassMapper.selectJdThreeclass_name(jdThreeclass);
    }

    @Override
    public void addJdThreeclass(JdThreeclass jdThreeclass) throws Exception {
        jdThreeclassMapper.insert(jdThreeclass);
    }

    @Override
    public List<JdThreeclass> selectJdThreeclass(String tid) throws Exception {
        return jdThreeclassMapper.selectJdThreeclass(tid);
    }

    @Override
    public List<JdProds> selectJdProds() throws Exception {
        return jdStoresMapper.selectSjdprods();
    }

    @Override
    public void updateJdprods(String thid, String proid) throws Exception {
        JdProds s1 = new JdProds();
        s1.setThid(Integer.parseInt(thid));
        s1.setProid(Integer.parseInt(proid));
        jdProdsMapper.updateByPrimaryKeySelective(s1);
    }

    @Override
    public void updateJdMclass(JdMclass jdMclass) throws Exception {
        jdMclassMapper.updateByPrimaryKeySelective(jdMclass);
    }

    @Override
    public void updateJdTwoclass(JdTwoclass jdTwoclass) throws Exception {
        jdTwoclassMapper.updateByPrimaryKeySelective(jdTwoclass);
    }

    @Override
    public void updateJdThreeclass(JdThreeclass jdThreeclass) throws Exception {
        jdThreeclassMapper.updateByPrimaryKeySelective(jdThreeclass);
    }
}
