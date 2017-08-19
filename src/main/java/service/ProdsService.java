package service;

import po.*;

import java.util.List;

/**
 * Created by 曾浩津 on 2017/7/29.
 */
public interface ProdsService {
    void insertProds(JdProds prods) throws Exception;
    void insertProdimg(JdProdimg jdProdimg) throws Exception;
    void insertSzies(JdSizes jdSizes) throws Exception;
    void insertZooming(JdZoomimg jdZoomimg) throws Exception;
    int s_login(JdStores jdStores) throws Exception;
    JdStores selectStores(String pname)throws Exception;
    void updateStores(JdStores jdStores) throws Exception;
    List<JdProds> selectJdprods(String stoid) throws Exception;
    List<JdProdimg> selectJdProdimg(String proid) throws Exception;
    List<JdZoomimg> selectZoomimg(String pimgid) throws Exception;
    List<JdSizes> selectSizes(String pimgid) throws Exception;
    JdProds selectOjdprods(String proid) throws Exception;
    int updateJdprods(JdProds jdProds)throws Exception;
    int updateJdsizes(JdSizes jdSizes)throws Exception;
    int deleteJdsizes(int sizeid)throws Exception;
    int updateJdProdimg(JdProdimg jdProdimg)throws Exception;
    int deleteJdProdimg(int pimgid)throws Exception;
    int updateJdZooming(JdZoomimg jdZoomimg)throws Exception;
    int deleteJdZooming(int zoomimgid)throws Exception;
    List<JdOrder> selectJdOrder(String stoid)throws Exception;
    void updateJdOrder_state(JdOrder jdOrder)throws Exception;
    JdSizes selectJdSizes(int sizeid)throws Exception;
    List<JdMessage> selectMessage(int stoid)throws Exception;
    void updateMessage(JdMessage jdMessage)throws Exception;
    void insertMessage(JdMessage jdMessage)throws Exception;
}
