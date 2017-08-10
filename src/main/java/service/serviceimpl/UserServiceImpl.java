package service.serviceimpl;

import mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.*;
import service.UserService;

import java.util.List;

/**
 * Created by 曾浩津 on 2017/7/12.
 */
@Service
public class  UserServiceImpl implements UserService{
    @Autowired
    private JdUserMapper jdUserMapper;
    @Autowired
    private JdMclassMapper jdMclassMapper;
    @Autowired
    private JdTwoclassMapper jdTwoclassMapper;
    @Autowired
    private JdThreeclassMapper jdThreeclassMapper;
    @Autowired
    private JdProdsMapper jdProdsMapper;
    @Autowired
    private JdStoresMapper jdStoresMapper;
    @Autowired
    private JdCartMapper jdCartMapper;
    @Autowired
    private JdProdsCartMapper jdProdsCartMapper;
    @Autowired
    private JdOrderMapper jdOrderMapper;
    @Autowired
    private JdOrderStoresMapper jdOrderStoresMapper;
    @Autowired
    private JdOrderProdsMapper jdOrderProdsMapper;
    @Autowired
    private JdSizesMapper jdSizesMapper;
    public int findUser(String username,String pass) throws Exception{
        JdUser jdUser = new JdUser();
        jdUser.setName(username);
        jdUser.setPass(pass);
        return  jdUserMapper.findUser(jdUser);
    };
    public int insertUser(JdUser jdUser) throws Exception{
        return jdUserMapper.insert(jdUser);
    }

    @Override
    public int updateUser(JdUser jdUser) throws Exception {
        return jdUserMapper.updateByPrimaryKeySelective(jdUser);
    }

    ;
    public int findUserName(String name) throws  Exception{
        return jdUserMapper.findUserName(name);
    };
    public void emailCheck(String name) throws Exception{
        jdUserMapper.emailCheck(name);
    }
    public JdUser select_Name(String name) throws Exception {
        return jdUserMapper.select_Name(name);
    }
    public int checkEmail(String email) throws Exception{
        return jdUserMapper.checkEmail(email);
    }
    public JdUser select_Email(String email) throws Exception {
        return jdUserMapper.select_Email(email);
    }
    public void updateUser_name(JdUser user) throws Exception {
        jdUserMapper.updateUser(user);
    }

    @Override
    public List<JdMclass> selectJdMclass() throws Exception {
        return jdMclassMapper.selectJdMclass();
    }

    @Override
    public List<JdTwoclass> selectJdTwoclass() throws Exception {
        return jdTwoclassMapper.selectZjdTwoclass();
    }

    @Override
    public List<JdThreeclass>selectJdThreeclass() throws Exception {
        return jdThreeclassMapper.selectZjdThreeclass();
    }

    @Override
    public List<JdProds> selectJdProds_thid(String thid) throws Exception {
        return jdProdsMapper.selectJdProds_thid(thid);
    }

    @Override
    public List<JdProds> selectJdProds() throws Exception {
        return jdProdsMapper.selectJdProds();
    }

    @Override
    public List<JdTwoclass> selectJdTwoclass(String mid) throws Exception {
        return jdTwoclassMapper.selectJdTwoclass(mid);
    }

    @Override
    public List<JdThreeclass> selectJdThreeclass(String tid) throws Exception {
        return jdThreeclassMapper.selectJdThreeclass(tid);
    }

    @Override
    public List<JdProdimg> selectJdProdimg(String proid) throws Exception {
        return jdStoresMapper.selectJdprodImg(proid);
    }

    @Override
    public List<JdProds> selectJdProds_thid_price(String thid, String val) throws Exception {
        if(val.equals("1")){
            return jdProdsMapper.selectJdProds_thid_price();
        }else{
            return jdProdsMapper.selectJdProds_thid_price2();
        }
    }

    @Override
    public List<JdProds> selectJdProds_price(String val) throws Exception {
        if(val.equals("1")){
            return jdProdsMapper.selectJdProds_price();
        }else{
            return jdProdsMapper.selectJdProds_price2();
        }
    }

    @Override
    public void insertCart(String uid) throws Exception {
        JdCart s1 = new JdCart();
        s1.setUid(Integer.parseInt(uid));
        jdCartMapper.insert(s1);
    }

    @Override
    public JdCart selectCart(String uid) throws Exception {
        return jdCartMapper.selectCart(uid);
    }

    @Override
    public void addcart(JdProdsCartKey jdProdsCartKey) throws Exception {
        jdProdsCartMapper.insertSelective(jdProdsCartKey);
    }

    @Override
    public int selectcart(JdProdsCartKey jdProdsCartKey) throws Exception {
        return jdProdsCartMapper.selectcart(jdProdsCartKey);
    }

    @Override
    public int selectProdsnum(String cid) throws Exception {
        return jdProdsCartMapper.selectProdsnum(cid);
    }

    @Override
    public List<JdProds> selectJdProds(String cid) throws Exception {
        return jdProdsCartMapper.selectJdProds(cid);
    }

    @Override
    public List<JdSizes> selectJdSizes(String pimgid) throws Exception {
        return jdStoresMapper.selectSizes(pimgid);
    }

    @Override
    public List<JdSizes> selectSize(String pimgid) throws Exception {
        return jdStoresMapper.selectSizes(pimgid);
    }

    @Override
    public void delectCart(JdProdsCartKey jdProdsCartKey) throws Exception {
        jdProdsCartMapper.deleteByPrimaryKey(jdProdsCartKey);
    }

    @Override
    public JdUser selectmoney(String uid) throws Exception {
        return jdUserMapper.selectmoney(uid);
    }

    @Override
    public JdProds selectOJdProds(String proid) throws Exception {
        return jdProdsMapper.selectByPrimaryKey(Integer.parseInt(proid));
    }

    @Override
    public JdSizes selectOJdSizes(String sizeid) throws Exception {
        return jdProdsMapper.selectOJdSizes(sizeid);
    }

    @Override
    public JdProdimg selectOJdProdimg(String pimgid) throws Exception {
        return jdProdsMapper.selectOJdProdimg(pimgid);
    }

    @Override
    public void insertJdOrder(JdOrder jdOrder) throws Exception {
        jdOrderMapper.insert(jdOrder);
    }

    @Override
    public void intsertJdOrderProds(JdOrderProdsKey jdOrderProdsKey) throws Exception {
        jdOrderProdsMapper.insert(jdOrderProdsKey);
    }

    @Override
    public void intsertJdOrderStores(JdOrderStoresKey jdOrderStoresKey) throws Exception {
        jdOrderStoresMapper.insert(jdOrderStoresKey);
    }

    @Override
    public void updateJdSizes(JdSizes jdSizes) throws Exception {
        jdSizesMapper.updateByPrimaryKeySelective(jdSizes);
    }


}
