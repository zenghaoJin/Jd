package service.serviceimpl;

import dao.ProdDao;
import org.apache.solr.client.solrj.SolrQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.ProdModel;
import po.ResultModel;
import service.ProdService;

/**
 * Created by 曾浩津 on 2017/9/19.
 */
@Service
public class ProdServiceImpl implements ProdService{
    private static final Integer PAGE_SIZE = 6;
    @Autowired
    private ProdDao prodDao;

    @Override
    public ResultModel query(String queryString, String brand, String sort,Integer page
            ,String mid,String tid,String thid) throws Exception {
        //创建查询条件对象
        SolrQuery solrQuery = new SolrQuery();
        //设置默认搜索域
        solrQuery.set("df","prod_keywords");
        System.out.println("===========ServiceImpl============="+queryString);
        if(queryString != null && !"".equals(queryString)){
            solrQuery.setQuery(queryString);
        }else{
            solrQuery.setQuery("*:*");
        }
        //设置品牌分类
        if(brand != null && !"".equals(brand)){
            solrQuery.setFilterQueries("prod_brand:"+brand);
        }
        //设置商品分类
        if(mid != null && !"".equals(mid)){
            solrQuery.setFilterQueries("prod_mid:"+mid);
        }
        if(tid != null && !"".equals(tid)){
            solrQuery.setFilterQueries("prod_tid:"+tid);
        }
        if(thid != null && !"".equals(thid)){
            solrQuery.setFilterQueries("prod_thid:"+thid);
        }
        //设置排序
        if(sort!=null&&!"".equals(sort)){
            if ("1".equals(sort)){
                solrQuery.addSort("prod_price", SolrQuery.ORDER.asc);
             }else{
                solrQuery.addSort("prod_price", SolrQuery.ORDER.desc);
             }
        }
        //设置分页
        if(page == null){
            page = 1;
        }
        Integer start = (page - 1) * PAGE_SIZE;
        //从第几条开始
        solrQuery.setStart(start);
        //每条显示多少条
        solrQuery.setRows(PAGE_SIZE);
        //设置高亮设置
        solrQuery.setHighlight(true);
        //设置高亮显示的域
        solrQuery.addHighlightField("prod_name");
        //设置高亮前缀
        solrQuery.setHighlightSimplePre("<span style=\"color:red\">");
        solrQuery.setHighlightSimplePost("</span>");
        //查询返回结果
        ResultModel resultModel = prodDao.queryProd(solrQuery);
        //当前页数
        resultModel.setCurPage(page);
        //计算总页数
        System.out.println("---------------------"+resultModel.getCurPage());
        Long pageCount = resultModel.getRecordCount() / PAGE_SIZE;
        if(resultModel.getRecordCount() % PAGE_SIZE > 0){
            pageCount ++;
        }
        //设置页数
        resultModel.setPageCount(pageCount);
        return resultModel;
    }

    @Override
    public void delectProd(String id) throws Exception {
        prodDao.delectProd(id);
    }

    @Override
    public void updateProd(ProdModel prodModel) throws Exception {
        prodDao.updateProd(prodModel);
    }
}
