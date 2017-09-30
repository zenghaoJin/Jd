package service;

import org.springframework.stereotype.Service;
import po.ProdModel;
import po.ResultModel;

/**
 * Created by 曾浩津 on 2017/9/19.
 */
public interface ProdService {
    public ResultModel query(String queryString,String brand,String sort,Integer page
            ,String mid,String tid,String thid)throws Exception;
    public void delectProd(String id)throws Exception;
    public void updateProd(ProdModel prodModel)throws Exception;
}
