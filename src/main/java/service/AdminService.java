package service;

import po.*;

import java.util.List;

/**
 * Created by 曾浩津 on 2017/7/12.
 */
public interface AdminService {
    public int selectJdAdmin(JdAdmin jdAdmin) throws Exception;
    public int selectZjdMclass()throws Exception;
    public List<JdMclass> selectJdMclass()throws Exception;
    public void addJdMclass(JdMclass jdMclass)throws Exception;
    public int selectJdMclass_name(String name)throws Exception;
    public void addJdTwoclass(JdTwoclass jdTwoclass)throws Exception;
    public int selectJdTwoclass_name(JdTwoclass jdTwoclass)throws Exception;
    public List<JdTwoclass> selectJdTwoclass(String  mid)throws Exception;
    public int selectJdThreeclass_name(JdThreeclass jdThreeclass)throws Exception;
    public void addJdThreeclass(JdThreeclass jdThreeclass) throws Exception;
    public List<JdThreeclass> selectJdThreeclass(String tid)throws Exception;
    public List<JdProds> selectJdProds()throws Exception;
    public void updateJdprods(String thid,String proid)throws Exception;
    public void updateJdMclass(JdMclass jdMclass)throws Exception;
    public void updateJdTwoclass(JdTwoclass jdTwoclass)throws Exception;
    public void updateJdThreeclass(JdThreeclass jdThreeclass)throws Exception;
    public void saveJdclass(String[] mClass,String[] tClass,String[] thClass)throws Exception;
}
