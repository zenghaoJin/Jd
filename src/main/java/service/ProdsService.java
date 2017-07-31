package service;

import po.JdProdimg;
import po.JdProds;
import po.JdSizes;
import po.JdStores;

/**
 * Created by 曾浩津 on 2017/7/29.
 */
public interface ProdsService {
    public void insertProds(JdProds prods) throws Exception;
    public void insertProdimg(JdProdimg jdProdimg) throws Exception;
    public void insertSzies(JdSizes jdSizes) throws Exception;
    public int s_login(JdStores jdStores) throws Exception;
    public JdStores selectStores(String pname)throws Exception;
}
