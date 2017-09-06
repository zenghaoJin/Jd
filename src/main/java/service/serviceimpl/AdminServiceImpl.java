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

    @Override
    public void saveJdclass(String[] mClass,String[] tClass,String[] thClass) throws Exception {
        if(mClass!=null&&tClass!=null&&thClass!=null){
        for(int i=0;i<mClass.length;i++){
            JdMclass jdMclass = new JdMclass();
            if(jdMclassMapper.selectJdMclass_name(mClass[i])<1){
                jdMclass.setName(mClass[i]);
                jdMclassMapper.insert(jdMclass);
            }
        }
        for(int i=0;i<tClass.length;i++){
            System.out.println("第二个"+tClass[i]);
            String[] tClassName = tClass[i].split("/");
            System.out.println(tClassName[0]+"====================="+tClassName[1]);
            JdTwoclass jdTwoclass = new JdTwoclass();
            String mid = jdMclassMapper.selectJdMclass_name2(tClassName[1]);
            if(mid==null){
                throw new JdException("输入有误！！！");
            }
            if(jdTwoclassMapper.selectJdTwoclass_name2(tClassName[0],Integer.parseInt(mid))<1){
                jdTwoclass.setMid(Integer.parseInt(mid));
                jdTwoclass.setName(tClassName[0]);
                jdTwoclassMapper.insert(jdTwoclass);
            }
        }
        for(int i=0;i<thClass.length;i++){
            System.out.println("第三个"+thClass[i]);
            String[] thClassName = thClass[i].split("/");
            JdThreeclass jdThreeclass = new JdThreeclass();
            String mid = jdMclassMapper.selectJdMclass_name2(thClassName[2]);
            if(mid==null){
                throw new JdException("输入有误！！！");
            }
            String tid = jdTwoclassMapper.selectJdTwoclass_name3(thClassName[1],Integer.parseInt(mid));
            if(tid==null){
                throw new JdException("输入有误！！！");
            }
            if(jdThreeclassMapper.selectJdThclass_name(thClassName[0],Integer.parseInt(tid))<1){
                System.out.println(tid+"=============="+thClassName[0]);
                jdThreeclass.setName(thClassName[0]);
                jdThreeclass.setTid(Integer.parseInt(tid));
                jdThreeclassMapper.insert(jdThreeclass);
            }
            }
        }else{
            throw new JdException("输入有误！！！");
        }
    }
}
