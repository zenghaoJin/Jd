package service;

import com.sun.jna.platform.win32.OaIdl;
import org.springframework.ui.Model;
import po.*;

import java.util.List;

/**
 * Created by 曾浩津 on 2017/7/12.
 */
public interface UserService {
    int findUser(String name,String pass) throws Exception;
    int insertUser(JdUser jdUser) throws Exception;
    int updateUser(JdUser jdUser) throws Exception;
    int findUserName(String name) throws  Exception;
    void emailCheck(String name) throws Exception;
    JdUser select_Name(String name) throws Exception;
    int checkEmail(String email) throws Exception;
    JdUser select_Email(String email) throws Exception;
    void updateUser_name(JdUser user) throws Exception;
    List<JdMclass> selectJdMclass()throws Exception;
    List<JdTwoclass> selectJdTwoclass()throws Exception;
    List<JdThreeclass> selectJdThreeclass()throws Exception;
    List<JdProds> selectJdProds_thid(String thid)throws Exception;
    List<JdProds> selectJdProds()throws Exception;
    List<JdTwoclass> selectJdTwoclass(String  mid)throws Exception;
    List<JdThreeclass> selectJdThreeclass(String  tid)throws Exception;
    List<JdProdimg> selectJdProdimg(String proid)throws Exception;
    List<JdProds> selectJdProds_thid_price(String thid,String val)throws Exception;
    List<JdProds> selectJdProds_price(String val) throws Exception;
    void insertCart(String uid) throws Exception;
    JdCart selectCart(String uid)throws  Exception;
    void addcart(JdProdsCartKey jdProdsCartKey)throws Exception;
    int selectcart(JdProdsCartKey jdProdsCartKey)throws Exception;
    int selectProdsnum(String cid)throws Exception;
    List<JdProds> selectJdProds(String cid)throws Exception;
    List<JdSizes> selectJdSizes(String pimgid)throws Exception;
    List<JdSizes> selectSize(String pimgid)throws Exception;
    void delectCart(JdProdsCartKey jdProdsCartKey)throws Exception;
    JdUser selectmoney(String uid)throws Exception;
    JdProds selectOJdProds(String proid)throws Exception;
    JdSizes selectOJdSizes(String sizeid)throws Exception;
    JdProdimg selectOJdProdimg(String pimgid)throws Exception;
    void insertJdOrder(JdOrder jdOrder)throws Exception;
    void intsertJdOrderProds(JdOrderProdsKey jdOrderProdsKey)throws Exception;
    void intsertJdOrderStores(JdOrderStoresKey jdOrderStoresKey)throws Exception;
    void updateJdSizes(JdSizes jdSizes)throws Exception;
    List<JdOrder> selectJdOrderUser(int uid)throws Exception;
    int selectStoid(int oid)throws Exception;
    void insertMessage(JdMessage jdMessage)throws Exception;
    List<JdMessage> selectMessage2(int uid)throws Exception;
    List<JdProds> selectJdProd2(String  brand)throws Exception;
}
