package service.serviceimpl;

import mapper.JdProdimgMapper;
import mapper.JdProdsMapper;
import mapper.JdSizesMapper;
import mapper.JdStoresMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.JdProdimg;
import po.JdProds;
import po.JdSizes;
import po.JdStores;
import service.ProdsService;

/**
 * Created by 曾浩津 on 2017/7/29.
 */
@Service
public class ProdsServiceImpl implements ProdsService{
    @Autowired
    private JdProdsMapper jdProdsMapper;
    @Autowired
    private JdProdimgMapper jdProdimgMapper;
    @Autowired
    private JdSizesMapper jdSizesMapper;
    @Autowired
    private JdStoresMapper jdStoresMapper;
    @Override
    public void insertProds(JdProds prods) throws Exception {
        jdProdsMapper.insert(prods);
    }

    @Override
    public void insertProdimg(JdProdimg jdProdimg) throws Exception {
        jdProdimgMapper.insert(jdProdimg);
    }

    @Override
    public void insertSzies(JdSizes jdSizes) throws Exception {
        jdSizesMapper.insert(jdSizes);
    }

    @Override
    public int s_login(JdStores jdStores) throws Exception {
        return jdStoresMapper.findStores(jdStores);
    }

    @Override
    public JdStores selectStores(String pname) throws Exception {
        return jdStoresMapper.selectStores(pname);
    }
}
