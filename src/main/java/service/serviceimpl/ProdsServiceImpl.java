package service.serviceimpl;

import mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.*;
import service.ProdsService;

import java.util.List;

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
    @Autowired
    private JdZoomimgMapper jdZoomimgMapper;
    @Autowired
    private JdOrderStoresMapper jdOrderStoresMapper;
    @Autowired
    private JdOrderMapper jdOrderMapper;
    @Autowired
    private JdMessageMapper jdMessageMapper;
    @Override
    public List<JdOrder> selectJdOrder(String stoid) throws Exception {
        return jdOrderStoresMapper.selectJdOrder(stoid);
    }

    @Override
    public void updateJdOrder_state(JdOrder jdOrder) throws Exception {
        jdOrderMapper.updateByPrimaryKeySelective(jdOrder);
    }

    @Override
    public JdSizes selectJdSizes(int sizeid) throws Exception {
        return jdSizesMapper.selectByPrimaryKey(sizeid);
    }

    @Override
    public List<JdMessage> selectMessage(int stoid) throws Exception {
        return jdMessageMapper.selectMessage(stoid);
    }

    @Override
    public void updateMessage(JdMessage jdMessage) throws Exception {
        jdMessageMapper.updateByPrimaryKeySelective(jdMessage);
    }

    @Override
    public void insertMessage(JdMessage jdMessage) throws Exception {
        jdMessageMapper.insert(jdMessage);
    }

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
    public void insertZooming(JdZoomimg jdZoomimg) throws Exception {
        jdZoomimgMapper.insert(jdZoomimg);
    }

    @Override
    public int s_login(JdStores jdStores) throws Exception {
        return jdStoresMapper.findStores(jdStores);
    }

    @Override
    public JdStores selectStores(String pname) throws Exception {
        return jdStoresMapper.selectStores(pname);
    }

    @Override
    public void updateStores(JdStores jdStores) throws Exception {
        jdStoresMapper.updateByPrimaryKey(jdStores);
    }

    @Override
    public List<JdProds> selectJdprods(String stoid) throws Exception {
        return jdStoresMapper.selectJdprods(stoid);
    }

    @Override
    public List<JdProdimg> selectJdProdimg(String proid) throws Exception {
        return jdStoresMapper.selectJdprodImg(proid);
    }

    @Override
    public List<JdZoomimg> selectZoomimg(String pimgid) throws Exception {
        return jdStoresMapper.selectZoomimg(pimgid);
    }

    @Override
    public List<JdSizes> selectSizes(String pimgid) throws Exception {
        return jdStoresMapper.selectSizes(pimgid);
    }

    @Override
    public JdProds selectOjdprods(String proid) throws Exception {
        return jdStoresMapper.selectOjdprods(proid);
    }

    @Override
    public int updateJdprods(JdProds jdProds) throws Exception {
        return jdProdsMapper.updateByPrimaryKeySelective(jdProds);
    }

    @Override
    public int updateJdsizes(JdSizes jdSizes) throws Exception {
        return jdSizesMapper.updateByPrimaryKeySelective(jdSizes);
    }

    @Override
    public int deleteJdsizes(int sizeid) throws Exception {
        return jdSizesMapper.deleteByPrimaryKey(sizeid);
    }

    @Override
    public int updateJdProdimg(JdProdimg jdProdimg) throws Exception {
        return jdProdimgMapper.updateByPrimaryKeySelective(jdProdimg);
    }

    @Override
    public int deleteJdProdimg(int pimgid) throws Exception {
        return jdProdimgMapper.deleteByPrimaryKey(pimgid);
    }

    @Override
    public int updateJdZooming(JdZoomimg jdZoomimg) throws Exception {
        return jdZoomimgMapper.updateByPrimaryKeySelective(jdZoomimg);
    }

    @Override
    public int deleteJdZooming(int zoomimgid) throws Exception {
        return jdZoomimgMapper.deleteByPrimaryKey(zoomimgid);
    }


}
