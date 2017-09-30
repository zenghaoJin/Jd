package dao;

import org.apache.solr.client.solrj.SolrQuery;
import po.ProdModel;
import po.ResultModel;

/**
 * Created by 曾浩津 on 2017/9/19.
 */

public interface ProdDao {
    public ResultModel queryProd(SolrQuery solrQuery)throws Exception;
    public void delectProd(String id)throws Exception;
    public void updateProd(ProdModel prodModel)throws Exception;
}
