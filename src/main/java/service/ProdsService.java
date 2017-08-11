package service;

import po.*;

import java.util.List;

/**
 * Created by 曾浩津 on 2017/7/29.
 */
public interface ProdsService {
    public void insertProds(JdProds prods) throws Exception;
    public void insertProdimg(JdProdimg jdProdimg) throws Exception;
    public void insertSzies(JdSizes jdSizes) throws Exception;
    public void insertZooming(JdZoomimg jdZoomimg) throws Exception;
    public int s_login(JdStores jdStores) throws Exception;
    public JdStores selectStores(String pname)throws Exception;
    public void updateStores(JdStores jdStores) throws Exception;
    public List<JdProds> selectJdprods(String stoid) throws Exception;
    public List<JdProdimg> selectJdProdimg(String proid) throws Exception;
    public List<JdZoomimg> selectZoomimg(String pimgid) throws Exception;
    public List<JdSizes> selectSizes(String pimgid) throws Exception;
    public JdProds selectOjdprods(String proid) throws Exception;
    public int updateJdprods(JdProds jdProds)throws Exception;
    public int updateJdsizes(JdSizes jdSizes)throws Exception;
    public int deleteJdsizes(int sizeid)throws Exception;
    public int updateJdProdimg(JdProdimg jdProdimg)throws Exception;
    public int deleteJdProdimg(int pimgid)throws Exception;
    public int updateJdZooming(JdZoomimg jdZoomimg)throws Exception;
    public int deleteJdZooming(int zoomimgid)throws Exception;
    List<JdOrder> selectJdOrder(String stoid)throws Exception;
    void updateJdOrder_state(JdOrder jdOrder)throws Exception;
    JdSizes selectJdSizes(int sizeid)throws Exception;
    List<JdMessage> selectMessage(int stoid)throws Exception;
    void updateMessage(JdMessage jdMessage)throws Exception;
    void insertMessage(JdMessage jdMessage)throws Exception;
}
